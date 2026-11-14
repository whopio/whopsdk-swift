import Foundation

public struct AccountEconomicIntelligencePreviousPeriod: Codable, Hashable, Sendable {
    /// When the period ended, as an ISO 8601 timestamp.
    public let endedAt: String
    /// Percentage of volume charged during the period, such as `3` for 3%.
    public let feePercentage: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endedAt: String,
        feePercentage: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endedAt = endedAt
        self.feePercentage = feePercentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endedAt = try container.decode(String.self, forKey: .endedAt)
        self.feePercentage = try container.decode(Double.self, forKey: .feePercentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endedAt, forKey: .endedAt)
        try container.encode(self.feePercentage, forKey: .feePercentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endedAt = "ended_at"
        case feePercentage = "fee_percentage"
    }
}