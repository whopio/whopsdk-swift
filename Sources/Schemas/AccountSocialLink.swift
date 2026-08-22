import Foundation

public struct AccountSocialLink: Codable, Hashable, Sendable {
    /// The ID of the social link
    public let id: String
    /// The optional display title for the social link
    public let title: Nullable<String>
    /// The social link URL
    public let url: String
    /// The social platform for this link
    public let website: AccountSocialLinkWebsite
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        title: Nullable<String>,
        url: String,
        website: AccountSocialLinkWebsite,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.title = title
        self.url = url
        self.website = website
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.website = try container.decode(AccountSocialLinkWebsite.self, forKey: .website)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.website, forKey: .website)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case url
        case website
    }
}