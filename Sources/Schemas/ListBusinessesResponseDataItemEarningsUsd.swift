import Foundation

public struct ListBusinessesResponseDataItemEarningsUsd: Codable, Hashable, Sendable {
    /// Commission already paid out, in USD.
    public let completed: String
    /// Commission scheduled but not yet paid, in USD.
    public let pending: String
    /// Pending + completed commission, in USD.
    public let total: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completed: String,
        pending: String,
        total: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completed = completed
        self.pending = pending
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completed = try container.decode(String.self, forKey: .completed)
        self.pending = try container.decode(String.self, forKey: .pending)
        self.total = try container.decode(String.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completed, forKey: .completed)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completed
        case pending
        case total
    }
}