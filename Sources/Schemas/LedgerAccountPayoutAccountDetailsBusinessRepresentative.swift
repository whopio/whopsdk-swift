import Foundation

/// The business representative for this payout account
public struct LedgerAccountPayoutAccountDetailsBusinessRepresentative: Codable, Hashable, Sendable {
    /// The date of birth of the business representative in ISO 8601 format (YYYY-MM-DD).
    public let dateOfBirth: Nullable<String>
    /// The first name of the business representative.
    public let firstName: Nullable<String>
    /// The last name of the business representative.
    public let lastName: Nullable<String>
    /// The middle name of the business representative.
    public let middleName: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dateOfBirth: Nullable<String>,
        firstName: Nullable<String>,
        lastName: Nullable<String>,
        middleName: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dateOfBirth = try container.decode(Nullable<String>.self, forKey: .dateOfBirth)
        self.firstName = try container.decode(Nullable<String>.self, forKey: .firstName)
        self.lastName = try container.decode(Nullable<String>.self, forKey: .lastName)
        self.middleName = try container.decode(Nullable<String>.self, forKey: .middleName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.middleName, forKey: .middleName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dateOfBirth = "date_of_birth"
        case firstName = "first_name"
        case lastName = "last_name"
        case middleName = "middle_name"
    }
}