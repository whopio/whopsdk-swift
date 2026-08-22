import Foundation

public struct AdCreative: Codable, Hashable, Sendable {
    /// The saved crop window for this creative, in source image pixels. Null for the original asset or a format that has not been cropped.
    public let crop: Nullable<AdCreativeCrop>
    /// The placement variant this asset covers, or null for the original asset.
    public let format: Nullable<AdCreativeFormat>
    /// The creative attachment's file id.
    public let id: String
    /// The kind of asset, image or video.
    public let mediaType: Nullable<String>
    /// CDN url of the asset.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        crop: Nullable<AdCreativeCrop>,
        format: Nullable<AdCreativeFormat>,
        id: String,
        mediaType: Nullable<String>,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.crop = crop
        self.format = format
        self.id = id
        self.mediaType = mediaType
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.crop = try container.decode(Nullable<AdCreativeCrop>.self, forKey: .crop)
        self.format = try container.decode(Nullable<AdCreativeFormat>.self, forKey: .format)
        self.id = try container.decode(String.self, forKey: .id)
        self.mediaType = try container.decode(Nullable<String>.self, forKey: .mediaType)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.crop, forKey: .crop)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.mediaType, forKey: .mediaType)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case crop
        case format
        case id
        case mediaType = "media_type"
        case url
    }
}