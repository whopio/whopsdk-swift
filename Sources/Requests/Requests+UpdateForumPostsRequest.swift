import Foundation

extension Requests {
    public struct UpdateForumPostsRequest: Codable, Hashable, Sendable {
        /// A replacement list of file attachments for this post, such as images or videos.
        public let attachments: Nullable<[UpdateForumPostsRequestAttachmentsItem]>?
        /// The updated body of the post in Markdown format. For example, 'Check out this **update**'. Hidden if the post is paywalled and the viewer has not purchased access.
        public let content: Nullable<String>?
        /// Whether this post should be pinned to the top of the forum. Only top-level posts can be pinned, not comments.
        public let isPinned: Nullable<Bool>?
        /// The updated title of the post, displayed prominently at the top. Required for paywalled posts as it remains visible to non-purchasers.
        public let title: Nullable<String>?
        /// Controls who can see this forum post, such as members only or public.
        public let visibility: Nullable<ForumPostVisibilityTypes>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: Nullable<[UpdateForumPostsRequestAttachmentsItem]>? = nil,
            content: Nullable<String>? = nil,
            isPinned: Nullable<Bool>? = nil,
            title: Nullable<String>? = nil,
            visibility: Nullable<ForumPostVisibilityTypes>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.content = content
            self.isPinned = isPinned
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeNullableIfPresent([UpdateForumPostsRequestAttachmentsItem].self, forKey: .attachments)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.isPinned = try container.decodeNullableIfPresent(Bool.self, forKey: .isPinned)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.visibility = try container.decodeNullableIfPresent(ForumPostVisibilityTypes.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.attachments, forKey: .attachments)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.isPinned, forKey: .isPinned)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case content
            case isPinned = "is_pinned"
            case title
            case visibility
        }
    }
}