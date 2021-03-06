module Spree
  # Gateway for card payment method using stripe
  class Gateway::StripeGateway < PaymentMethod
    attr_accessor :publishable_key, :secret_key
    
    preference :publishable_key, :string
    preference :secret_key, :string
    preference :signing_secret, :string

    def publishable_key
      ENV['PUBLISHABLE_KEY'] || preferred_publishable_key
    end

    def secret_key
      ENV['SECRET_KEY'] || preferred_secret_key
    end

    def signing_secret
      ENV['SIGNING_SECRET'] || preferred_signing_secret
    end

    def provider_class
      self.class
    end

    def source_required?
      true
    end

    def payment_source_class
      Spree::StripePaymentSource
    end

    def auto_capture?
      false
    end

    def actions
      %w{void}
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      !payment.void?
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      payment.pending? || payment.checkout?
    end

    def method_type
      "stripe"
    end

    def stripe_provider
      ::Stripe.api_key = secret_key

      ::Stripe
    end

    def create_ephemeral_key(source)
      customer_id = create_customer_id(source.user)

      ephemeral_key = stripe_provider::EphemeralKey.create(
        { customer: customer_id },
        { stripe_version: '2020-08-27' }
      )

      ephemeral_key.secret
    end

    def cancel(payment_source)
      response = stripe_provider::PaymentIntent.cancel(payment_source.intent_id)
      
      if (response.status == "canceled")
        payment_source.update(status: "canceled")
        ActiveMerchant::Billing::Response.new(true, 'Stripe payment cancellation success.')
      else
        ActiveMerchant::Billing::Response.new(false, 'Stripe payment cancellation failed.')    
      end
    end
    
    def refund(payment_source)
      response = stripe_provider::Refund.create({
        payment_intent: payment_source.intent_id
        })
        
      if (response.status == "succeeded")
        payment_source.update(status: "refunded")
        ActiveMerchant::Billing::Response.new(true, 'Stripe payment refund success.')
      else
        ActiveMerchant::Billing::Response.new(false, 'Stripe payment refund failed.')    
      end
    end

    def authorize(amount, source, options = {})
      payment_intent = create_payment_intent(amount, source)

      if (payment_intent.client_secret)
        source.intent_id = payment_intent.id
        source.intent_key = payment_intent.client_secret
        source.created = payment_intent.created
        source.status = payment_intent.status
        source.save!

        ActiveMerchant::Billing::Response.new(true, 'Stripe payment intent created.')
      else
        ActiveMerchant::Billing::Response.new(false, 'Failed to create stripe payment intent.')
      end
    end

    def capture(*_args)
      ActiveMerchant::Billing::Response.new(true, 'Stripe will automatically capture the amount after creating a shipment.')
    end

    private

    def create_customer_id(user)
      if user.stripe_customer_id.present?
        user.stripe_customer_id
      else
        customer = stripe_provider::Customer.create
        user.stripe_customer_id = customer.id
        user.save!
        
        customer.id
      end
    end

    def create_payment_intent(amount, source)
      customer_id = create_customer_id(source.user)

      stripe_provider::PaymentIntent.create({
        amount: amount,
        currency: 'sgd',
        customer: customer_id
      })
    end
  end
end
