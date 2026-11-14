import Foundation

public struct ExperimentExposureBatch: Codable, Hashable, Sendable {
    public let exposures: [String: ExperimentExposure]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exposures: [String: ExperimentExposure],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exposures = exposures
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exposures = try container.decode([String: ExperimentExposure].self, forKey: .exposures)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.exposures, forKey: .exposures)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exposures
    }
}