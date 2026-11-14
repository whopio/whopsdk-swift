import Foundation

public struct RetrieveBreakdownResponseItemsItemAvatar: Codable, Hashable, Sendable {
    public let shape: RetrieveBreakdownResponseItemsItemAvatarShape
    /// The image to show, or `null` to fall back to the row's initials.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        shape: RetrieveBreakdownResponseItemsItemAvatarShape,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.shape = shape
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shape = try container.decode(RetrieveBreakdownResponseItemsItemAvatarShape.self, forKey: .shape)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.shape, forKey: .shape)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case shape
        case url
    }
}