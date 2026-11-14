import Foundation

public struct ExperimentControl: Codable, Hashable, Sendable {
    public let relatedResource: ExperimentResourceReference?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        relatedResource: ExperimentResourceReference? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.relatedResource = relatedResource
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case relatedResource = "related_resource"
    }
}