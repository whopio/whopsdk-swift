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
        /// Payment method overrides for this checkout. `null` uses the plan or platform defaults.
        public let paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPaymentMethodConfiguration>?
        /// Plan attributes used to create or find a plan for this checkout configuration. Mutually exclusive with `plan_id`.
        public let plan: Nullable<CreateCheckoutConfigurationsRequestPlan>?
        /// Existing plan ID, prefixed `plan_`. Mutually exclusive with `plan`.
        public let planId: Nullable<String>?
        /// URL customers are sent to after checkout.
        public let redirectUrl: Nullable<String>?
        /// 3D Secure behavior for this checkout.
        public let threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestThreeDsLevel>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            affiliateCode: Nullable<String>? = nil,
            currency: Nullable<String>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            mode: CreateCheckoutConfigurationsRequestMode? = nil,
            paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPaymentMethodConfiguration>? = nil,
            plan: Nullable<CreateCheckoutConfigurationsRequestPlan>? = nil,
            planId: Nullable<String>? = nil,
            redirectUrl: Nullable<String>? = nil,
            threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestThreeDsLevel>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.affiliateCode = affiliateCode
            self.currency = currency
            self.metadata = metadata
            self.mode = mode
            self.paymentMethodConfiguration = paymentMethodConfiguration
            self.plan = plan
            self.planId = planId
            self.redirectUrl = redirectUrl
            self.threeDsLevel = threeDsLevel
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
            self.plan = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlan.self, forKey: .plan)
            self.planId = try container.decodeNullableIfPresent(String.self, forKey: .planId)
            self.redirectUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectUrl)
            self.threeDsLevel = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestThreeDsLevel.self, forKey: .threeDsLevel)
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
            try container.encodeNullableIfPresent(self.plan, forKey: .plan)
            try container.encodeNullableIfPresent(self.planId, forKey: .planId)
            try container.encodeNullableIfPresent(self.redirectUrl, forKey: .redirectUrl)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case affiliateCode = "affiliate_code"
            case currency
            case metadata
            case mode
            case paymentMethodConfiguration = "payment_method_configuration"
            case plan
            case planId = "plan_id"
            case redirectUrl = "redirect_url"
            case threeDsLevel = "three_ds_level"
        }
    }
}