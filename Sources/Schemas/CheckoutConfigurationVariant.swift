import Foundation

public struct CheckoutConfigurationVariant: Codable, Hashable, Sendable {
    /// Whether this variant accepts local currency payments via adaptive pricing.
    public let adaptivePricingEnabled: Bool
    /// Recurring billing interval in days.
    public let billingPeriod: Nullable<Int>
    /// Billing model for the variant.
    public let billingType: CheckoutConfigurationVariantBillingType
    /// Three-letter ISO currency code for the variant's prices.
    public let currency: String
    /// Access duration in days for expiration-based variants.
    public let expirationDays: Nullable<Int>
    /// Variant ID, prefixed `plan_`.
    public let id: String
    /// Initial purchase price in the variant currency.
    public let initialPrice: Double
    /// Sales method for the variant.
    public let releaseMethod: CheckoutConfigurationVariantReleaseMethod
    /// Recurring price charged each billing period.
    public let renewalPrice: Double
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. `null` inherits the account default.
    public let threeDsLevel: Nullable<CheckoutConfigurationVariantThreeDsLevel>
    /// Free trial days before the first renewal charge.
    public let trialPeriodDays: Nullable<Int>
    /// Whether the variant is visible to customers or hidden from public view.
    public let visibility: CheckoutConfigurationVariantVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adaptivePricingEnabled: Bool,
        billingPeriod: Nullable<Int>,
        billingType: CheckoutConfigurationVariantBillingType,
        currency: String,
        expirationDays: Nullable<Int>,
        id: String,
        initialPrice: Double,
        releaseMethod: CheckoutConfigurationVariantReleaseMethod,
        renewalPrice: Double,
        threeDsLevel: Nullable<CheckoutConfigurationVariantThreeDsLevel>,
        trialPeriodDays: Nullable<Int>,
        visibility: CheckoutConfigurationVariantVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adaptivePricingEnabled = adaptivePricingEnabled
        self.billingPeriod = billingPeriod
        self.billingType = billingType
        self.currency = currency
        self.expirationDays = expirationDays
        self.id = id
        self.initialPrice = initialPrice
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
        self.billingType = try container.decode(CheckoutConfigurationVariantBillingType.self, forKey: .billingType)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.expirationDays = try container.decode(Nullable<Int>.self, forKey: .expirationDays)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.releaseMethod = try container.decode(CheckoutConfigurationVariantReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.threeDsLevel = try container.decode(Nullable<CheckoutConfigurationVariantThreeDsLevel>.self, forKey: .threeDsLevel)
        self.trialPeriodDays = try container.decode(Nullable<Int>.self, forKey: .trialPeriodDays)
        self.visibility = try container.decode(CheckoutConfigurationVariantVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.billingType, forKey: .billingType)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.expirationDays, forKey: .expirationDays)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
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
        case billingType = "billing_type"
        case currency
        case expirationDays = "expiration_days"
        case id
        case initialPrice = "initial_price"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case threeDsLevel = "three_ds_level"
        case trialPeriodDays = "trial_period_days"
        case visibility
    }
}