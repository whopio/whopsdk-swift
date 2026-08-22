import Foundation

public struct RetrieveStatsResponseDataTotalsItem: Codable, Hashable, Sendable {
    /// The property value this total is for, or the metric's name when it isn't split by a property.
    public let name: String
    /// The metric's whole-window value for this entry.
    public let value: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        value: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(Nullable<Double>.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case value
    }
}