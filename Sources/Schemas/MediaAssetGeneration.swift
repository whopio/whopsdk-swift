import Foundation

public struct MediaAssetGeneration: Codable, Hashable, Sendable {
    /// Requested video length in seconds. `null` for images.
    public let durationSeconds: Nullable<Double>
    /// What the asset was generated from.
    public let prompt: String
    public let referenceMedia: [String]
    /// Requested video resolution. `null` for images. `1080p` is not supported by Seedance 2.0 Fast or Mini; `4k` is only supported by Seedance 2.0.
    public let resolution: Nullable<MediaAssetGenerationResolution>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        durationSeconds: Nullable<Double>,
        prompt: String,
        referenceMedia: [String],
        resolution: Nullable<MediaAssetGenerationResolution>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.durationSeconds = durationSeconds
        self.prompt = prompt
        self.referenceMedia = referenceMedia
        self.resolution = resolution
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.durationSeconds = try container.decode(Nullable<Double>.self, forKey: .durationSeconds)
        self.prompt = try container.decode(String.self, forKey: .prompt)
        self.referenceMedia = try container.decode([String].self, forKey: .referenceMedia)
        self.resolution = try container.decode(Nullable<MediaAssetGenerationResolution>.self, forKey: .resolution)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.prompt, forKey: .prompt)
        try container.encode(self.referenceMedia, forKey: .referenceMedia)
        try container.encode(self.resolution, forKey: .resolution)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case durationSeconds = "duration_seconds"
        case prompt
        case referenceMedia = "reference_media"
        case resolution
    }
}