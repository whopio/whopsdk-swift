import Foundation

public struct ExperimentVariantsItem: Codable, Hashable, Sendable {
    /// Treatment identifier. `control` is reserved — it is the implicit remainder.
    public let name: String
    /// Granted bucket ranges (1% units, end-exclusive) recording this arm's allocation history. Server-managed; ranges are only ever appended, which is what keeps assignments permanent.
    public let ranges: [[Int]]?
    public let relatedResource: ExperimentResourceReference?
    /// Percentage of all users assigned to this treatment, 1–100. All weights together sum to at most 100; the remainder is control.
    public let weight: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        ranges: [[Int]]? = nil,
        relatedResource: ExperimentResourceReference? = nil,
        weight: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.ranges = ranges
        self.relatedResource = relatedResource
        self.weight = weight
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.ranges = try container.decodeIfPresent([[Int]].self, forKey: .ranges)
        self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.ranges, forKey: .ranges)
        try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
        try container.encode(self.weight, forKey: .weight)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case ranges
        case relatedResource = "related_resource"
        case weight
    }
}