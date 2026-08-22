import Foundation

public struct CheckoutConfigurationPlan: Codable, Hashable, Sendable {
    /// Whether this plan accepts local currency payments via adaptive pricing.
    public let adaptivePricingEnabled: Bool
    /// Recurring billing interval in days.
    public let billingPeriod: Nullable<Int>
    /// Three-letter ISO currency code for the plan's prices.
    public let currency: String
    /// Access duration in days for expiration-based plans.
    public let expirationDays: Nullable<Int>
    /// Plan ID, prefixed `plan_`.
    public let id: String
    /// Initial purchase price in the plan currency.
    public let initialPrice: Double
    /// Billing model for the plan.
    public let planType: CheckoutConfigurationPlanPlanType
    /// Sales method for the plan.
    public let releaseMethod: CheckoutConfigurationPlanReleaseMethod
    /// Recurring price charged each billing period.
    public let renewalPrice: Double
    /// 3D Secure behavior for this plan, or `null` to use the account default.
    public let threeDsLevel: Nullable<CheckoutConfigurationPlanThreeDsLevel>
    /// Free trial days before the first renewal charge.
    public let trialPeriodDays: Nullable<Int>
    /// Whether the plan is visible to customers or hidden from public view.
    public let visibility: CheckoutConfigurationPlanVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adaptivePricingEnabled: Bool,
        billingPeriod: Nullable<Int>,
        currency: String,
        expirationDays: Nullable<Int>,
        id: String,
        initialPrice: Double,
        planType: CheckoutConfigurationPlanPlanType,
        releaseMethod: CheckoutConfigurationPlanReleaseMethod,
        renewalPrice: Double,
        threeDsLevel: Nullable<CheckoutConfigurationPlanThreeDsLevel>,
        trialPeriodDays: Nullable<Int>,
        visibility: CheckoutConfigurationPlanVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adaptivePricingEnabled = adaptivePricingEnabled
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.expirationDays = expirationDays
        self.id = id
        self.initialPrice = initialPrice
        self.planType = planType
        self.releaseMethod = releaseMethod
        self.renewalPrice = renewalPrice
        self.threeDsLevel = threeDsLevel
        self.trialPeriodDays = trialPeriodDays
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adaptivePricingEnabled = try container.decode(Bool.self, forKey: .adaptivePricingEnabled)
        self.billingPeriod = try container.decode(Nullable<Int>.self, forKey: .billingPeriod)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.expirationDays = try container.decode(Nullable<Int>.self, forKey: .expirationDays)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.planType = try container.decode(CheckoutConfigurationPlanPlanType.self, forKey: .planType)
        self.releaseMethod = try container.decode(CheckoutConfigurationPlanReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.threeDsLevel = try container.decode(Nullable<CheckoutConfigurationPlanThreeDsLevel>.self, forKey: .threeDsLevel)
        self.trialPeriodDays = try container.decode(Nullable<Int>.self, forKey: .trialPeriodDays)
        self.visibility = try container.decode(CheckoutConfigurationPlanVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.expirationDays, forKey: .expirationDays)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.planType, forKey: .planType)
        try container.encode(self.releaseMethod, forKey: .releaseMethod)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adaptivePricingEnabled = "adaptive_pricing_enabled"
        case billingPeriod = "billing_period"
        case currency
        case expirationDays = "expiration_days"
        case id
        case initialPrice = "initial_price"
        case planType = "plan_type"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case threeDsLevel = "three_ds_level"
        case trialPeriodDays = "trial_period_days"
        case visibility
    }
}