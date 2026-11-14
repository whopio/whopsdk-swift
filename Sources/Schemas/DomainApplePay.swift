import Foundation

public struct DomainApplePay: Codable, Hashable, Sendable {
    /// `pending` while Whop registers the domain with Apple, `ready` once Apple verified it, and `action_required` when Apple couldn't; its issue says how to fix it. `releasing` while Whop removes it from Apple.
    public let state: DomainApplePayState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: DomainApplePayState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(DomainApplePayState.self, forKey: .state)
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