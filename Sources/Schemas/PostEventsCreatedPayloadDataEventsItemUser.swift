import Foundation

/// Who the event was about, as far as the page knew. Keys the event did not carry are left out.
public struct PostEventsCreatedPayloadDataEventsItemUser: Codable, Hashable, Sendable {
    public let email: Nullable<String>?
    public let firstName: Nullable<String>?
    public let lastName: Nullable<String>?
    public let name: Nullable<String>?
    public let phone: Nullable<String>?
    public let userId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: Nullable<String>? = nil,
        firstName: Nullable<String>? = nil,
        lastName: Nullable<String>? = nil,
        name: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        userId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.name = name
        self.phone = phone
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeNullableIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeNullableIfPresent(String.self, forKey: .lastName)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.firstName, forKey: .firstName)
        try container.encodeNullableIfPresent(self.lastName, forKey: .lastName)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case name
        case phone
        case userId = "user_id"
    }
}