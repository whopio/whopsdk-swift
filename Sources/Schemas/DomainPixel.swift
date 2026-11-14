import Foundation

public struct DomainPixel: Codable, Hashable, Sendable {
    /// `ready` while the Whop pixel recorded a page view on the domain in the last 7 days. `pending` until a pixel you asked for records its first one, and `action_required` once it goes 7 days without one; its issue says what to do.
    public let state: DomainPixelState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: DomainPixelState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(DomainPixelState.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case state
    }
}