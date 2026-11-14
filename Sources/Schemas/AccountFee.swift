import Foundation

public struct AccountFee: Codable, Hashable, Sendable {
    /// Whether the caller may change this fee through `PATCH`. Depends on who is asking.
    public let adjustable: Bool
    /// Which group of the fee schedule this fee belongs to, for grouping in a UI.
    public let category: AccountFeeCategory
    /// The platform rate before custom or inherited pricing is applied. Its `percentage` and `fixed` are `null` when a subaccount's fees are read without access to its parent account.
    public let `default`: AccountFeeRate
    /// When a custom or inherited rate expires and the fee returns to `default`, as an ISO 8601 timestamp. `null` when the default applies, the rate does not expire, or a subaccount's fees are read without access to its parent account.
    public let endsAt: Nullable<String>
    /// The amount charged per event in effect. `null` when the fee has no fixed component.
    public let fixed: Nullable<Money>
    /// The highest rate the caller may set. `null` when the fee is not adjustable or the caller is not capped.
    public let maximum: Nullable<AccountFeeRate>
    /// The lowest rate the caller may set, present only when `adjustable`.
    public let minimum: Nullable<AccountFeeRate>
    /// The percentage of the transaction in effect, where `2` means 2%. `null` when the fee has no percentage component.
    public let percentage: Nullable<Double>
    /// The acquirer region `percentage` and `fixed` describe, for a fee that varies by where the money is processed. `null` for a fee that does not vary by region.
    public let region: Nullable<AccountFeeRegion>
    /// The rate, source, default, reset rate, and editable limits in every other region this fee varies by, keyed by region. Empty for a fee that does not vary by region.
    public let regions: [String: AccountFeeRegionalRate]
    /// The rate that takes effect when this account's custom rate is cleared, including inherited pricing. Its `percentage` and `fixed` are `null` when a subaccount's fees are read without access to its parent account.
    public let reset: AccountFeeRate
    /// Where the rate in effect comes from: `default` is the platform rate, `custom` a rate negotiated for this account, and `inherited` a rate negotiated by the platform this account is connected to. `null` when a subaccount's fees are read without access to its parent account.
    public let source: Nullable<AccountFeeSource>
    /// Why the caller may not change this fee, or `null` when `adjustable`. `not_permitted` when the caller has no say over it.
    public let unadjustableReason: Nullable<AccountFeeUnadjustableReason>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adjustable: Bool,
        category: AccountFeeCategory,
        default: AccountFeeRate,
        endsAt: Nullable<String>,
        fixed: Nullable<Money>,
        maximum: Nullable<AccountFeeRate>,
        minimum: Nullable<AccountFeeRate>,
        percentage: Nullable<Double>,
        region: Nullable<AccountFeeRegion>,
        regions: [String: AccountFeeRegionalRate],
        reset: AccountFeeRate,
        source: Nullable<AccountFeeSource>,
        unadjustableReason: Nullable<AccountFeeUnadjustableReason>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adjustable = adjustable
        self.category = category
        self.default = `default`
        self.endsAt = endsAt
        self.fixed = fixed
        self.maximum = maximum
        self.minimum = minimum
        self.percentage = percentage
        self.region = region
        self.regions = regions
        self.reset = reset
        self.source = source
        self.unadjustableReason = unadjustableReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adjustable = try container.decode(Bool.self, forKey: .adjustable)
        self.category = try container.decode(AccountFeeCategory.self, forKey: .category)
        self.default = try container.decode(AccountFeeRate.self, forKey: .default)
        self.endsAt = try container.decode(Nullable<String>.self, forKey: .endsAt)
        self.fixed = try container.decode(Nullable<Money>.self, forKey: .fixed)
        self.maximum = try container.decode(Nullable<AccountFeeRate>.self, forKey: .maximum)
        self.minimum = try container.decode(Nullable<AccountFeeRate>.self, forKey: .minimum)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.region = try container.decode(Nullable<AccountFeeRegion>.self, forKey: .region)
        self.regions = try container.decode([String: AccountFeeRegionalRate].self, forKey: .regions)
        self.reset = try container.decode(AccountFeeRate.self, forKey: .reset)
        self.source = try container.decode(Nullable<AccountFeeSource>.self, forKey: .source)
        self.unadjustableReason = try container.decode(Nullable<AccountFeeUnadjustableReason>.self, forKey: .unadjustableReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adjustable, forKey: .adjustable)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.default, forKey: .default)
        try container.encode(self.endsAt, forKey: .endsAt)
        try container.encode(self.fixed, forKey: .fixed)
        try container.encode(self.maximum, forKey: .maximum)
        try container.encode(self.minimum, forKey: .minimum)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.regions, forKey: .regions)
        try container.encode(self.reset, forKey: .reset)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.unadjustableReason, forKey: .unadjustableReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adjustable
        case category
        case `default`
        case endsAt = "ends_at"
        case fixed
        case maximum
        case minimum
        case percentage
        case region
        case regions
        case reset
        case source
        case unadjustableReason = "unadjustable_reason"
    }
}