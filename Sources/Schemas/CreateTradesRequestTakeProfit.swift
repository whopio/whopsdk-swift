import Foundation

/// Only for a perpetual order that opens or adds to a position. A take-profit for the order's full size, armed once the order fills and sent with it as its own trade, whose `parent_id` is this trade.
public struct CreateTradesRequestTakeProfit: Codable, Hashable, Sendable {
    /// The USD price, as a decimal string Hyperliquid accepts without rounding, at which the take-profit sends its market order. Above `price` (or the mid price for a market order) for a buy, below it for a sell.
    public let triggerPrice: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        triggerPrice: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.triggerPrice = triggerPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.triggerPrice = try container.decode(String.self, forKey: .triggerPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.triggerPrice, forKey: .triggerPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case triggerPrice = "trigger_price"
    }
}