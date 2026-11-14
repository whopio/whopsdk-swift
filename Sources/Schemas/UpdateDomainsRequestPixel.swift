import Foundation

/// Track page views on the domain with the Whop pixel. It needs no other capability: it stays `pending` until the pixel records a page view, and turns `action_required` if it goes 7 days without one. Pass `null` to stop tracking.
public struct UpdateDomainsRequestPixel: Codable, Hashable, Sendable {
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