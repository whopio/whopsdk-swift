import Foundation

public struct AccountFeeRegionalRate: Codable, Hashable, Sendable {
    /// The platform rate for this region before custom or inherited pricing is applied.
    public let `default`: AccountFeeRate
    /// The amount charged per event in effect. `null` when the fee has no fixed component.
    public let fixed: Nullable<Money>
    /// The highest regional rate the caller may set. `null` when the fee is not adjustable or the caller is not capped.
    public let maximum: Nullable<AccountFeeRate>
    /// The lowest regional rate the caller may set, present only when the fee is adjustable.
    public let minimum: Nullable<AccountFeeRate>
    /// The percentage of the transaction in effect, where `2` means 2%. `null` when the fee has no percentage component.
    public let percentage: Nullable<Double>
    /// The regional rate that takes effect when this account's custom rate is cleared, including inherited pricing.
    public let reset: AccountFeeRate
    /// Where the regional rate in effect comes from: `default` is the platform rate, `custom` a rate negotiated for this account, and `inherited` a rate negotiated by the platform this account is connected to.
    public let source: Nullable<AccountFeeRegionalRateSource>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        default: AccountFeeRate,
        fixed: Nullable<Money>,
        maximum: Nullable<AccountFeeRate>,
        minimum: Nullable<AccountFeeRate>,
        percentage: Nullable<Double>,
        reset: AccountFeeRate,
        source: Nullable<AccountFeeRegionalRateSource>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.default = `default`
        self.fixed = fixed
        self.maximum = maximum
        self.minimum = minimum
        self.percentage = percentage
        self.reset = reset
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.default = try container.decode(AccountFeeRate.self, forKey: .default)
        self.fixed = try container.decode(Nullable<Money>.self, forKey: .fixed)
        self.maximum = try container.decode(Nullable<AccountFeeRate>.self, forKey: .maximum)
        self.minimum = try container.decode(Nullable<AccountFeeRate>.self, forKey: .minimum)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.reset = try container.decode(AccountFeeRate.self, forKey: .reset)
        self.source = try container.decode(Nullable<AccountFeeRegionalRateSource>.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.default, forKey: .default)
        try container.encode(self.fixed, forKey: .fixed)
        try container.encode(self.maximum, forKey: .maximum)
        try container.encode(self.minimum, forKey: .minimum)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.reset, forKey: .reset)
        try container.encode(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `default`
        case fixed
        case maximum
        case minimum
        case percentage
        case reset
        case source
    }
}