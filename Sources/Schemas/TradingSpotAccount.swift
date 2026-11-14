import Foundation

public struct TradingSpotAccount: Codable, Hashable, Sendable {
    public let holdings: [TradingSpotHolding]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        holdings: [TradingSpotHolding],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.holdings = holdings
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.holdings = try container.decode([TradingSpotHolding].self, forKey: .holdings)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.holdings, forKey: .holdings)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case holdings
    }
}