import Foundation

/// Input for creating a social link for a company
public struct UpdateCompaniesRequestSocialLinksItem: Codable, Hashable, Sendable {
    /// The custom image for the social link
    public let image: Nullable<UpdateCompaniesRequestSocialLinksItemImage>?
    /// The order of the social link
    public let order: Nullable<String>?
    /// The title of the social link
    public let title: Nullable<String>?
    /// The URL of the social link
    public let url: String
    /// The website this link is for
    public let website: SocialLinkWebsites
    /// The order of the website social link
    public let websiteOrder: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        image: Nullable<UpdateCompaniesRequestSocialLinksItemImage>? = nil,
        order: Nullable<String>? = nil,
        title: Nullable<String>? = nil,
        url: String,
        website: SocialLinkWebsites,
        websiteOrder: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.image = image
        self.order = order
        self.title = title
        self.url = url
        self.website = website
        self.websiteOrder = websiteOrder
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeNullableIfPresent(UpdateCompaniesRequestSocialLinksItemImage.self, forKey: .image)
        self.order = try container.decodeNullableIfPresent(String.self, forKey: .order)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.website = try container.decode(SocialLinkWebsites.self, forKey: .website)
        self.websiteOrder = try container.decodeNullableIfPresent(String.self, forKey: .websiteOrder)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.image, forKey: .image)
        try container.encodeNullableIfPresent(self.order, forKey: .order)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.website, forKey: .website)
        try container.encodeNullableIfPresent(self.websiteOrder, forKey: .websiteOrder)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case image
        case order
        case title
        case url
        case website
        case websiteOrder = "website_order"
    }
}