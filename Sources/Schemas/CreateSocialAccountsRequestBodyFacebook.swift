import Foundation

/// Whop no longer creates Facebook pages, so this returns a `facebook_page_provisioning_retired` error.
public struct CreateSocialAccountsRequestBodyFacebook: Codable, Hashable, Sendable {
    /// The Account (biz_ identifier) to create the external account for. An account-scoped API key may omit this to default to its own account. Account API keys cannot update their own account's branding through Update Account; use a user-authenticated path.
    public let accountId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
    }
}