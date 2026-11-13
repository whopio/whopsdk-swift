import Foundation

public struct ListBusinessesResponseDataItemVolumeUsd: Codable, Hashable, Sendable {
    /// Credited GMV (awaiting_settlement + settled); excludes canceled and reversed, in USD.
    public let attributed: String
    /// GMV awaiting settlement (commission not yet computed), in USD.
    public let awaitingSettlement: String
    /// Credited GMV from the trailing 30 days (awaiting_settlement + settled), in USD.
    public let last30D: String
    /// GMV of pending + completed payments, in USD.
    public let settled: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attributed: String,
        awaitingSettlement: String,
        last30D: String,
        settled: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attributed = attributed
        self.awaitingSettlement = awaitingSettlement
        self.last30D = last30D
        self.settled = settled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributed = try container.decode(String.self, forKey: .attributed)
        self.awaitingSettlement = try container.decode(String.self, forKey: .awaitingSettlement)
        self.last30D = try container.decode(String.self, forKey: .last30D)
        self.settled = try container.decode(String.self, forKey: .settled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attributed, forKey: .attributed)
        try container.encode(self.awaitingSettlement, forKey: .awaitingSettlement)
        try container.encode(self.last30D, forKey: .last30D)
        try container.encode(self.settled, forKey: .settled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attributed
        case awaitingSettlement = "awaiting_settlement"
        case last30D = "last_30d"
        case settled
    }
}