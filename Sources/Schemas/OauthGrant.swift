import Foundation

public struct OauthGrant: Codable, Hashable, Sendable {
    /// The account the grant is scoped to, prefixed `biz_`. `null` when the user authorized the app for themselves rather than for one of their accounts.
    public let accountId: Nullable<String>
    /// The app this grant authorizes, prefixed `app_`.
    public let appId: String
    /// When the user last authorized the app, as an ISO 8601 timestamp.
    public let authorizedAt: Nullable<String>
    /// When the user first authorized the app, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Grant ID, prefixed `oag_`.
    public let id: String
    /// Where to send the user to finish the flow: the `redirect_uri` you supplied with the authorization `code` appended, and `state` when you supplied one. Its scheme, host, port, and path come back exactly as sent — never re-cased or re-encoded — because the client matches them against its registered URI. Returned only once, on create: the code is single-use and expires 10 minutes after it is issued, so redirect immediately.
    public let redirectUrl: String?
    /// When the grant was revoked, as an ISO 8601 timestamp, or `null` while it is still in force. A revoked grant authorizes nothing — treat its `scopes` as no longer granted.
    public let revokedAt: Nullable<String>
    public let scopes: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        appId: String,
        authorizedAt: Nullable<String>,
        createdAt: String,
        id: String,
        redirectUrl: String? = nil,
        revokedAt: Nullable<String>,
        scopes: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.appId = appId
        self.authorizedAt = authorizedAt
        self.createdAt = createdAt
        self.id = id
        self.redirectUrl = redirectUrl
        self.revokedAt = revokedAt
        self.scopes = scopes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.authorizedAt = try container.decode(Nullable<String>.self, forKey: .authorizedAt)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.redirectUrl = try container.decodeIfPresent(String.self, forKey: .redirectUrl)
        self.revokedAt = try container.decode(Nullable<String>.self, forKey: .revokedAt)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.appId, forKey: .appId)
        try container.encode(self.authorizedAt, forKey: .authorizedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.redirectUrl, forKey: .redirectUrl)
        try container.encode(self.revokedAt, forKey: .revokedAt)
        try container.encode(self.scopes, forKey: .scopes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case appId = "app_id"
        case authorizedAt = "authorized_at"
        case createdAt = "created_at"
        case id
        case redirectUrl = "redirect_url"
        case revokedAt = "revoked_at"
        case scopes
    }
}