import Foundation

public struct UserSocialLink: Codable, Hashable, Sendable {
    /// The link's URL.
    public let url: String
    /// The user's handle on the platform, as entered or as reported by the connected account. `null` for links without a handle, such as a personal site.
    public let username: Nullable<String>
    /// Whether Whop verified that the user owns the account.
    public let verified: Bool
    /// The platform the link points to. `website` is a personal site rather than a social platform.
    public let website: UserSocialLinkWebsite
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        username: Nullable<String>,
        verified: Bool,
        website: UserSocialLinkWebsite,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.username = username
        self.verified = verified
        self.website = website
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.website = try container.decode(UserSocialLinkWebsite.self, forKey: .website)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.verified, forKey: .verified)
        try container.encode(self.website, forKey: .website)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case username
        case verified
        case website
    }
}