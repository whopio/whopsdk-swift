import Foundation

/// The recipient of a third-party payout method. Present only for recipient payout methods.
public struct CreateMethodsResponseRecipient: Codable, Hashable, Sendable {
    /// ISO 3166-1 alpha-3 country code.
    public let country: String
    public let email: String
    public let firstName: String
    public let lastName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String,
        email: String,
        firstName: String,
        lastName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.email = try container.decode(String.self, forKey: .email)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case email
        case firstName = "first_name"
        case lastName = "last_name"
    }
}