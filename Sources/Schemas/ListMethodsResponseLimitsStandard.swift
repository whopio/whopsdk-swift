import Foundation

/// Caps for standard-speed payouts, which draw on settled funds only.
public struct ListMethodsResponseLimitsStandard: Codable, Hashable, Sendable {
    /// The maximum amount a standard payout can move right now, in whole currency units.
    public let maxAmount: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maxAmount: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maxAmount = maxAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxAmount = try container.decode(Float.self, forKey: .maxAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.maxAmount, forKey: .maxAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maxAmount = "max_amount"
    }
}