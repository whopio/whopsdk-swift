import Foundation

/// The connection type for ForumPost.
public struct ListForumPostsResponse: Codable, Hashable, Sendable {
    /// A list of nodes.
    public let data: [ForumPostListItem]
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [ForumPostListItem],
        pageInfo: PageInfo,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.pageInfo = pageInfo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([ForumPostListItem].self, forKey: .data)
        self.pageInfo = try container.decode(PageInfo.self, forKey: .pageInfo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.pageInfo, forKey: .pageInfo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pageInfo = "page_info"
    }
}