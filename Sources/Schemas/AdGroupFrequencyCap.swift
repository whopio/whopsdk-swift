import Foundation

public struct AdGroupFrequencyCap: Codable, Hashable, Sendable {
    /// Most times one person can be shown ads from this ad group within the window.
    public let maximumImpressions: Double
    /// Length of the rolling window, in days.
    public let perDays: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maximumImpressions: Double,
        perDays: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maximumImpressions = maximumImpressions
        self.perDays = perDays
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maximumImpressions = try container.decode(Double.self, forKey: .maximumImpressions)
        self.perDays = try container.decode(Nullable<Double>.self, forKey: .perDays)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.maximumImpressions, forKey: .maximumImpressions)
        try container.encode(self.perDays, forKey: .perDays)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maximumImpressions = "maximum_impressions"
        case perDays = "per_days"
    }
}