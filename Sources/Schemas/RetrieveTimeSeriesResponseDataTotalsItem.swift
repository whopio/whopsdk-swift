import Foundation

public struct RetrieveTimeSeriesResponseDataTotalsItem: Codable, Hashable, Sendable {
    public let comparison: Nullable<FunnelComparison>?
    /// Funnel only. The Wilson interval for final conversion, present when confidence_level or compare_to is supplied.
    public let confidenceInterval: Nullable<FunnelConfidenceInterval>?
    /// The property value this total is for, or the metric's name when it isn't split by a property.
    public let name: String
    /// Present for the funnel metric. People reaching each step in order, starting with the entry step.
    public let steps: [FunnelStepResult]?
    /// The metric's whole-window value for this entry.
    public let value: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        comparison: Nullable<FunnelComparison>? = nil,
        confidenceInterval: Nullable<FunnelConfidenceInterval>? = nil,
        name: String,
        steps: [FunnelStepResult]? = nil,
        value: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.comparison = comparison
        self.confidenceInterval = confidenceInterval
        self.name = name
        self.steps = steps
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.comparison = try container.decodeNullableIfPresent(FunnelComparison.self, forKey: .comparison)
        self.confidenceInterval = try container.decodeNullableIfPresent(FunnelConfidenceInterval.self, forKey: .confidenceInterval)
        self.name = try container.decode(String.self, forKey: .name)
        self.steps = try container.decodeIfPresent([FunnelStepResult].self, forKey: .steps)
        self.value = try container.decode(Nullable<Double>.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.comparison, forKey: .comparison)
        try container.encodeNullableIfPresent(self.confidenceInterval, forKey: .confidenceInterval)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.steps, forKey: .steps)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case comparison
        case confidenceInterval = "confidence_interval"
        case name
        case steps
        case value
    }
}