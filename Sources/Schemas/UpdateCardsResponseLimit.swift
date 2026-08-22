import Foundation

/// The spending limit configuration.
public struct UpdateCardsResponseLimit: Codable, Hashable, Sendable {
    /// The limit amount in dollars.
    public let amount: Double
    /// The window the limit amount applies to. `per_transaction` caps each individual authorization and is what a limit set with `transaction_limit` reports.
    public let frequency: UpdateCardsResponseLimitFrequency
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        frequency: UpdateCardsResponseLimitFrequency,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.frequency = frequency
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.frequency = try container.decode(UpdateCardsResponseLimitFrequency.self, forKey: .frequency)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.frequency, forKey: .frequency)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case frequency
    }
}