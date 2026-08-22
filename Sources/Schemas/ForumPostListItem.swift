import Foundation

/// A post or comment in a forum feed, supporting rich text, attachments, polls, and reactions.
public struct ForumPostListItem: Codable, Hashable, Sendable {
    /// All file attachments on this post, such as images, documents, and videos.
    public let attachments: [ForumPostListItemAttachmentsItem]
    /// The total number of direct comments on this post.
    public let commentCount: Int
    /// The body of the forum post in Markdown format. Null if the post is paywalled and the current user does not have access.
    public let content: Nullable<String>
    /// The time this post was created, as a Unix timestamp.
    public let createdAt: Date
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// Whether this post has been edited after its initial creation.
    public let isEdited: Bool
    /// Whether this post is pinned to the top of the forum feed.
    public let isPinned: Bool
    /// Whether the author of this post is an admin of the company that owns the forum.
    public let isPosterAdmin: Bool
    /// The total number of like reactions this post has received.
    public let likeCount: Nullable<Int>
    /// The unique identifier of the parent post. Null if this is a top-level post.
    public let parentId: Nullable<String>
    /// The headline of the forum post. Null if the post has no title.
    public let title: Nullable<String>
    /// The time this post was last updated, as a Unix timestamp.
    public let updatedAt: Date
    /// The user who authored this forum post.
    public let user: ForumPostListItemUser
    /// The total number of times this post has been viewed by users.
    public let viewCount: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachments: [ForumPostListItemAttachmentsItem],
        commentCount: Int,
        content: Nullable<String>,
        createdAt: Date,
        id: String,
        isEdited: Bool,
        isPinned: Bool,
        isPosterAdmin: Bool,
        likeCount: Nullable<Int>,
        parentId: Nullable<String>,
        title: Nullable<String>,
        updatedAt: Date,
        user: ForumPostListItemUser,
        viewCount: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachments = attachments
        self.commentCount = commentCount
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.isEdited = isEdited
        self.isPinned = isPinned
        self.isPosterAdmin = isPosterAdmin
        self.likeCount = likeCount
        self.parentId = parentId
        self.title = title
        self.updatedAt = updatedAt
        self.user = user
        self.viewCount = viewCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachments = try container.decode([ForumPostListItemAttachmentsItem].self, forKey: .attachments)
        self.commentCount = try container.decode(Int.self, forKey: .commentCount)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.isEdited = try container.decode(Bool.self, forKey: .isEdited)
        self.isPinned = try container.decode(Bool.self, forKey: .isPinned)
        self.isPosterAdmin = try container.decode(Bool.self, forKey: .isPosterAdmin)
        self.likeCount = try container.decode(Nullable<Int>.self, forKey: .likeCount)
        self.parentId = try container.decode(Nullable<String>.self, forKey: .parentId)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(ForumPostListItemUser.self, forKey: .user)
        self.viewCount = try container.decode(Nullable<Int>.self, forKey: .viewCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.commentCount, forKey: .commentCount)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isEdited, forKey: .isEdited)
        try container.encode(self.isPinned, forKey: .isPinned)
        try container.encode(self.isPosterAdmin, forKey: .isPosterAdmin)
        try container.encode(self.likeCount, forKey: .likeCount)
        try container.encode(self.parentId, forKey: .parentId)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.viewCount, forKey: .viewCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachments
        case commentCount = "comment_count"
        case content
        case createdAt = "created_at"
        case id
        case isEdited = "is_edited"
        case isPinned = "is_pinned"
        case isPosterAdmin = "is_poster_admin"
        case likeCount = "like_count"
        case parentId = "parent_id"
        case title
        case updatedAt = "updated_at"
        case user
        case viewCount = "view_count"
    }
}