import Foundation

/// Fields that can be updated on a business entity (KYB) verification. At least one field is required.
public struct UpdateVerificationsRequestBodyBusinessAddress: Codable, Hashable, Sendable {
    /// Business address.
    public let businessAddress: UpdateVerificationsRequestBodyBusinessAddressBusinessAddress?
    /// Legal business name.
    public let businessName: String?
    /// Legal entity structure of the business, such as `private_corporation` or `sole_proprietorship`. Supported values vary by country of incorporation — see [Business structures](/developer/verification/business-structures).
    public let businessStructure: String?
    /// The business ID number of the company, as appropriate for the company's country. Examples are an Employer Identification Number (EIN) in the US, a Business Number in Canada, or a Company Number in the UK.
    public let businessTaxIdentificationNumber: String?
    /// Two-letter ISO 3166-1 country code, for example `US`, `DE`, or `GB`.
    public let country: String?
    /// Business representative's date of birth, formatted as `YYYY-MM-DD`.
    public let dateOfBirth: String?
    /// Company formation documents, each the ID of a file uploaded with Create File and not yet attached to anything else, prefixed `file_`. Send the ID once its `upload_status` is `ready`. Each file must be a PDF, JPEG, or PNG of up to 10MB. They are filed under the business's country, from `country`, `address`, or an earlier request. A document of a kind already on file is kept unless it was rejected, so a retried request does not add a second copy. The hosted session at `session_url` collects anything still missing.
    public let documents: UpdateVerificationsRequestBodyBusinessAddressDocuments?
    /// First name of the business representative.
    public let firstName: String?
    /// Date the business was incorporated, formatted as `YYYY-MM-DD`. Cannot be in the future. Sent to the verification provider and returned in the response; `requested_information` asks for it while it is still missing.
    public let incorporationDate: CalendarDate?
    /// Last name of the business representative.
    public let lastName: String?
    /// Owners of the business, up to 10 per request. Once the company details, the company documents, and the owners are in and every new owner's documents were sent, Create Verification sends the business for review: in the request that completes it, as soon as the last owner's documents finish sending in the background, or when called again after Update Verification. Owners can still be added, changed, or removed while the review waits on them.
    public let owners: [UpdateVerificationsRequestBodyBusinessAddressOwnersItem]?
    /// State or region where the business is incorporated. Sent to the verification provider and returned in the response; `requested_information` asks for it while it is still missing.
    public let placeOfIncorporation: String?
    /// Number the business was registered under in its place of incorporation, such as a state file number in the US or a Company Number in the UK. Sent to the verification provider and returned in the response; `requested_information` asks for it while it is still missing.
    public let registrationNumber: String?
    /// Answers to items in `requested_information`. Each entry pairs the item `id` with one answer payload matching its `type`.
    public let requestedInformation: [UpdateVerificationsRequestBodyBusinessAddressRequestedInformationItem]?
    /// The government-issued ID number of the person being verified — the individual for a KYC verification, or the business representative for a KYB verification — as appropriate for their country. Examples are a Social Security Number (SSN) in the US, or a Social Insurance Number in Canada.
    public let taxIdentificationNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businessAddress: UpdateVerificationsRequestBodyBusinessAddressBusinessAddress? = nil,
        businessName: String? = nil,
        businessStructure: String? = nil,
        businessTaxIdentificationNumber: String? = nil,
        country: String? = nil,
        dateOfBirth: String? = nil,
        documents: UpdateVerificationsRequestBodyBusinessAddressDocuments? = nil,
        firstName: String? = nil,
        incorporationDate: CalendarDate? = nil,
        lastName: String? = nil,
        owners: [UpdateVerificationsRequestBodyBusinessAddressOwnersItem]? = nil,
        placeOfIncorporation: String? = nil,
        registrationNumber: String? = nil,
        requestedInformation: [UpdateVerificationsRequestBodyBusinessAddressRequestedInformationItem]? = nil,
        taxIdentificationNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businessAddress = businessAddress
        self.businessName = businessName
        self.businessStructure = businessStructure
        self.businessTaxIdentificationNumber = businessTaxIdentificationNumber
        self.country = country
        self.dateOfBirth = dateOfBirth
        self.documents = documents
        self.firstName = firstName
        self.incorporationDate = incorporationDate
        self.lastName = lastName
        self.owners = owners
        self.placeOfIncorporation = placeOfIncorporation
        self.registrationNumber = registrationNumber
        self.requestedInformation = requestedInformation
        self.taxIdentificationNumber = taxIdentificationNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businessAddress = try container.decodeIfPresent(UpdateVerificationsRequestBodyBusinessAddressBusinessAddress.self, forKey: .businessAddress)
        self.businessName = try container.decodeIfPresent(String.self, forKey: .businessName)
        self.businessStructure = try container.decodeIfPresent(String.self, forKey: .businessStructure)
        self.businessTaxIdentificationNumber = try container.decodeIfPresent(String.self, forKey: .businessTaxIdentificationNumber)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth)
        self.documents = try container.decodeIfPresent(UpdateVerificationsRequestBodyBusinessAddressDocuments.self, forKey: .documents)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.incorporationDate = try container.decodeIfPresent(CalendarDate.self, forKey: .incorporationDate)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.owners = try container.decodeIfPresent([UpdateVerificationsRequestBodyBusinessAddressOwnersItem].self, forKey: .owners)
        self.placeOfIncorporation = try container.decodeIfPresent(String.self, forKey: .placeOfIncorporation)
        self.registrationNumber = try container.decodeIfPresent(String.self, forKey: .registrationNumber)
        self.requestedInformation = try container.decodeIfPresent([UpdateVerificationsRequestBodyBusinessAddressRequestedInformationItem].self, forKey: .requestedInformation)
        self.taxIdentificationNumber = try container.decodeIfPresent(String.self, forKey: .taxIdentificationNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.businessAddress, forKey: .businessAddress)
        try container.encodeIfPresent(self.businessName, forKey: .businessName)
        try container.encodeIfPresent(self.businessStructure, forKey: .businessStructure)
        try container.encodeIfPresent(self.businessTaxIdentificationNumber, forKey: .businessTaxIdentificationNumber)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.incorporationDate, forKey: .incorporationDate)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.owners, forKey: .owners)
        try container.encodeIfPresent(self.placeOfIncorporation, forKey: .placeOfIncorporation)
        try container.encodeIfPresent(self.registrationNumber, forKey: .registrationNumber)
        try container.encodeIfPresent(self.requestedInformation, forKey: .requestedInformation)
        try container.encodeIfPresent(self.taxIdentificationNumber, forKey: .taxIdentificationNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businessAddress = "business_address"
        case businessName = "business_name"
        case businessStructure = "business_structure"
        case businessTaxIdentificationNumber = "business_tax_identification_number"
        case country
        case dateOfBirth = "date_of_birth"
        case documents
        case firstName = "first_name"
        case incorporationDate = "incorporation_date"
        case lastName = "last_name"
        case owners
        case placeOfIncorporation = "place_of_incorporation"
        case registrationNumber = "registration_number"
        case requestedInformation = "requested_information"
        case taxIdentificationNumber = "tax_identification_number"
    }
}