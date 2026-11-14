import Foundation

extension Requests {
    public struct CreateForumPostsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company whose public forum to post in. Required when experience_id is 'public'. For example, 'biz_xxxxx'.
        public let accountId: Nullable<String>?
        /// A list of file attachments to include with the post, such as images or videos.
        public let attachments: Nullable<[CreateForumPostsRequestAttachmentsItem]>?
        /// The main body of the post in Markdown format. For example, 'Check out this **update**'. Hidden if the post is paywalled and the viewer has not purchased access.
        public let content: Nullable<String>?
        /// The unique identifier of the experience to create this post in. For example, 'exp_xxxxx'. Pass 'public' along with account_id to automatically use the account's public forum.
        public let experienceId: String
        /// Whether to send this post as a mention notification to all users in the experience who have mentions enabled.
        public let isMention: Nullable<Bool>?
        /// The unique identifier of the parent post to comment on. Omit this field to create a top-level post.
        public let parentId: Nullable<String>?
        /// The price to unlock this post in the specified paywall currency. For example, 5.00 for $5.00. When set, users must purchase access to view the post content.
        public let paywallAmount: Nullable<Double>?
        /// The currency for the paywall price on this post. When set along with paywall_amount, users must purchase access to view the post content.
        public let paywallCurrency: Nullable<Currencies>?
        /// Whether this post should be pinned to the top of the forum.
        public let pinned: Nullable<Bool>?
        /// A poll to attach to this post, allowing members to vote on options.
        public let poll: Nullable<CreateForumPostsRequestPoll>?
        /// The rich content of the post in Tiptap JSON format. When provided, takes priority over the markdown content field for rendering.
        public let richContent: Nullable<String>?
        /// The title of the post, displayed prominently at the top. Required for paywalled posts as it remains visible to non-purchasers.
        public let title: Nullable<String>?
        /// Controls who can see this forum post, such as members only or public.
        public let visibility: Nullable<ForumPostVisibilityTypes>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: Nullable<String>? = nil,
            attachments: Nullable<[CreateForumPostsRequestAttachmentsItem]>? = nil,
            content: Nullable<String>? = nil,
            experienceId: String,
            isMention: Nullable<Bool>? = nil,
            parentId: Nullable<String>? = nil,
            paywallAmount: Nullable<Double>? = nil,
            paywallCurrency: Nullable<Currencies>? = nil,
            pinned: Nullable<Bool>? = nil,
            poll: Nullable<CreateForumPostsRequestPoll>? = nil,
            richContent: Nullable<String>? = nil,
            title: Nullable<String>? = nil,
            visibility: Nullable<ForumPostVisibilityTypes>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.attachments = attachments
            self.content = content
            self.experienceId = experienceId
            self.isMention = isMention
            self.parentId = parentId
            self.paywallAmount = paywallAmount
            self.paywallCurrency = paywallCurrency
            self.pinned = pinned
            self.poll = poll
            self.richContent = richContent
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
            self.attachments = try container.decodeNullableIfPresent([CreateForumPostsRequestAttachmentsItem].self, forKey: .attachments)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.experienceId = try container.decode(String.self, forKey: .experienceId)
            self.isMention = try container.decodeNullableIfPresent(Bool.self, forKey: .isMention)
            self.parentId = try container.decodeNullableIfPresent(String.self, forKey: .parentId)
            self.paywallAmount = try container.decodeNullableIfPresent(Double.self, forKey: .paywallAmount)
            self.paywallCurrency = try container.decodeNullableIfPresent(Currencies.self, forKey: .paywallCurrency)
            self.pinned = try container.decodeNullableIfPresent(Bool.self, forKey: .pinned)
            self.poll = try container.decodeNullableIfPresent(CreateForumPostsRequestPoll.self, forKey: .poll)
            self.richContent = try container.decodeNullableIfPresent(String.self, forKey: .richContent)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.visibility = try container.decodeNullableIfPresent(ForumPostVisibilityTypes.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.attachments, forKey: .attachments)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encode(self.experienceId, forKey: .experienceId)
            try container.encodeNullableIfPresent(self.isMention, forKey: .isMention)
            try container.encodeNullableIfPresent(self.parentId, forKey: .parentId)
            try container.encodeNullableIfPresent(self.paywallAmount, forKey: .paywallAmount)
            try container.encodeNullableIfPresent(self.paywallCurrency, forKey: .paywallCurrency)
            try container.encodeNullableIfPresent(self.pinned, forKey: .pinned)
            try container.encodeNullableIfPresent(self.poll, forKey: .poll)
            try container.encodeNullableIfPresent(self.richContent, forKey: .richContent)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case attachments
            case content
            case experienceId = "experience_id"
            case isMention = "is_mention"
            case parentId = "parent_id"
            case paywallAmount = "paywall_amount"
            case paywallCurrency = "paywall_currency"
            case pinned
            case poll
            case richContent = "rich_content"
            case title
            case visibility
        }
    }
}