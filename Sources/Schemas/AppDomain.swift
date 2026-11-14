import Foundation

public struct AppDomain: Codable, Hashable, Sendable {
    /// Normalized hostname assigned to this app.
    public let domain: String
    /// Domain ID, prefixed `dom_`.
    public let id: String
    /// Domain lifecycle status, matching the domain resource.
    public let status: AppDomainStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String,
        id: String,
        status: AppDomainStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.id = id
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.id = try container.decode(String.self, forKey: .id)
        self.status = try container.decode(AppDomainStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case id
        case status
    }
}