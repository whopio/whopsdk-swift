import Foundation

public struct AutomationStepMessageConfig: Codable, Hashable, Sendable {
    /// The team member the message comes from, as a user ID prefixed `user_`. Only that member can name themselves. `null` sends as the account owner.
    public let senderId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        senderId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.senderId = senderId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.senderId = try container.decode(Nullable<String>.self, forKey: .senderId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.senderId, forKey: .senderId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case senderId = "sender_id"
    }
}