import Foundation

/// Prove you control the domain's DNS: Whop returns a TXT record to publish in `issues`, and whoever publishes it owns the domain on Whop. Pass `null` to release it. Can't be combined with `registration`.
public struct UpdateDomainsRequestVerification: Codable, Hashable, Sendable {
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