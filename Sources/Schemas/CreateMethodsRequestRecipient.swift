import Foundation

/// Creates a recipient payout account linked to the funding ledger as a non-default account, then saves the bank method on it. No Whop user, company, or recipient ledger is created. A valid recipient email is required. Recipient methods cannot be default or recurring methods and cannot use Plaid.
public struct CreateMethodsRequestRecipient: Codable, Hashable, Sendable {
    /// The recipient's address in recipient.country. Saved on the recipient payout account and supplied to bank methods that require address fields. Omit to retain the existing address when reusing a recipient.
    public let address: CreateMethodsRequestRecipientAddress?
    /// ISO 3166-1 alpha-2 or alpha-3 country code.
    public let country: String
    /// Required email for the recipient's MassPay payout account. Trimmed and lowercased.
    public let email: String
    /// Recipient's first name, at most 120 UTF-8 bytes. The trimmed full name, including a space between the names, must be at most 100 characters and cannot contain angle brackets or double quotes.
    public let firstName: String
    /// Recipient's last name, at most 120 UTF-8 bytes. The combined full name follows the same 100-character limit as a Whop user name.
    public let lastName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: CreateMethodsRequestRecipientAddress? = nil,
        country: String,
        email: String,
        firstName: String,
        lastName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.country = country
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(CreateMethodsRequestRecipientAddress.self, forKey: .address)
        self.country = try container.decode(String.self, forKey: .country)
        self.email = try container.decode(String.self, forKey: .email)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case country
        case email
        case firstName = "first_name"
        case lastName = "last_name"
    }
}