import Foundation

/// A company is a seller on Whop. Companies own products, manage members, and receive payouts.
public struct CompanyListItem: Codable, Hashable, Sendable {
    /// The datetime the company was created.
    public let createdAt: Date
    /// A promotional pitch written by the company creator, displayed to potential customers on the store page.
    public let description: Nullable<String>
    /// The unique identifier for the company.
    public let id: String
    /// The company's logo.
    public let logo: Nullable<CompanyListItemLogo>
    /// The total number of users who currently hold active memberships across all of this company's products.
    public let memberCount: Int
    /// A key-value JSON object of custom metadata for this company, managed by the platform that created the account.
    public let metadata: Nullable<[String: JSONValue]>
    /// The user who owns and has full administrative control over this company.
    public let ownerUser: CompanyListItemOwnerUser
    /// The total number of published customer reviews across all products for this company.
    public let publishedReviewsCount: Int
    /// URL slug for the account's store page, e.g. `pickaxe` in whop.com/pickaxe.
    public let route: String
    /// Whether Whop sends transactional emails (receipts, updates) to customers on behalf of this company.
    public let sendCustomerEmails: Bool
    /// The target audience for the company. Null if not set.
    public let targetAudience: Nullable<String>
    /// The display name of the company shown to customers.
    public let title: String
    /// The datetime the company was last updated.
    public let updatedAt: Date
    /// Whether this company has been verified by Whop's trust and safety team.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        description: Nullable<String>,
        id: String,
        logo: Nullable<CompanyListItemLogo>,
        memberCount: Int,
        metadata: Nullable<[String: JSONValue]>,
        ownerUser: CompanyListItemOwnerUser,
        publishedReviewsCount: Int,
        route: String,
        sendCustomerEmails: Bool,
        targetAudience: Nullable<String>,
        title: String,
        updatedAt: Date,
        verified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.logo = logo
        self.memberCount = memberCount
        self.metadata = metadata
        self.ownerUser = ownerUser
        self.publishedReviewsCount = publishedReviewsCount
        self.route = route
        self.sendCustomerEmails = sendCustomerEmails
        self.targetAudience = targetAudience
        self.title = title
        self.updatedAt = updatedAt
        self.verified = verified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.logo = try container.decode(Nullable<CompanyListItemLogo>.self, forKey: .logo)
        self.memberCount = try container.decode(Int.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.ownerUser = try container.decode(CompanyListItemOwnerUser.self, forKey: .ownerUser)
        self.publishedReviewsCount = try container.decode(Int.self, forKey: .publishedReviewsCount)
        self.route = try container.decode(String.self, forKey: .route)
        self.sendCustomerEmails = try container.decode(Bool.self, forKey: .sendCustomerEmails)
        self.targetAudience = try container.decode(Nullable<String>.self, forKey: .targetAudience)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logo, forKey: .logo)
        try container.encode(self.memberCount, forKey: .memberCount)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.ownerUser, forKey: .ownerUser)
        try container.encode(self.publishedReviewsCount, forKey: .publishedReviewsCount)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.sendCustomerEmails, forKey: .sendCustomerEmails)
        try container.encode(self.targetAudience, forKey: .targetAudience)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.verified, forKey: .verified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case description
        case id
        case logo
        case memberCount = "member_count"
        case metadata
        case ownerUser = "owner_user"
        case publishedReviewsCount = "published_reviews_count"
        case route
        case sendCustomerEmails = "send_customer_emails"
        case targetAudience = "target_audience"
        case title
        case updatedAt = "updated_at"
        case verified
    }
}