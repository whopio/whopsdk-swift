import Foundation

public struct TradingMarginSummary: Codable, Hashable, Sendable {
    /// Total account value in USD, including unrealized profit and loss.
    public let accountValue: Money
    /// Margin allocated across open positions, in USD.
    public let totalMarginUsed: Money
    /// Combined notional value of open positions, in USD.
    public let totalPositionNotional: Money
    /// USD that can be withdrawn now without closing positions.
    public let withdrawable: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountValue: Money,
        totalMarginUsed: Money,
        totalPositionNotional: Money,
        withdrawable: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountValue = accountValue
        self.totalMarginUsed = totalMarginUsed
        self.totalPositionNotional = totalPositionNotional
        self.withdrawable = withdrawable
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountValue = try container.decode(Money.self, forKey: .accountValue)
        self.totalMarginUsed = try container.decode(Money.self, forKey: .totalMarginUsed)
        self.totalPositionNotional = try container.decode(Money.self, forKey: .totalPositionNotional)
        self.withdrawable = try container.decode(Money.self, forKey: .withdrawable)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountValue, forKey: .accountValue)
        try container.encode(self.totalMarginUsed, forKey: .totalMarginUsed)
        try container.encode(self.totalPositionNotional, forKey: .totalPositionNotional)
        try container.encode(self.withdrawable, forKey: .withdrawable)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountValue = "account_value"
        case totalMarginUsed = "total_margin_used"
        case totalPositionNotional = "total_position_notional"
        case withdrawable
    }
}