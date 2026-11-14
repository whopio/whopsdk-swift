import Foundation

public struct PasskeyUserEntity: Codable, Hashable, Sendable {
    /// The account's name, or its email address when it has none, for passkey pickers that show one.
    public let displayName: String
    /// The account's passkey user handle, base64url-encoded. Random, the same for every passkey on the account, and never a Whop ID. Send it back as `user_handle` when you register the passkey.
    public let id: String
    /// The account's email address, the identifier a passkey picker shows.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        displayName: String,
        id: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.displayName = displayName
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "display_name"
        case id
        case name
    }
}