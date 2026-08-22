import Foundation

/// Fields that can be updated on an individual (KYC) verification. At least one field is required.
public struct UpdateVerificationsRequestBodyPersonalAddress: Codable, Hashable, Sendable {
    /// Legal business name for a sole proprietor or single-member LLC.
    public let businessName: String?
    /// Entity type for sole proprietors, such as `single_member_llc`. Supported values vary by country of incorporation — see [Business structures](/developer/verification/business-structures).
    public let businessStructure: String?
    /// The business ID number of the company, as appropriate for the company's country. Examples are an Employer Identification Number (EIN) in the US, a Business Number in Canada, or a Company Number in the UK.
    public let businessTaxIdentificationNumber: String?
    /// Two-letter ISO 3166-1 country code, for example `US`, `DE`, or `GB`.
    public let country: String?
    /// Formatted as `YYYY-MM-DD`.
    public let dateOfBirth: String?
    public let firstName: String?
    public let lastName: String?
    /// Personal address for the individual.
    public let personalAddress: UpdateVerificationsRequestBodyPersonalAddressPersonalAddress?
    /// Answers to items in `requested_information`. Each entry pairs the item `id` with one answer payload matching its `type`.
    public let requestedInformation: [UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItem]?
    /// The government-issued ID number of the person being verified — the individual for a KYC verification, or the business representative for a KYB verification — as appropriate for their country. Examples are a Social Security Number (SSN) in the US, or a Social Insurance Number in Canada.
    public let taxIdentificationNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businessName: String? = nil,
        businessStructure: String? = nil,
        businessTaxIdentificationNumber: String? = nil,
        country: String? = nil,
        dateOfBirth: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        personalAddress: UpdateVerificationsRequestBodyPersonalAddressPersonalAddress? = nil,
        requestedInformation: [UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItem]? = nil,
        taxIdentificationNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businessName = businessName
        self.businessStructure = businessStructure
        self.businessTaxIdentificationNumber = businessTaxIdentificationNumber
        self.country = country
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
        self.personalAddress = personalAddress
        self.requestedInformation = requestedInformation
        self.taxIdentificationNumber = taxIdentificationNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businessName = try container.decodeIfPresent(String.self, forKey: .businessName)
        self.businessStructure = try container.decodeIfPresent(String.self, forKey: .businessStructure)
        self.businessTaxIdentificationNumber = try container.decodeIfPresent(String.self, forKey: .businessTaxIdentificationNumber)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.personalAddress = try container.decodeIfPresent(UpdateVerificationsRequestBodyPersonalAddressPersonalAddress.self, forKey: .personalAddress)
        self.requestedInformation = try container.decodeIfPresent([UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItem].self, forKey: .requestedInformation)
        self.taxIdentificationNumber = try container.decodeIfPresent(String.self, forKey: .taxIdentificationNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.businessName, forKey: .businessName)
        try container.encodeIfPresent(self.businessStructure, forKey: .businessStructure)
        try container.encodeIfPresent(self.businessTaxIdentificationNumber, forKey: .businessTaxIdentificationNumber)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.personalAddress, forKey: .personalAddress)
        try container.encodeIfPresent(self.requestedInformation, forKey: .requestedInformation)
        try container.encodeIfPresent(self.taxIdentificationNumber, forKey: .taxIdentificationNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businessName = "business_name"
        case businessStructure = "business_structure"
        case businessTaxIdentificationNumber = "business_tax_identification_number"
        case country
        case dateOfBirth = "date_of_birth"
        case firstName = "first_name"
        case lastName = "last_name"
        case personalAddress = "personal_address"
        case requestedInformation = "requested_information"
        case taxIdentificationNumber = "tax_identification_number"
    }
}