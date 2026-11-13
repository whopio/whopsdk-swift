import Foundation

/// Details for a company card's assigned member when they are not registered as a cardholder yet. Send with billing to register them and start provisioning in one call instead of sending them an onboarding invitation. The legal name comes from the member's approved identity verification when they have one, and from these fields when they do not.
public struct CreateCardsRequestCardholder: Codable, Hashable, Sendable {
    /// The member's email address. Defaults to the email on their user.
    public let email: String?
    /// The member's legal first name.
    public let firstName: String?
    /// The member's legal last name.
    public let lastName: String?
    /// The member's phone number.
    public let phone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        phone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.phone, forKey: .phone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
    }
}