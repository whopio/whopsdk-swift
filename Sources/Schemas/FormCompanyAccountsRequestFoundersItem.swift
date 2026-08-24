import Foundation

public struct FormCompanyAccountsRequestFoundersItem: Codable, Hashable, Sendable {
    /// Founder's personal address.
    public let address: FormCompanyAccountsRequestFoundersItemAddress
    /// Formatted as `YYYY-MM-DD`.
    public let dateOfBirth: String?
    public let email: String
    public let firstName: String
    /// Marks the responsible party for the filing. Exactly one founder must be primary.
    public let isPrimary: Bool
    public let lastName: String
    /// The founder's ownership share: greater than `0`, at most `100`. Shares across founders must total `100`. Required when `entity_type` is `llc`; ignored for C-Corps.
    public let ownershipPercentage: Double?
    /// Phone number in E.164 format, for example `+12125550100`.
    public let phone: String
    /// Officer roles held by the member — one member can hold several. Required (at least one role) for every member when `entity_type` is `c_corp`; ignored for LLCs. Across all members every role must be covered; `president`, `secretary` and `treasurer` may each be held by only one member, while `director` may repeat.
    public let roles: [FormCompanyAccountsRequestFoundersItemRolesItem]?
    /// The founder's US Social Security Number. Leave empty if the founder is not a US resident. Non-US founders can request expedited EIN processing via the `expedite_ein` option.
    public let ssn: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: FormCompanyAccountsRequestFoundersItemAddress,
        dateOfBirth: String? = nil,
        email: String,
        firstName: String,
        isPrimary: Bool,
        lastName: String,
        ownershipPercentage: Double? = nil,
        phone: String,
        roles: [FormCompanyAccountsRequestFoundersItemRolesItem]? = nil,
        ssn: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.firstName = firstName
        self.isPrimary = isPrimary
        self.lastName = lastName
        self.ownershipPercentage = ownershipPercentage
        self.phone = phone
        self.roles = roles
        self.ssn = ssn
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(FormCompanyAccountsRequestFoundersItemAddress.self, forKey: .address)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth)
        self.email = try container.decode(String.self, forKey: .email)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.isPrimary = try container.decode(Bool.self, forKey: .isPrimary)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.ownershipPercentage = try container.decodeIfPresent(Double.self, forKey: .ownershipPercentage)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.roles = try container.decodeIfPresent([FormCompanyAccountsRequestFoundersItemRolesItem].self, forKey: .roles)
        self.ssn = try container.decodeIfPresent(String.self, forKey: .ssn)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.address, forKey: .address)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.isPrimary, forKey: .isPrimary)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.ownershipPercentage, forKey: .ownershipPercentage)
        try container.encode(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.roles, forKey: .roles)
        try container.encodeIfPresent(self.ssn, forKey: .ssn)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case dateOfBirth = "date_of_birth"
        case email
        case firstName = "first_name"
        case isPrimary = "is_primary"
        case lastName = "last_name"
        case ownershipPercentage = "ownership_percentage"
        case phone
        case roles
        case ssn
    }
}