import Foundation

public struct WaitlistEntryVariant: Codable, Hashable, Sendable {
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time variants.
    public let billingPeriod: Nullable<Double>
    /// Billing model for this variant: `one_time` or `renewal`.
    public let billingType: WaitlistEntryVariantBillingType
    /// Customer-visible variant description. Maximum 1000 characters. `null` if no description is set.
    public let description: Nullable<String>
    /// Variant ID, prefixed `plan_`.
    public let id: String
    /// What checkout charges up front. `amount` is `"0.00"` when the first charge is free, such as a trial.
    public let initialPrice: Money
    /// The recurring charge every `billing_period` days. `amount` is `"0.00"` for one-time variants.
    public let renewalPrice: Money
    /// Variant display name shown to customers. `null` if no title has been set.
    public let title: Nullable<String>
    /// Free trial days configured before the first renewal charge. `null` if no trial is configured.
    public let trialPeriodDays: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingPeriod: Nullable<Double>,
        billingType: WaitlistEntryVariantBillingType,
        description: Nullable<String>,
        id: String,
        initialPrice: Money,
        renewalPrice: Money,
        title: Nullable<String>,
        trialPeriodDays: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingPeriod = billingPeriod
        self.billingType = billingType
        self.description = description
        self.id = id
        self.initialPrice = initialPrice
        self.renewalPrice = renewalPrice
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingPeriod = try container.decode(Nullable<Double>.self, forKey: .billingPeriod)
        self.billingType = try container.decode(WaitlistEntryVariantBillingType.self, forKey: .billingType)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Money.self, forKey: .initialPrice)
        self.renewalPrice = try container.decode(Money.self, forKey: .renewalPrice)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.trialPeriodDays = try container.decode(Nullable<Double>.self, forKey: .trialPeriodDays)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.billingType, forKey: .billingType)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.trialPeriodDays, forKey: .trialPeriodDays)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingPeriod = "billing_period"
        case billingType = "billing_type"
        case description
        case id
        case initialPrice = "initial_price"
        case renewalPrice = "renewal_price"
        case title
        case trialPeriodDays = "trial_period_days"
    }
}