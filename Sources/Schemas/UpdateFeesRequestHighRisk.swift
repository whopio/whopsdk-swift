import Foundation

/// The fields of a fee the caller may change. Only the keys sent are replaced.
public struct UpdateFeesRequestHighRisk: Codable, Hashable, Sendable {
    /// The new amount per event, in US dollars (USD). `null` clears the custom amount.
    public let fixed: Nullable<Double>?
    /// The new percentage, where `2` means 2%. `null` clears the custom rate so the fee returns to its default or inherited rate.
    public let percentage: Nullable<Double>?
    /// Changes for the other regions the fee varies by, keyed by region. Only accepted on a fee whose `regions` is non-empty.
    public let regions: [String: UpdateFeesRequestHighRiskRegionsValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixed: Nullable<Double>? = nil,
        percentage: Nullable<Double>? = nil,
        regions: [String: UpdateFeesRequestHighRiskRegionsValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixed = fixed
        self.percentage = percentage
        self.regions = regions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixed = try container.decodeNullableIfPresent(Double.self, forKey: .fixed)
        self.percentage = try container.decodeNullableIfPresent(Double.self, forKey: .percentage)
        self.regions = try container.decodeIfPresent([String: UpdateFeesRequestHighRiskRegionsValue].self, forKey: .regions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.fixed, forKey: .fixed)
        try container.encodeNullableIfPresent(self.percentage, forKey: .percentage)
        try container.encodeIfPresent(self.regions, forKey: .regions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixed
        case percentage
        case regions
    }
}