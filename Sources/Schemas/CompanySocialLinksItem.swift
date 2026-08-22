import Foundation

/// A social link attached to a resource on the site.
public struct CompanySocialLinksItem: Codable, Hashable, Sendable {
    /// The unique identifier for the social link.
    public let id: String
    /// The URL of the social media profile or external link.
    public let url: String
    /// The website
    public let website: SocialLinkWebsites
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        url: String,
        website: SocialLinkWebsites,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.url = url
        self.website = website
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.url = try container.decode(String.self, forKey: .url)
        self.website = try container.decode(SocialLinkWebsites.self, forKey: .website)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.website, forKey: .website)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case url
        case website
    }
}