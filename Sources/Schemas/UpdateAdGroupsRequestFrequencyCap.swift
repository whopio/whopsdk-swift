import Foundation

/// Cap on how often one person sees ads from this ad group. Only available on campaigns with the `awareness` objective.
public struct UpdateAdGroupsRequestFrequencyCap: Codable, Hashable, Sendable {
    /// Most times one person can be shown ads from this ad group within the window.
    public let maximumImpressions: Int?
    /// Length of the rolling window, in days.
    public let perDays: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maximumImpressions: Int? = nil,
        perDays: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maximumImpressions = maximumImpressions
        self.perDays = perDays
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maximumImpressions = try container.decodeIfPresent(Int.self, forKey: .maximumImpressions)
        self.perDays = try container.decodeIfPresent(Int.self, forKey: .perDays)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.maximumImpressions, forKey: .maximumImpressions)
        try container.encodeIfPresent(self.perDays, forKey: .perDays)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maximumImpressions = "maximum_impressions"
        case perDays = "per_days"
    }
}