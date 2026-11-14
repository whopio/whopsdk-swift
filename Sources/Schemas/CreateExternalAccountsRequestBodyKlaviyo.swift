import Foundation

/// Connects the account's existing Klaviyo account with a private API key.
public struct CreateExternalAccountsRequestBodyKlaviyo: Codable, Hashable, Sendable {
    /// The Account (biz_ identifier) to create the external account for. An account-scoped API key may omit this to default to its own account. Account API keys cannot update their own account's branding through Update Account; use a user-authenticated path.
    public let accountId: String?
    /// A private Klaviyo API key with read access to Accounts. Whop checks the key with Klaviyo before connecting and never returns it. Connecting again replaces the saved key.
    public let apiKey: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String? = nil,
        apiKey: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.apiKey = apiKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encode(self.apiKey, forKey: .apiKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case apiKey = "api_key"
    }
}