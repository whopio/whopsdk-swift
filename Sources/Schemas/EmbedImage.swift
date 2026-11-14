import Foundation

public struct EmbedImage: Codable, Hashable, Sendable {
    public let blurhash: Nullable<String>
    public let height: Nullable<Int>
    public let url: String
    public let width: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        blurhash: Nullable<String>,
        height: Nullable<Int>,
        url: String,
        width: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.blurhash = blurhash
        self.height = height
        self.url = url
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blurhash = try container.decode(Nullable<String>.self, forKey: .blurhash)
        self.height = try container.decode(Nullable<Int>.self, forKey: .height)
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decode(Nullable<Int>.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.blurhash, forKey: .blurhash)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case blurhash
        case height
        case url
        case width
    }
}