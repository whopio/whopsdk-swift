import Foundation

public struct SearchRecordAccount: Codable, Hashable, Sendable {
    /// Account banner image URL. `null` when there's none.
    public let bannerImageUrl: Nullable<String>
    /// Short text about the record, such as an account's headline or a case's reason. Display text in your locale that can change without a version change. `null` when there's none.
    public let description: Nullable<String>
    /// Account ID, prefixed `biz_`.
    public let id: String
    /// Logo or avatar. `null` when there's none.
    public let imageUrl: Nullable<String>
    /// Platform account this subaccount belongs to, prefixed `biz_`. `null` when it isn't a subaccount.
    public let parentAccountId: Nullable<String>
    /// Line shown under the title, such as the account or product the record belongs to. Display text in your locale that can change without a version change. `null` when there's none.
    public let subtitle: Nullable<String>
    /// Record name, such as a customer's name or a promo code. Display text in your locale that can change without a version change, so show it rather than parse it. `null` when the record has no name.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bannerImageUrl: Nullable<String>,
        description: Nullable<String>,
        id: String,
        imageUrl: Nullable<String>,
        parentAccountId: Nullable<String>,
        subtitle: Nullable<String>,
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bannerImageUrl = bannerImageUrl
        self.description = description
        self.id = id
        self.imageUrl = imageUrl
        self.parentAccountId = parentAccountId
        self.subtitle = subtitle
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bannerImageUrl = try container.decode(Nullable<String>.self, forKey: .bannerImageUrl)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.parentAccountId = try container.decode(Nullable<String>.self, forKey: .parentAccountId)
        self.subtitle = try container.decode(Nullable<String>.self, forKey: .subtitle)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bannerImageUrl, forKey: .bannerImageUrl)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.parentAccountId, forKey: .parentAccountId)
        try container.encode(self.subtitle, forKey: .subtitle)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bannerImageUrl = "banner_image_url"
        case description
        case id
        case imageUrl = "image_url"
        case parentAccountId = "parent_account_id"
        case subtitle
        case title
    }
}