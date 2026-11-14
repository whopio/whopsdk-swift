import Foundation

public struct UpdateExperimentsRequestVariantsItem: Codable, Hashable, Sendable {
    /// Treatment name. Pass every existing treatment (weights equal or higher); append new names to add arms. `control` is reserved.
    public let name: String
    public let relatedResource: ExperimentResourceReference?
    /// Percentage assigned to treatment; allocation may only grow.
    public let weight: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        relatedResource: ExperimentResourceReference? = nil,
        weight: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.relatedResource = relatedResource
        self.weight = weight
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
        self.weight = try container.decodeIfPresent(Int.self, forKey: .weight)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
        try container.encodeIfPresent(self.weight, forKey: .weight)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case relatedResource = "related_resource"
        case weight
    }
}