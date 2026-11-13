import Foundation

public struct ProductPublicVariant: Codable, Hashable, Sendable {
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time variants.
    public let billingPeriod: Nullable<Double>
    /// Billing model for this variant: `one_time` or `renewal`.
    public let billingType: ProductPublicVariantBillingType
    /// Access duration in days for expiration-based variants. `null` for variants without an expiration.
    public let expirationDays: Nullable<Double>
    /// Variant ID, prefixed `plan_`.
    public let id: String
    /// What checkout charges up front. `amount` is `"0.00"` when the first charge is free, such as a trial.
    public let initialPrice: Money
    /// The recurring charge every `billing_period` days. `amount` is `"0.00"` for one-time variants.
    public let renewalPrice: Money
    /// Variant display name shown to customers. `null` if no title has been set.
    public let title: Nullable<String>
    /// Free trial days before the first renewal charge. `null` if no trial is configured or the signed-in user has already used a trial on this variant.
    public let trialPeriodDays: Nullable<Double>
    /// Whether the variant has unlimited stock.
    public let unlimitedStock: Bool
    /// Where this variant can be seen. `visible` variants appear on the product page.
    public let visibility: ProductPublicVariantVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingPeriod: Nullable<Double>,
        billingType: ProductPublicVariantBillingType,
        expirationDays: Nullable<Double>,
        id: String,
        initialPrice: Money,
        renewalPrice: Money,
        title: Nullable<String>,
        trialPeriodDays: Nullable<Double>,
        unlimitedStock: Bool,
        visibility: ProductPublicVariantVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingPeriod = billingPeriod
        self.billingType = billingType
        self.expirationDays = expirationDays
        self.id = id
        self.initialPrice = initialPrice
        self.renewalPrice = renewalPrice
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.unlimitedStock = unlimitedStock
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingPeriod = try container.decode(Nullable<Double>.self, forKey: .billingPeriod)
        self.billingType = try container.decode(ProductPublicVariantBillingType.self, forKey: .billingType)
        self.expirationDays = try container.decode(Nullable<Double>.self, forKey: .expirationDays)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Money.self, forKey: .initialPrice)
        self.renewalPrice = try container.decode(Money.self, forKey: .renewalPrice)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.trialPeriodDays = try container.decode(Nullable<Double>.self, forKey: .trialPeriodDays)
        self.unlimitedStock = try container.decode(Bool.self, forKey: .unlimitedStock)
        self.visibility = try container.decode(ProductPublicVariantVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.billingType, forKey: .billingType)
        try container.encode(self.expirationDays, forKey: .expirationDays)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encode(self.unlimitedStock, forKey: .unlimitedStock)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingPeriod = "billing_period"
        case billingType = "billing_type"
        case expirationDays = "expiration_days"
        case id
        case initialPrice = "initial_price"
        case renewalPrice = "renewal_price"
        case title
        case trialPeriodDays = "trial_period_days"
        case unlimitedStock = "unlimited_stock"
        case visibility
    }
}