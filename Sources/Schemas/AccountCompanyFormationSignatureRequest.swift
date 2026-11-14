import Foundation

public struct AccountCompanyFormationSignatureRequest: Codable, Hashable, Sendable {
    /// When the signing URL expires, as an ISO 8601 timestamp. Present only when the signing URL is included.
    public let expiresAt: String?
    /// `pending` when a signing session is ready for the founder; `unknown` when the signature state could not be determined.
    public let status: AccountCompanyFormationSignatureRequestStatus
    /// Hosted signing URL where the founder completes the form. Present while `status` is `pending` and the caller has `incorporation:write`. Omitted from webhooks.
    public let url: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        expiresAt: String? = nil,
        status: AccountCompanyFormationSignatureRequestStatus,
        url: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.expiresAt = expiresAt
        self.status = status
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.status = try container.decode(AccountCompanyFormationSignatureRequestStatus.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case expiresAt = "expires_at"
        case status
        case url
    }
}