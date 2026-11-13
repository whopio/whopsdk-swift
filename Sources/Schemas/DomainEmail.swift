import Foundation

public struct DomainEmail: Codable, Hashable, Sendable {
    /// `pending` while Whop sets the domain up with its email provider and publishes its DNS records, `ready` once the provider verified them, and `action_required` when it couldn't; its issue says what happens next. `releasing` while Whop removes email from the domain.
    public let state: DomainEmailState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: DomainEmailState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(DomainEmailState.self, forKey: .state)
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