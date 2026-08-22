import Foundation

public struct AccountReserveUnlock: Codable, Hashable, Sendable {
    /// Amount unlocking that day across every reason, in native units, as a decimal string.
    public let amount: String
    /// The day this money unlocks, as an ISO 8601 date.
    public let date: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        date: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.date = date
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.date = try container.decode(String.self, forKey: .date)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.date, forKey: .date)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case date
    }
}