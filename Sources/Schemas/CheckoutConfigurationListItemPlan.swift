import Foundation

/// The plan to use for the checkout configuration
public struct CheckoutConfigurationListItemPlan: Codable, Hashable, Sendable {
    /// Whether the creator has turned on adaptive pricing for this plan. Raw setting — does not check processor compatibility or feature flags.
    public let adaptivePricingEnabled: Bool
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time plans.
    public let billingPeriod: Nullable<Int>
    /// The currency used for all prices on this plan (e.g., 'usd', 'eur'). All monetary amounts on the plan are denominated in this currency.
    public let currency: Currencies
    /// Access duration in days for expiration-based plans, such as 365 for a one-year pass.
    public let expirationDays: Nullable<Int>
    /// The unique identifier for the plan.
    public let id: String
    /// The initial purchase price in the plan's base_currency (e.g., 49.99 for $49.99). For one-time plans, this is the full price. For renewal plans, this is charged on top of the first renewal_price.
    public let initialPrice: Double
    /// The billing model for this plan: 'renewal' for recurring subscriptions or 'one_time' for single payments.
    public let planType: PlanTypes
    /// Sales method for this plan: `buy_now` for immediate purchase or `waitlist` for waitlist-based access.
    public let releaseMethod: ReleaseMethod
    /// The recurring price charged every billing_period in the plan's base_currency (e.g., 9.99 for $9.99/period). Zero for one-time plans.
    public let renewalPrice: Double
    /// The 3D Secure behavior for this plan. Null means the plan inherits the account default.
    public let threeDsLevel: Nullable<PlanThreeDsLevels>
    /// Free trial days before first renewal charge. `null` if no trial is configured or the user has already used a trial for this plan.
    public let trialPeriodDays: Nullable<Int>
    /// Controls whether the plan is visible to customers. When set to 'hidden', the plan is only accessible via direct link.
    public let visibility: Visibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adaptivePricingEnabled: Bool,
        billingPeriod: Nullable<Int>,
        currency: Currencies,
        expirationDays: Nullable<Int>,
        id: String,
        initialPrice: Double,
        planType: PlanTypes,
        releaseMethod: ReleaseMethod,
        renewalPrice: Double,
        threeDsLevel: Nullable<PlanThreeDsLevels>,
        trialPeriodDays: Nullable<Int>,
        visibility: Visibility,
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
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.expirationDays = try container.decode(Nullable<Int>.self, forKey: .expirationDays)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.planType = try container.decode(PlanTypes.self, forKey: .planType)
        self.releaseMethod = try container.decode(ReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.threeDsLevel = try container.decode(Nullable<PlanThreeDsLevels>.self, forKey: .threeDsLevel)
        self.trialPeriodDays = try container.decode(Nullable<Int>.self, forKey: .trialPeriodDays)
        self.visibility = try container.decode(Visibility.self, forKey: .visibility)
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