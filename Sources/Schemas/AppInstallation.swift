import Foundation

public struct AppInstallation: Codable, Hashable, Sendable {
    /// Account the app is installed on.
    public let account: AccountSummary
    /// App that is installed.
    public let app: AppSummary
    /// When the app was first installed on the account, as an ISO 8601 timestamp. Installing the app again later keeps the original time.
    public let createdAt: String
    /// Your app's own identifier for this installation, such as the ID of the linked account in another system, or `null` when none is set. At most 255 characters and unique across your app's installations, so you can find an installation with `GET /app_installations?external_id=`; setting one another installation already has returns a `409`. Only the app and its developer see it; for the account the app is installed on it is always `null`.
    public let externalId: Nullable<String>
    /// App installation ID, prefixed `aag_`.
    public let id: String
    /// String keys and values your app stores about this installation, such as a sync cursor or the ID of the linked account in another system. Empty until your app sets a key, and kept if the account removes the app and installs it again. At most 50 keys; keys are at most 100 characters and values at most 500. Only the app can change it. Only the app and its developer see it; for the account the app is installed on it is always `null`.
    public let metadata: Nullable<[String: Nullable<String>]>
    /// Whether the app now asks for permissions the account hasn't approved yet.
    public let requestingReauthorization: Bool
    /// When the installation last changed, such as a `metadata` update or the account changing the app's permissions, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: AccountSummary,
        app: AppSummary,
        createdAt: String,
        externalId: Nullable<String>,
        id: String,
        metadata: Nullable<[String: Nullable<String>]>,
        requestingReauthorization: Bool,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.app = app
        self.createdAt = createdAt
        self.externalId = externalId
        self.id = id
        self.metadata = metadata
        self.requestingReauthorization = requestingReauthorization
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(AccountSummary.self, forKey: .account)
        self.app = try container.decode(AppSummary.self, forKey: .app)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.externalId = try container.decode(Nullable<String>.self, forKey: .externalId)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode(Nullable<[String: Nullable<String>]>.self, forKey: .metadata)
        self.requestingReauthorization = try container.decode(Bool.self, forKey: .requestingReauthorization)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.app, forKey: .app)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.requestingReauthorization, forKey: .requestingReauthorization)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case app
        case createdAt = "created_at"
        case externalId = "external_id"
        case id
        case metadata
        case requestingReauthorization = "requesting_reauthorization"
        case updatedAt = "updated_at"
    }
}