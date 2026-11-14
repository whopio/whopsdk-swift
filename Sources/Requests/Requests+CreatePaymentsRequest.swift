import Foundation

extension Requests {
    public struct CreatePaymentsRequest: Codable, Hashable, Sendable {
        /// The account the purchase belongs to, prefixed `biz_`.
        public let accountId: String
        /// The promo code as the buyer typed it, matched within the account regardless of case and surrounding spaces, as checkout matches it. It must be valid for the variant. Send it or `promo_code_id`, not both; an empty or whitespace-only string counts as not sent. A code the account does not have, or one that is no longer active, is refused before anything is written, with the error code `promo_invalid`. A code this purchase cannot use, such as one with no uses left or one restricted to other variants, products or buyers, is refused with `promo_invalid` too, and the error's message says why.
        public let promoCode: Nullable<String>?
        /// An active promo code to apply, prefixed `promo_`. It must belong to the account and be valid for the variant. Send it or `promo_code`, not both. A code this purchase cannot use is refused with the error code `promo_invalid`, and the error's message says why.
        public let promoCodeId: Nullable<String>?
        /// The variant purchased, described by its attributes instead of an id: the variant with exactly these attributes is used, and one is created when none exists. Mutually exclusive with `variant_id` and `line_items`. Creating a variant requires `plan:create`; creating or updating a product requires the corresponding product permission.
        public let variant: PaymentInputVariant?
        /// The variant purchased, prefixed `plan_`. It must belong to the account. Mutually exclusive with `variant` and `line_items`.
        public let variantId: String?
        /// The code an affiliate link carries, which is the affiliate's username. The affiliate is credited for this payment as on a checkout session. A code naming no one eligible to earn on the product is ignored, and the payment goes ahead. A promo code with its own affiliate takes precedence. No affiliate is credited on a variant without a product or on a purchase of several variants. At most 255 characters. Not supported with a `card_present` `payment_method`.
        public let affiliateCode: Nullable<String>?
        /// Minutes after authorization at which Whop captures the hold automatically unless it has been voided. Requires `capture: false`. Between 5 and 5760 (4 days).
        public let autoCaptureAfterMinutes: Nullable<Int>?
        /// The buyer's billing address, returned on the payment as `billing_address` and used to calculate tax when Whop calculates it for the account. Only with a `paypal` `payment_method`. Only the keys you supply are kept.
        public let billingAddress: Nullable<CreatePaymentsRequestBillingAddress>?
        /// Whether to capture a card payment immediately. Defaults to true. Pass false to place an authorization hold that must be captured in full within five days via the capture endpoint, or automatically after `auto_capture_after_minutes`.
        public let capture: Nullable<Bool>?
        /// A confirmation token describing a payment method the buyer just supplied. Provide this instead of `member_id` and `payment_method_id`; the buyer is resolved from the token's billing email, or from `email`. The buyer may still have a step to complete — poll the payment's status for what to do next.
        public let confirmationToken: Nullable<String>?
        /// The buyer's email, resolving or creating the user the payment belongs to. With `confirmation_token` it overrides the email the token carries, and is ignored when the token was created by a signed-in buyer; with a `card_present` `payment_method` it names a buyer the point of sale already knows, otherwise the sale belongs to a guest until a buyer is attached; with a `paypal` `payment_method` it names the buyer, and when it and `member_id` are both omitted the buyer is the PayPal account that approves the payment. Ignored with `member_id`.
        public let email: Nullable<String>?
        /// The buyer's IPv4 or IPv6 address, used to assess the charge's risk and passed to the processor. Ignored unless a saved payment method is charged with `off_session` set to false.
        public let ipAddress: Nullable<String>?
        /// What the buyer is purchasing. Each entry takes exactly one of `variant_id` or an inline `variant`. One entry charges that variant; several entries form a cart, which requires every variant to be compatible, belong to this account, and use the same currency. Mutually exclusive with `variant_id` and `variant`.
        public let lineItems: [CreatePaymentsRequestLineItemsItem]?
        /// The member to charge, prefixed `mber_`. Required with `payment_method_id` unless `confirmation_token` is provided. With a `paypal` `payment_method` it names the buyer instead of `email`, and must belong to a user; omit both to take the buyer from the PayPal account that approves.
        public let memberId: Nullable<String>?
        /// Custom metadata to attach to the payment.
        public let metadata: Nullable<[String: Nullable<String>]>?
        /// Whether the buyer is absent from your checkout and can't authenticate. Pass true when you charge the card without the buyer, such as a renewal on your own schedule. Pass false when the buyer is present, such as a one-click upsell right after checkout: the charge is processed as a customer-initiated card-on-file payment, and if the issuer asks the buyer to authenticate, the payment's status is `requires_action` with a `next_action` to send them to, after which they return to `return_url`. From API version 2026-10-07-1 it defaults to false when `return_url` is provided and to true otherwise; before that version it defaults to true. A saved Apple Pay, Google Pay or PayPal payment method is always charged with `off_session` true. Ignored unless `member_id` and `payment_method_id` are provided.
        public let offSession: Nullable<Bool>?
        /// A payment method named on this call rather than described by a confirmation token. `type` names it and the member named after it carries its details. Nothing is collected on this call: the payment is created first and the buyer or device then acts on the `next_action` the status endpoint serves. `card_present` (Tap to Pay): the reader collects against the payment with the client secret in `next_action`. `paypal`: the buyer approves on PayPal's page, reached through a `redirect` `next_action`, then returns to `return_url`; `member_id` or `email` names the buyer. Mutually exclusive with `confirmation_token` and `payment_method_id`, and with `member_id` except for `paypal`.
        public let paymentMethod: Nullable<CreatePaymentsRequestPaymentMethod>?
        /// The stored payment method to charge, prefixed `payt_`. It must belong to the member. Required unless `confirmation_token` is provided.
        public let paymentMethodId: Nullable<String>?
        /// A payment quote from `POST /payment_quotes`, prefixed `pq_`. The payment charges exactly the quote: its purchase (its variants and quantities, or the `variant` it priced), which this body may then omit, its promo code, and its tax, the quote's `tax_amount` rather than a figure calculated now. Omit it, or send null, to have tax calculated when the payment is charged. The quote must belong to `account_id`. A purchase field you omit or send as null takes the quote's value; the buyer's email, the addresses and the payment method are this request's own, never the quote's. Whatever you do send must describe the quoted purchase: the same variants, quantities and promo code. A quote that priced `variant` takes only the same `variant` you sent to `POST /payment_quotes` (or omit the purchase to take the quoted one), never `variant_id` or `line_items`, and a quote that priced variants by id never takes `variant`. Unless the quote located no buyer (`located_by` is null), the address the payment carries (its shipping address, else its billing address) must put the buyer where the quote priced tax, by country, state and postal code; otherwise the payment is refused with 400 before the payment method is used. A quote located by IP address or by the country the buyer chose (`located_by` is `ip_address` or `presentment_country`) is a preview and cannot be paid. A quote is consumed by one payment: a declined payment keeps it and can be retried; a new payment needs a new quote. A quote cannot be charged by a processor that doesn't take quotes, such as a seller's own connected PayPal account; such a payment is refused before the payment method is used. A quote priced in a `presentment_currency` is charged in that currency at the quote's `exchange_rate`. A payment refused over its quote carries an error `code`. `quote_expired`: the quote has expired; quote again. `quote_tax_unavailable`: the quote could not price tax; quote again, or omit `quote_id`. `quote_preview_only`: the quote was located by IP address or by the country the buyer chose; quote again with the buyer's address. `quote_in_use` (409): another payment holds the quote. `quote_mismatch`: the purchase or the buyer's address is not the one quoted. `quote_rate_expired`: the exchange rate the quote was priced at has moved too far to charge; quote again. `payment_method_currency_unsupported`: the payment method cannot pay in the quote's currency; use another method, or quote again in another currency. `quote_processor_unsupported`: the payment would be processed by a processor that doesn't take quotes, such as a seller's own connected PayPal account; use another method, or omit `quote_id` to have tax calculated when the payment is charged.
        public let quoteId: Nullable<String>?
        /// Where the buyer continues after completing an off-site step such as 3D Secure. An absolute https URL without credentials, at most 2,048 characters. Required when a saved payment method is charged with `off_session` false; otherwise ignored unless `confirmation_token` or a `paypal` `payment_method` is provided.
        public let returnUrl: Nullable<String>?
        /// Attests that the buyer was told the payment method will be saved for later charges, and saves it once they approve, so it can be charged with `member_id` and `payment_method_id`. PayPal shows the buyer the agreement to future charges on its approval page. Omit it for a one-time payment that saves nothing. Ignored unless a `paypal` `payment_method` is provided.
        public let setupFutureUsage: Nullable<CreatePaymentsRequestSetupFutureUsage>?
        /// Where physical goods ship, returned on the payment as `shipping_address`. Only the keys you supply are kept; omit it for digital goods.
        public let shippingAddress: Nullable<CreatePaymentsRequestShippingAddress>?
        /// Overrides the text on the buyer's card statement for this payment only. Takes precedence over the product's and account's custom descriptors, and changes neither. Must start with `WHOP*` unless the business processes as the merchant of record. For businesses processing as the merchant of record, omit the `WHOP*` prefix; the descriptor appears as provided. Must be 5-22 characters, contain at least one letter, and use only Latin letters, numbers, spaces, underscores, hyphens, or asterisks.
        public let statementDescriptor: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            promoCode: Nullable<String>? = nil,
            promoCodeId: Nullable<String>? = nil,
            variant: PaymentInputVariant? = nil,
            variantId: String? = nil,
            affiliateCode: Nullable<String>? = nil,
            autoCaptureAfterMinutes: Nullable<Int>? = nil,
            billingAddress: Nullable<CreatePaymentsRequestBillingAddress>? = nil,
            capture: Nullable<Bool>? = nil,
            confirmationToken: Nullable<String>? = nil,
            email: Nullable<String>? = nil,
            ipAddress: Nullable<String>? = nil,
            lineItems: [CreatePaymentsRequestLineItemsItem]? = nil,
            memberId: Nullable<String>? = nil,
            metadata: Nullable<[String: Nullable<String>]>? = nil,
            offSession: Nullable<Bool>? = nil,
            paymentMethod: Nullable<CreatePaymentsRequestPaymentMethod>? = nil,
            paymentMethodId: Nullable<String>? = nil,
            quoteId: Nullable<String>? = nil,
            returnUrl: Nullable<String>? = nil,
            setupFutureUsage: Nullable<CreatePaymentsRequestSetupFutureUsage>? = nil,
            shippingAddress: Nullable<CreatePaymentsRequestShippingAddress>? = nil,
            statementDescriptor: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.promoCode = promoCode
            self.promoCodeId = promoCodeId
            self.variant = variant
            self.variantId = variantId
            self.affiliateCode = affiliateCode
            self.autoCaptureAfterMinutes = autoCaptureAfterMinutes
            self.billingAddress = billingAddress
            self.capture = capture
            self.confirmationToken = confirmationToken
            self.email = email
            self.ipAddress = ipAddress
            self.lineItems = lineItems
            self.memberId = memberId
            self.metadata = metadata
            self.offSession = offSession
            self.paymentMethod = paymentMethod
            self.paymentMethodId = paymentMethodId
            self.quoteId = quoteId
            self.returnUrl = returnUrl
            self.setupFutureUsage = setupFutureUsage
            self.shippingAddress = shippingAddress
            self.statementDescriptor = statementDescriptor
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.promoCode = try container.decodeNullableIfPresent(String.self, forKey: .promoCode)
            self.promoCodeId = try container.decodeNullableIfPresent(String.self, forKey: .promoCodeId)
            self.variant = try container.decodeIfPresent(PaymentInputVariant.self, forKey: .variant)
            self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
            self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
            self.autoCaptureAfterMinutes = try container.decodeNullableIfPresent(Int.self, forKey: .autoCaptureAfterMinutes)
            self.billingAddress = try container.decodeNullableIfPresent(CreatePaymentsRequestBillingAddress.self, forKey: .billingAddress)
            self.capture = try container.decodeNullableIfPresent(Bool.self, forKey: .capture)
            self.confirmationToken = try container.decodeNullableIfPresent(String.self, forKey: .confirmationToken)
            self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
            self.ipAddress = try container.decodeNullableIfPresent(String.self, forKey: .ipAddress)
            self.lineItems = try container.decodeIfPresent([CreatePaymentsRequestLineItemsItem].self, forKey: .lineItems)
            self.memberId = try container.decodeNullableIfPresent(String.self, forKey: .memberId)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .metadata)
            self.offSession = try container.decodeNullableIfPresent(Bool.self, forKey: .offSession)
            self.paymentMethod = try container.decodeNullableIfPresent(CreatePaymentsRequestPaymentMethod.self, forKey: .paymentMethod)
            self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
            self.quoteId = try container.decodeNullableIfPresent(String.self, forKey: .quoteId)
            self.returnUrl = try container.decodeNullableIfPresent(String.self, forKey: .returnUrl)
            self.setupFutureUsage = try container.decodeNullableIfPresent(CreatePaymentsRequestSetupFutureUsage.self, forKey: .setupFutureUsage)
            self.shippingAddress = try container.decodeNullableIfPresent(CreatePaymentsRequestShippingAddress.self, forKey: .shippingAddress)
            self.statementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .statementDescriptor)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.promoCode, forKey: .promoCode)
            try container.encodeNullableIfPresent(self.promoCodeId, forKey: .promoCodeId)
            try container.encodeIfPresent(self.variant, forKey: .variant)
            try container.encodeIfPresent(self.variantId, forKey: .variantId)
            try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
            try container.encodeNullableIfPresent(self.autoCaptureAfterMinutes, forKey: .autoCaptureAfterMinutes)
            try container.encodeNullableIfPresent(self.billingAddress, forKey: .billingAddress)
            try container.encodeNullableIfPresent(self.capture, forKey: .capture)
            try container.encodeNullableIfPresent(self.confirmationToken, forKey: .confirmationToken)
            try container.encodeNullableIfPresent(self.email, forKey: .email)
            try container.encodeNullableIfPresent(self.ipAddress, forKey: .ipAddress)
            try container.encodeIfPresent(self.lineItems, forKey: .lineItems)
            try container.encodeNullableIfPresent(self.memberId, forKey: .memberId)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.offSession, forKey: .offSession)
            try container.encodeNullableIfPresent(self.paymentMethod, forKey: .paymentMethod)
            try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encodeNullableIfPresent(self.quoteId, forKey: .quoteId)
            try container.encodeNullableIfPresent(self.returnUrl, forKey: .returnUrl)
            try container.encodeNullableIfPresent(self.setupFutureUsage, forKey: .setupFutureUsage)
            try container.encodeNullableIfPresent(self.shippingAddress, forKey: .shippingAddress)
            try container.encodeNullableIfPresent(self.statementDescriptor, forKey: .statementDescriptor)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case promoCode = "promo_code"
            case promoCodeId = "promo_code_id"
            case variant
            case variantId = "variant_id"
            case affiliateCode = "affiliate_code"
            case autoCaptureAfterMinutes = "auto_capture_after_minutes"
            case billingAddress = "billing_address"
            case capture
            case confirmationToken = "confirmation_token"
            case email
            case ipAddress = "ip_address"
            case lineItems = "line_items"
            case memberId = "member_id"
            case metadata
            case offSession = "off_session"
            case paymentMethod = "payment_method"
            case paymentMethodId = "payment_method_id"
            case quoteId = "quote_id"
            case returnUrl = "return_url"
            case setupFutureUsage = "setup_future_usage"
            case shippingAddress = "shipping_address"
            case statementDescriptor = "statement_descriptor"
        }
    }
}