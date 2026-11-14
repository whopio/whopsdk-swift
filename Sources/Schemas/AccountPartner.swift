import Foundation

public struct AccountPartner: Codable, Hashable, Sendable {
    /// Email address for contacting the partner. Null when the partner has not added their own email address.
    public let email: Nullable<String>
    /// User ID, prefixed `user_`.
    public let id: String
    /// Display name.
    public let name: Nullable<String>
    /// Avatar wrapper. Its `url` is always present, and is a generated placeholder when the user set no picture.
    public let profilePicture: UserProfilePicture
    /// Business the partner referred this account on behalf of, when the referral belongs to their team. `null` for a personal referral.
    public let referringAccount: Nullable<AccountSummary>
    /// Public username.
    public let username: String
    /// When the user became a verified Whop Partner, as an ISO 8601 timestamp. Null if not verified.
    public let whopPartnerVerifiedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: Nullable<String>,
        id: String,
        name: Nullable<String>,
        profilePicture: UserProfilePicture,
        referringAccount: Nullable<AccountSummary>,
        username: String,
        whopPartnerVerifiedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.referringAccount = referringAccount
        self.username = username
        self.whopPartnerVerifiedAt = whopPartnerVerifiedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePicture = try container.decode(UserProfilePicture.self, forKey: .profilePicture)
        self.referringAccount = try container.decode(Nullable<AccountSummary>.self, forKey: .referringAccount)
        self.username = try container.decode(String.self, forKey: .username)
        self.whopPartnerVerifiedAt = try container.decode(Nullable<String>.self, forKey: .whopPartnerVerifiedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.referringAccount, forKey: .referringAccount)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.whopPartnerVerifiedAt, forKey: .whopPartnerVerifiedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case id
        case name
        case profilePicture = "profile_picture"
        case referringAccount = "referring_account"
        case username
        case whopPartnerVerifiedAt = "whop_partner_verified_at"
    }
}