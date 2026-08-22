import Foundation

/// User identity and profile data.
public struct CreateEventsRequestUser: Codable, Hashable, Sendable {
    /// An anonymous identifier for the user.
    public let anonymousId: Nullable<String>?
    /// Date of birth (YYYY-MM-DD).
    public let birthdate: Nullable<String>?
    /// City.
    public let city: Nullable<String>?
    /// Country.
    public let country: Nullable<String>?
    /// Email address.
    public let email: Nullable<String>?
    /// An external identifier for the user.
    public let externalId: Nullable<String>?
    /// First name.
    public let firstName: Nullable<String>?
    /// Gender.
    public let gender: Nullable<CreateEventsRequestUserGender>?
    /// Last name.
    public let lastName: Nullable<String>?
    /// A second anonymous identifier to link to this user (e.g. captured across an iframe boundary).
    public let linkedAnonymousId: Nullable<String>?
    /// A wuid from a linked frame, captured across an iframe boundary.
    public let linkedWuid: Nullable<String>?
    /// The Whop member ID.
    public let memberId: Nullable<String>?
    /// The Whop membership ID.
    public let membershipId: Nullable<String>?
    /// Full display name.
    public let name: Nullable<String>?
    /// Phone number.
    public let phone: Nullable<String>?
    /// Postal code.
    public let postalCode: Nullable<String>?
    /// State or region.
    public let state: Nullable<String>?
    /// The Whop user ID.
    public let userId: Nullable<String>?
    /// Username.
    public let username: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        anonymousId: Nullable<String>? = nil,
        birthdate: Nullable<String>? = nil,
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        email: Nullable<String>? = nil,
        externalId: Nullable<String>? = nil,
        firstName: Nullable<String>? = nil,
        gender: Nullable<CreateEventsRequestUserGender>? = nil,
        lastName: Nullable<String>? = nil,
        linkedAnonymousId: Nullable<String>? = nil,
        linkedWuid: Nullable<String>? = nil,
        memberId: Nullable<String>? = nil,
        membershipId: Nullable<String>? = nil,
        name: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        postalCode: Nullable<String>? = nil,
        state: Nullable<String>? = nil,
        userId: Nullable<String>? = nil,
        username: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.anonymousId = anonymousId
        self.birthdate = birthdate
        self.city = city
        self.country = country
        self.email = email
        self.externalId = externalId
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
        self.linkedAnonymousId = linkedAnonymousId
        self.linkedWuid = linkedWuid
        self.memberId = memberId
        self.membershipId = membershipId
        self.name = name
        self.phone = phone
        self.postalCode = postalCode
        self.state = state
        self.userId = userId
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.anonymousId = try container.decodeNullableIfPresent(String.self, forKey: .anonymousId)
        self.birthdate = try container.decodeNullableIfPresent(String.self, forKey: .birthdate)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
        self.firstName = try container.decodeNullableIfPresent(String.self, forKey: .firstName)
        self.gender = try container.decodeNullableIfPresent(CreateEventsRequestUserGender.self, forKey: .gender)
        self.lastName = try container.decodeNullableIfPresent(String.self, forKey: .lastName)
        self.linkedAnonymousId = try container.decodeNullableIfPresent(String.self, forKey: .linkedAnonymousId)
        self.linkedWuid = try container.decodeNullableIfPresent(String.self, forKey: .linkedWuid)
        self.memberId = try container.decodeNullableIfPresent(String.self, forKey: .memberId)
        self.membershipId = try container.decodeNullableIfPresent(String.self, forKey: .membershipId)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.postalCode = try container.decodeNullableIfPresent(String.self, forKey: .postalCode)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
        self.username = try container.decodeNullableIfPresent(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.anonymousId, forKey: .anonymousId)
        try container.encodeNullableIfPresent(self.birthdate, forKey: .birthdate)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
        try container.encodeNullableIfPresent(self.firstName, forKey: .firstName)
        try container.encodeNullableIfPresent(self.gender, forKey: .gender)
        try container.encodeNullableIfPresent(self.lastName, forKey: .lastName)
        try container.encodeNullableIfPresent(self.linkedAnonymousId, forKey: .linkedAnonymousId)
        try container.encodeNullableIfPresent(self.linkedWuid, forKey: .linkedWuid)
        try container.encodeNullableIfPresent(self.memberId, forKey: .memberId)
        try container.encodeNullableIfPresent(self.membershipId, forKey: .membershipId)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
        try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        try container.encodeNullableIfPresent(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case anonymousId = "anonymous_id"
        case birthdate
        case city
        case country
        case email
        case externalId = "external_id"
        case firstName = "first_name"
        case gender
        case lastName = "last_name"
        case linkedAnonymousId = "linked_anonymous_id"
        case linkedWuid = "linked_wuid"
        case memberId = "member_id"
        case membershipId = "membership_id"
        case name
        case phone
        case postalCode = "postal_code"
        case state
        case userId = "user_id"
        case username
    }
}