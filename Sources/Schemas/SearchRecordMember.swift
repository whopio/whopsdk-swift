import Foundation

public struct SearchRecordMember: Codable, Hashable, Sendable {
    /// Account the record belongs to, prefixed `biz_`.
    public let accountId: String
    /// Short text about the record, such as an account's headline or a case's reason. Display text in your locale that can change without a version change. `null` when there's none.
    public let description: Nullable<String>
    /// The user's email address. `null` without `member:email:read` on the account, when the buyer is another business, or when the user has no assigned email.
    public let email: Nullable<String>
    /// Member ID, prefixed `mber_`.
    public let id: String
    /// Logo or avatar. `null` when there's none.
    public let imageUrl: Nullable<String>
    /// `joined` while the member is part of the account, `left` after they leave.
    public let status: SearchRecordMemberStatus
    /// Line shown under the title, such as the account or product the record belongs to. Display text in your locale that can change without a version change. `null` when there's none.
    public let subtitle: Nullable<String>
    /// Record name, such as a customer's name or a promo code. Display text in your locale that can change without a version change, so show it rather than parse it. `null` when the record has no name.
    public let title: Nullable<String>
    /// The user's username. `null` when the buyer is another business.
    public let username: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        description: Nullable<String>,
        email: Nullable<String>,
        id: String,
        imageUrl: Nullable<String>,
        status: SearchRecordMemberStatus,
        subtitle: Nullable<String>,
        title: Nullable<String>,
        username: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.description = description
        self.email = email
        self.id = id
        self.imageUrl = imageUrl
        self.status = status
        self.subtitle = subtitle
        self.title = title
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.status = try container.decode(SearchRecordMemberStatus.self, forKey: .status)
        self.subtitle = try container.decode(Nullable<String>.self, forKey: .subtitle)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.subtitle, forKey: .subtitle)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case description
        case email
        case id
        case imageUrl = "image_url"
        case status
        case subtitle
        case title
        case username
    }
}