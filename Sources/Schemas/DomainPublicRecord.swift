import Foundation

public struct DomainPublicRecord: Codable, Hashable, Sendable {
    /// Whether the domain's delegation is signed with DNSSEC, or `null` when the registry doesn't say.
    public let dnssec: Nullable<Bool>
    /// When the current registration expires, as an ISO 8601 timestamp, or `null` when the record omits it.
    public let expiresAt: Nullable<String>
    public let nameServers: [String]
    /// When the domain was first registered, as an ISO 8601 timestamp, or `null` when the record omits it.
    public let registeredAt: Nullable<String>
    /// Who the domain is registered to, often a privacy service or `Redacted For Privacy`. `null` when the record publishes no registrant.
    public let registrant: Nullable<DomainRegistrant>
    /// The registrar that manages the domain, or `null` when the record doesn't name one.
    public let registrar: Nullable<DomainRegistrar>
    public let statuses: [String]
    /// When the registration record last changed, as an ISO 8601 timestamp, or `null` when the record omits it.
    public let updatedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dnssec: Nullable<Bool>,
        expiresAt: Nullable<String>,
        nameServers: [String],
        registeredAt: Nullable<String>,
        registrant: Nullable<DomainRegistrant>,
        registrar: Nullable<DomainRegistrar>,
        statuses: [String],
        updatedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dnssec = dnssec
        self.expiresAt = expiresAt
        self.nameServers = nameServers
        self.registeredAt = registeredAt
        self.registrant = registrant
        self.registrar = registrar
        self.statuses = statuses
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dnssec = try container.decode(Nullable<Bool>.self, forKey: .dnssec)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.nameServers = try container.decode([String].self, forKey: .nameServers)
        self.registeredAt = try container.decode(Nullable<String>.self, forKey: .registeredAt)
        self.registrant = try container.decode(Nullable<DomainRegistrant>.self, forKey: .registrant)
        self.registrar = try container.decode(Nullable<DomainRegistrar>.self, forKey: .registrar)
        self.statuses = try container.decode([String].self, forKey: .statuses)
        self.updatedAt = try container.decode(Nullable<String>.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dnssec, forKey: .dnssec)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.nameServers, forKey: .nameServers)
        try container.encode(self.registeredAt, forKey: .registeredAt)
        try container.encode(self.registrant, forKey: .registrant)
        try container.encode(self.registrar, forKey: .registrar)
        try container.encode(self.statuses, forKey: .statuses)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dnssec
        case expiresAt = "expires_at"
        case nameServers = "name_servers"
        case registeredAt = "registered_at"
        case registrant
        case registrar
        case statuses
        case updatedAt = "updated_at"
    }
}