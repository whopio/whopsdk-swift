import Foundation

/// The plan that this invoice charges for.
public struct InvoiceLegacyCurrentPlan: Codable, Hashable, Sendable {
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time plans.
    public let billingPeriod: Nullable<Int>
    /// The currency used for all prices on this plan (e.g., 'usd', 'eur'). All monetary amounts on the plan are denominated in this currency.
    public let currency: Currencies
    /// A text description of the plan visible to customers. Maximum 1000 characters. Null if no description is set.
    public let description: Nullable<String>
    /// The formatted price (including currency) for the plan.
    public let formattedPrice: String
    /// The unique identifier for the plan.
    public let id: String
    /// The initial purchase price in the plan's base_currency (e.g., 49.99 for $49.99). For one-time plans, this is the full price. For renewal plans, this is charged on top of the first renewal_price.
    public let initialPrice: Double
    /// The billing model for this plan: 'renewal' for recurring subscriptions or 'one_time' for single payments.
    public let planType: PlanTypes
    /// The recurring price charged every billing_period in the plan's base_currency (e.g., 9.99 for $9.99/period). Zero for one-time plans.
    public let renewalPrice: Double
    /// Free trial days before first renewal charge. `null` if no trial is configured or the user has already used a trial for this plan.
    public let trialPeriodDays: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingPeriod: Nullable<Int>,
        currency: Currencies,
        description: Nullable<String>,
        formattedPrice: String,
        id: String,
        initialPrice: Double,
        planType: PlanTypes,
        renewalPrice: Double,
        trialPeriodDays: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.description = description
        self.formattedPrice = formattedPrice
        self.id = id
        self.initialPrice = initialPrice
        self.planType = planType
        self.renewalPrice = renewalPrice
        self.trialPeriodDays = trialPeriodDays
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingPeriod = try container.decode(Nullable<Int>.self, forKey: .billingPeriod)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.formattedPrice = try container.decode(String.self, forKey: .formattedPrice)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.planType = try container.decode(PlanTypes.self, forKey: .planType)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.trialPeriodDays = try container.decode(Nullable<Int>.self, forKey: .trialPeriodDays)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.formattedPrice, forKey: .formattedPrice)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.planType, forKey: .planType)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.trialPeriodDays, forKey: .trialPeriodDays)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingPeriod = "billing_period"
        case currency
        case description
        case formattedPrice = "formatted_price"
        case id
        case initialPrice = "initial_price"
        case planType = "plan_type"
        case renewalPrice = "renewal_price"
        case trialPeriodDays = "trial_period_days"
    }
}