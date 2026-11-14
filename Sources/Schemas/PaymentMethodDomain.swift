import Foundation

public struct PaymentMethodDomain: Codable, Hashable, Sendable {
    /// ID of the account the domain is registered for, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// When the domain was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Hostname the checkout is served from (e.g. `checkout.example.com`).
    public let hostname: String
    /// Payment method domain ID: the ID of the account's domain for the hostname, prefixed `dom_`, or `pmd_` for some older domains.
    public let id: String
    /// Wallet provider the domain is registered with.
    public let provider: PaymentMethodDomainProvider
    /// Verification status. `pending` means the provider could not fetch the domain-association file yet; only `verified` domains show wallet payment methods at checkout.
    public let status: PaymentMethodDomainStatus
    /// When the domain was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        createdAt: String,
        hostname: String,
        id: String,
        provider: PaymentMethodDomainProvider,
        status: PaymentMethodDomainStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.hostname = hostname
        self.id = id
        self.provider = provider
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.hostname = try container.decode(String.self, forKey: .hostname)
        self.id = try container.decode(String.self, forKey: .id)
        self.provider = try container.decode(PaymentMethodDomainProvider.self, forKey: .provider)
        self.status = try container.decode(PaymentMethodDomainStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.hostname, forKey: .hostname)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case hostname
        case id
        case provider
        case status
        case updatedAt = "updated_at"
    }
}