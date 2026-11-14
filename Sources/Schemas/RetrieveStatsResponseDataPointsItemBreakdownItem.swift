import Foundation

public struct RetrieveStatsResponseDataPointsItemBreakdownItem: Codable, Hashable, Sendable {
    /// The property value, for example usd or visa.
    public let name: String
    /// Present for the funnel metric. People reaching each step in order, starting with the entry step.
    public let steps: [FunnelStepResult]?
    /// The metric's value for this entry.
    public let value: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        steps: [FunnelStepResult]? = nil,
        value: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.steps = steps
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.steps = try container.decodeIfPresent([FunnelStepResult].self, forKey: .steps)
        self.value = try container.decode(Nullable<Double>.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.steps, forKey: .steps)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case steps
        case value
    }
}