import Foundation

extension Requests {
    public struct CreateCheckoutConfigurationsRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed `biz_`.
        public let accountId: String?
        /// Affiliate code to apply to the checkout.
        public let affiliateCode: Nullable<String>?
        /// Currency used for setup-mode payment method availability.
        public let currency: Nullable<String>?
        /// Custom key-value metadata copied to payments and memberships.
        public let metadata: Nullable<[String: JSONValue]>?
        /// Controls whether checkout charges the buyer immediately or saves payment details for later. Defaults to `payment`.
        public let mode: CreateCheckoutConfigurationsRequestMode?
        /// Payment method overrides for this checkout. `null` uses the variant or platform defaults.
        public let paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPaymentMethodConfiguration>?
        /// URL customers are sent to after checkout.
        public let redirectUrl: Nullable<String>?
        /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Applies in setup mode; `null` uses frictionless 3DS. Payment mode uses the variant policy.
        public let threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestThreeDsLevel>?
        /// Variant attributes used to create or find a variant for this checkout configuration. Mutually exclusive with `variant_id`.
        public let variant: Nullable<CreateCheckoutConfigurationsRequestVariant>?
        /// Existing variant ID, prefixed `plan_`. Mutually exclusive with `variant`.
        public let variantId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            affiliateCode: Nullable<String>? = nil,
            currency: Nullable<String>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            mode: CreateCheckoutConfigurationsRequestMode? = nil,
            paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPaymentMethodConfiguration>? = nil,
            redirectUrl: Nullable<String>? = nil,
            threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestThreeDsLevel>? = nil,
            variant: Nullable<CreateCheckoutConfigurationsRequestVariant>? = nil,
            variantId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.affiliateCode = affiliateCode
            self.currency = currency
            self.metadata = metadata
            self.mode = mode
            self.paymentMethodConfiguration = paymentMethodConfiguration
            self.redirectUrl = redirectUrl
            self.threeDsLevel = threeDsLevel
            self.variant = variant
            self.variantId = variantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
            self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.mode = try container.decodeIfPresent(CreateCheckoutConfigurationsRequestMode.self, forKey: .mode)
            self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
            self.redirectUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectUrl)
            self.threeDsLevel = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.variant = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestVariant.self, forKey: .variant)
            self.variantId = try container.decodeNullableIfPresent(String.self, forKey: .variantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
            try container.encodeNullableIfPresent(self.currency, forKey: .currency)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.mode, forKey: .mode)
            try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
            try container.encodeNullableIfPresent(self.redirectUrl, forKey: .redirectUrl)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
            try container.encodeNullableIfPresent(self.variant, forKey: .variant)
            try container.encodeNullableIfPresent(self.variantId, forKey: .variantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case affiliateCode = "affiliate_code"
            case currency
            case metadata
            case mode
            case paymentMethodConfiguration = "payment_method_configuration"
            case redirectUrl = "redirect_url"
            case threeDsLevel = "three_ds_level"
            case variant
            case variantId = "variant_id"
        }
    }
}