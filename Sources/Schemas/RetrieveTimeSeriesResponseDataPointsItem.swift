import Foundation

public struct RetrieveTimeSeriesResponseDataPointsItem: Codable, Hashable, Sendable {
    /// Present only when broken down: one entry per property value in this period.
    public let breakdown: [RetrieveTimeSeriesResponseDataPointsItemBreakdownItem]?
    /// Present for the funnel metric. People reaching each step in order, starting with the entry step.
    public let steps: [FunnelStepResult]?
    /// Unix timestamp (seconds) of the period start.
    public let timestamp: Int
    /// The metric's value for this period, in the metric's unit. For `funnel`, the final-step conversion percentage.
    public let value: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        breakdown: [RetrieveTimeSeriesResponseDataPointsItemBreakdownItem]? = nil,
        steps: [FunnelStepResult]? = nil,
        timestamp: Int,
        value: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.breakdown = breakdown
        self.steps = steps
        self.timestamp = timestamp
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breakdown = try container.decodeIfPresent([RetrieveTimeSeriesResponseDataPointsItemBreakdownItem].self, forKey: .breakdown)
        self.steps = try container.decodeIfPresent([FunnelStepResult].self, forKey: .steps)
        self.timestamp = try container.decode(Int.self, forKey: .timestamp)
        self.value = try container.decode(Nullable<Double>.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.breakdown, forKey: .breakdown)
        try container.encodeIfPresent(self.steps, forKey: .steps)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case breakdown
        case steps
        case timestamp
        case value
    }
}