import Foundation

public struct DomainRegistrant: Codable, Hashable, Sendable {
    /// Registrant postal address as published, with lines separated by line breaks. Often only a state or region. `null` when withheld.
    public let address: Nullable<String>
    /// A web form for contacting the registrant, published when the registrar withholds their email. `null` when there is none.
    public let contactUrl: Nullable<String>
    /// Registrant country as an ISO 3166-1 alpha-2 code, such as `US`, or `null` when withheld.
    public let country: Nullable<String>
    /// Registrant email address, often a privacy forwarding address, or `null` when withheld.
    public let email: Nullable<String>
    /// Registrant name, or `null` when withheld.
    public let name: Nullable<String>
    /// Registrant organization, often a privacy service, or `null` when withheld.
    public let organization: Nullable<String>
    /// Registrant phone number, or `null` when withheld.
    public let phone: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: Nullable<String>,
        contactUrl: Nullable<String>,
        country: Nullable<String>,
        email: Nullable<String>,
        name: Nullable<String>,
        organization: Nullable<String>,
        phone: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.contactUrl = contactUrl
        self.country = country
        self.email = email
        self.name = name
        self.organization = organization
        self.phone = phone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(Nullable<String>.self, forKey: .address)
        self.contactUrl = try container.decode(Nullable<String>.self, forKey: .contactUrl)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.organization = try container.decode(Nullable<String>.self, forKey: .organization)
        self.phone = try container.decode(Nullable<String>.self, forKey: .phone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.contactUrl, forKey: .contactUrl)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.organization, forKey: .organization)
        try container.encode(self.phone, forKey: .phone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case contactUrl = "contact_url"
        case country
        case email
        case name
        case organization
        case phone
    }
}