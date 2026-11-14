import Foundation

/// Send and receive email on the domain. It needs `registration` or `subdomain`, so only a domain bought through Whop, or a subdomain of one in the same account, can have it. Whop publishes the DNS records and stays `pending` until its email provider verifies them, then turns `ready`. Pass `null` to remove email.
public struct UpdateDomainsRequestEmail: Codable, Hashable, Sendable {
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        self.additionalProperties = try decoder.decodeAdditionalProperties(knownKeys: [])
    }

    public func encode(to encoder: Encoder) throws -> Void {
        try encoder.encodeAdditionalProperties(self.additionalProperties)
    }
}