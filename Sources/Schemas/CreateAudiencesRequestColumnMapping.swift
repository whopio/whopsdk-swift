import Foundation

/// CSV audiences only. Maps supported identity fields to CSV column headers. Map at least one of `email` or `phone`.
public struct CreateAudiencesRequestColumnMapping: Codable, Hashable, Sendable {
    /// CSV header for ISO 3166-1 alpha-2 country codes, such as `US`.
    public let country: String?
    /// CSV header for email addresses.
    public let email: String?
    /// CSV header for first names.
    public let firstName: String?
    /// CSV header for last names.
    public let lastName: String?
    /// CSV header for each customer's lifetime value — a non-negative number, currency symbols allowed. When mapped, Meta creates the audience as value-based, so lookalikes built from it favor people similar to the highest-value customers.
    public let ltv: String?
    /// CSV header for phone numbers.
    public let phone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String? = nil,
        email: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        ltv: String? = nil,
        phone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.ltv = ltv
        self.phone = phone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.ltv = try container.decodeIfPresent(String.self, forKey: .ltv)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.ltv, forKey: .ltv)
        try container.encodeIfPresent(self.phone, forKey: .phone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case ltv
        case phone
    }
}