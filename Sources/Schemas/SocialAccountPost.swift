import Foundation

public struct SocialAccountPost: Codable, Hashable, Sendable {
    /// The post's call-to-action button, for example shop_now (Facebook only; null for Instagram and TikTok).
    public let callToAction: Nullable<SocialAccountPostCallToAction>
    /// The URL the post's call-to-action drives to (Facebook only; null for Instagram and TikTok).
    public let destinationUrl: Nullable<String>
    /// An iframe-embeddable URL for previewing the post inline (the platform's player or post embed). For TikTok this is the only preview, since media_url is null; for Facebook and Instagram it supplements media_url. Null when no public embed is available.
    public let embedUrl: Nullable<String>
    /// The platform's own identifier for the post or media. Use it to reference the post on an ad.
    public let id: String
    /// The URL of the post's media — the image for image posts, the playable video file for video posts. Null for TikTok, which exposes no raw file (use embed_url). Meta URLs are signed and expire after roughly 24 hours, so don't store them.
    public let mediaUrl: Nullable<String>
    public let restrictions: [SocialAccountPostRestrictionsItem]
    /// Poster image for video posts (always set for TikTok, which is video-only); null for image posts, where media_url is already the image.
    public let thumbnailUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callToAction: Nullable<SocialAccountPostCallToAction>,
        destinationUrl: Nullable<String>,
        embedUrl: Nullable<String>,
        id: String,
        mediaUrl: Nullable<String>,
        restrictions: [SocialAccountPostRestrictionsItem],
        thumbnailUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callToAction = callToAction
        self.destinationUrl = destinationUrl
        self.embedUrl = embedUrl
        self.id = id
        self.mediaUrl = mediaUrl
        self.restrictions = restrictions
        self.thumbnailUrl = thumbnailUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callToAction = try container.decode(Nullable<SocialAccountPostCallToAction>.self, forKey: .callToAction)
        self.destinationUrl = try container.decode(Nullable<String>.self, forKey: .destinationUrl)
        self.embedUrl = try container.decode(Nullable<String>.self, forKey: .embedUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.mediaUrl = try container.decode(Nullable<String>.self, forKey: .mediaUrl)
        self.restrictions = try container.decode([SocialAccountPostRestrictionsItem].self, forKey: .restrictions)
        self.thumbnailUrl = try container.decode(Nullable<String>.self, forKey: .thumbnailUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callToAction, forKey: .callToAction)
        try container.encode(self.destinationUrl, forKey: .destinationUrl)
        try container.encode(self.embedUrl, forKey: .embedUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.mediaUrl, forKey: .mediaUrl)
        try container.encode(self.restrictions, forKey: .restrictions)
        try container.encode(self.thumbnailUrl, forKey: .thumbnailUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callToAction = "call_to_action"
        case destinationUrl = "destination_url"
        case embedUrl = "embed_url"
        case id
        case mediaUrl = "media_url"
        case restrictions
        case thumbnailUrl = "thumbnail_url"
    }
}