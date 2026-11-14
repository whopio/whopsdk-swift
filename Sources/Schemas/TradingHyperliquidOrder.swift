import Foundation

public struct TradingHyperliquidOrder: Codable, Hashable, Sendable {
    /// Whether the order can only reduce an existing position, or `null` when Hyperliquid omits it.
    public let reduceOnly: Nullable<Bool>
    /// Trigger price in USD for take-profit and stop-loss orders, or `null` for orders without a trigger.
    public let triggerPrice: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        reduceOnly: Nullable<Bool>,
        triggerPrice: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.reduceOnly = reduceOnly
        self.triggerPrice = triggerPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reduceOnly = try container.decode(Nullable<Bool>.self, forKey: .reduceOnly)
        self.triggerPrice = try container.decode(Nullable<Money>.self, forKey: .triggerPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.reduceOnly, forKey: .reduceOnly)
        try container.encode(self.triggerPrice, forKey: .triggerPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case reduceOnly = "reduce_only"
        case triggerPrice = "trigger_price"
    }
}