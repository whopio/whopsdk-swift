import Foundation

public struct AdGroupLearningProgress: Codable, Hashable, Sendable {
    /// The conversions this ad group's learning phase needs. It can change during delivery.
    public let conversionThreshold: Int
    /// Conversions counted since the last significant edit during this ad group's learning phase.
    public let conversions: Int
    /// Conversions divided by the threshold, as a percentage clamped to 0–100. The ad group's `delivery_status` remains authoritative.
    public let progressPercent: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversionThreshold: Int,
        conversions: Int,
        progressPercent: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversionThreshold = conversionThreshold
        self.conversions = conversions
        self.progressPercent = progressPercent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversionThreshold = try container.decode(Int.self, forKey: .conversionThreshold)
        self.conversions = try container.decode(Int.self, forKey: .conversions)
        self.progressPercent = try container.decode(Double.self, forKey: .progressPercent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.conversionThreshold, forKey: .conversionThreshold)
        try container.encode(self.conversions, forKey: .conversions)
        try container.encode(self.progressPercent, forKey: .progressPercent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversionThreshold = "conversion_threshold"
        case conversions
        case progressPercent = "progress_percent"
    }
}