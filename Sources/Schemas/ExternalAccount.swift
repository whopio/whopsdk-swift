import Foundation

public struct ExternalAccount: Codable, Hashable, Sendable {
    /// Why this external account currently can't be used for advertising — a failed share or a Meta-side restriction. Null when the account is healthy.
    public let error: Nullable<String>
    /// The platform-specific ID for this external account.
    public let externalId: Nullable<String>
    /// Unique identifier for the external account.
    public let id: String
    /// The display name of the external account on the platform.
    public let name: Nullable<String>
    /// The external account this one belongs to on the platform, such as the Facebook page that owns an Instagram account. Null when the external account stands on its own, or when it is a partner.
    public let parentExternalAccount: Nullable<ExternalAccountParent>
    /// Always `null`. Partnership ads are no longer available.
    public let partnershipStatus: Nullable<String>
    /// The platform the external account exists on.
    public let platform: ExternalAccountPlatform
    /// The URL where the profile picture of the external account can be accessed.
    public let profilePictureUrl: Nullable<String>
    public let scopes: [String]
    /// The URL where the external account can be accessed on the platform. Null while a Whop-owned account is still being provisioned.
    public let url: Nullable<String>
    /// The username of the external account on the platform. Null while a Whop-owned account is still being provisioned, and on platforms without usernames, such as Klaviyo.
    public let username: Nullable<String>
    /// Whether the external account is verified on the platform.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: Nullable<String>,
        externalId: Nullable<String>,
        id: String,
        name: Nullable<String>,
        parentExternalAccount: Nullable<ExternalAccountParent>,
        partnershipStatus: Nullable<String>,
        platform: ExternalAccountPlatform,
        profilePictureUrl: Nullable<String>,
        scopes: [String],
        url: Nullable<String>,
        username: Nullable<String>,
        verified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.externalId = externalId
        self.id = id
        self.name = name
        self.parentExternalAccount = parentExternalAccount
        self.partnershipStatus = partnershipStatus
        self.platform = platform
        self.profilePictureUrl = profilePictureUrl
        self.scopes = scopes
        self.url = url
        self.username = username
        self.verified = verified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(Nullable<String>.self, forKey: .error)
        self.externalId = try container.decode(Nullable<String>.self, forKey: .externalId)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.parentExternalAccount = try container.decode(Nullable<ExternalAccountParent>.self, forKey: .parentExternalAccount)
        self.partnershipStatus = try container.decode(Nullable<String>.self, forKey: .partnershipStatus)
        self.platform = try container.decode(ExternalAccountPlatform.self, forKey: .platform)
        self.profilePictureUrl = try container.decode(Nullable<String>.self, forKey: .profilePictureUrl)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.parentExternalAccount, forKey: .parentExternalAccount)
        try container.encode(self.partnershipStatus, forKey: .partnershipStatus)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.profilePictureUrl, forKey: .profilePictureUrl)
        try container.encode(self.scopes, forKey: .scopes)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.verified, forKey: .verified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case externalId = "external_id"
        case id
        case name
        case parentExternalAccount = "parent_external_account"
        case partnershipStatus = "partnership_status"
        case platform
        case profilePictureUrl = "profile_picture_url"
        case scopes
        case url
        case username
        case verified
    }
}