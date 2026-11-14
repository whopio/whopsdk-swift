import Foundation

public struct AccountFeeMarkup: Codable, Hashable, Sendable {
    /// Whether the caller may change this markup through `PATCH`. True for the platform's team holding the `company:update_child_fees` scope.
    public let adjustable: Bool
    /// What applies if this row is cleared: the platform's default for all its subaccounts, or zero. Its `percentage` and `fixed` are `null` when a subaccount's fees are read without access to its parent account.
    public let `default`: AccountFeeRate
    /// The amount the platform adds per event. Zero when no markup is set.
    public let fixed: Money
    /// The highest markup the platform may set.
    public let maximum: AccountFeeRate
    /// The percentage of the transaction the platform adds, where `2` means 2%. `0` when no markup is set.
    public let percentage: Double
    /// `custom` when a row is set at this level, `default` when the rate falls through to the platform default or zero. `null` when a subaccount's fees are read without access to its parent account.
    public let source: Nullable<AccountFeeMarkupSource>
    /// Why the caller may not change this markup, or `null` when `adjustable`.
    public let unadjustableReason: Nullable<AccountFeeMarkupUnadjustableReason>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adjustable: Bool,
        default: AccountFeeRate,
        fixed: Money,
        maximum: AccountFeeRate,
        percentage: Double,
        source: Nullable<AccountFeeMarkupSource>,
        unadjustableReason: Nullable<AccountFeeMarkupUnadjustableReason>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adjustable = adjustable
        self.default = `default`
        self.fixed = fixed
        self.maximum = maximum
        self.percentage = percentage
        self.source = source
        self.unadjustableReason = unadjustableReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adjustable = try container.decode(Bool.self, forKey: .adjustable)
        self.default = try container.decode(AccountFeeRate.self, forKey: .default)
        self.fixed = try container.decode(Money.self, forKey: .fixed)
        self.maximum = try container.decode(AccountFeeRate.self, forKey: .maximum)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.source = try container.decode(Nullable<AccountFeeMarkupSource>.self, forKey: .source)
        self.unadjustableReason = try container.decode(Nullable<AccountFeeMarkupUnadjustableReason>.self, forKey: .unadjustableReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adjustable, forKey: .adjustable)
        try container.encode(self.default, forKey: .default)
        try container.encode(self.fixed, forKey: .fixed)
        try container.encode(self.maximum, forKey: .maximum)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.unadjustableReason, forKey: .unadjustableReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adjustable
        case `default`
        case fixed
        case maximum
        case percentage
        case source
        case unadjustableReason = "unadjustable_reason"
    }
}