import Foundation

/// Customer associated with the payment. Email requires member:email:read.
public struct LedgerActivityPaymentUser: Codable, Hashable, Sendable {
    /// Customer email, or null without member:email:read.
    public let email: Nullable<String>
    /// Customer ID, prefixed `user_`.
    public let id: String
    /// Customer display name.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: Nullable<String>,
        id: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case id
        case name
    }
}