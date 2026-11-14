import Foundation

public struct AutomationStepEmailConfig: Codable, Hashable, Sendable {
    /// The mailbox the email comes from, prefixed `emaddr_`: an email address on the account whose domain can send email. Naming one needs what `/email_addresses` asks to use it. `null` sends from the account's name through Whop.
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