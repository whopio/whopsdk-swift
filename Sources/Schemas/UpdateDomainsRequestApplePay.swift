import Foundation

/// Accept Apple Pay at checkout on the domain. It needs no other capability. Whop registers the domain with Apple: it stays `pending` until Apple answers, then turns `ready`, or `action_required` when Apple couldn't fetch the domain association file. Serve the file, then check the domain to register it again. Pass `null` to turn Apple Pay off: Whop removes the domain from Apple, and the domain stays, like releasing any other capability.
public struct UpdateDomainsRequestApplePay: Codable, Hashable, Sendable {
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