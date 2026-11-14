import Foundation

/// An owner of the business. Send `verification_id` to add someone with an approved verification on this account or on a member of its team, or a new owner's details and documents to verify them from this request. An owner already on the verification is not added twice, so a retried request is safe.
public struct CreateVerificationsRequestBodyBusinessOwnersItem: Codable, Hashable, Sendable {
    /// The new owner's home address, with `line1`, `city`, `state`, and `postal_code`.
    public let address: CreateVerificationsRequestBodyBusinessOwnersItemAddress?
    /// The new owner's country, as a two-letter ISO 3166-1 code.
    public let country: String?
    /// The new owner's date of birth, formatted as `YYYY-MM-DD`.
    public let dateOfBirth: CalendarDate?
    /// Identity document in `documents`. Decides which slots to send: `id_card` → `id_card_front` + `id_card_back`; `drivers` → `drivers_front` + `drivers_back`; `residence_permit` → `residence_permit_front` + `residence_permit_back`; `passport` → `passport_front`. Every type also takes `selfie`.
    public let documentType: CreateVerificationsRequestBodyBusinessOwnersItemDocumentType?
    /// The owner's identity document and selfie, each the ID of a ready file uploaded with Create File and not yet attached to anything else, prefixed `file_`. Send every slot for `document_type` plus `selfie`. Document files can be a PDF, JPEG, or PNG and the selfie a JPEG or PNG, each up to 10MB. They're sent to the verification provider in the background: the owner reads `processing` until then, and `action_required`, with a `rejection_reason` on each document, if a file couldn't be used.
    public let documents: CreateVerificationsRequestBodyBusinessOwnersItemDocuments?
    /// The new owner's email address.
    public let email: String?
    /// The new owner's first name.
    public let firstName: String?
    /// The new owner's last name.
    public let lastName: String?
    /// Share of the business the person owns, from 0 to 100. Across every owner it can't add up to more than 100.
    public let ownershipPercentage: Double?
    /// The new owner's phone number, with country code.
    public let phone: String?
    /// What the person is to the business: `ubo` for an ultimate beneficial owner, `director`, `representative` for someone who acts for the business, or `shareholder`. Required for a new owner.
    public let roles: [CreateVerificationsRequestBodyBusinessOwnersItemRolesItem]?
    /// The new owner's government-issued ID number, such as a Social Security Number in the US.
    public let taxIdentificationNumber: String?
    /// ID of an `approved` individual verification to add as this owner, prefixed `idpf_`. It must be the account's own verification or a team member's. Takes only `roles` and `ownership_percentage` alongside it.
    public let verificationId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: CreateVerificationsRequestBodyBusinessOwnersItemAddress? = nil,
        country: String? = nil,
        dateOfBirth: CalendarDate? = nil,
        documentType: CreateVerificationsRequestBodyBusinessOwnersItemDocumentType? = nil,
        documents: CreateVerificationsRequestBodyBusinessOwnersItemDocuments? = nil,
        email: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        ownershipPercentage: Double? = nil,
        phone: String? = nil,
        roles: [CreateVerificationsRequestBodyBusinessOwnersItemRolesItem]? = nil,
        taxIdentificationNumber: String? = nil,
        verificationId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.country = country
        self.dateOfBirth = dateOfBirth
        self.documentType = documentType
        self.documents = documents
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.ownershipPercentage = ownershipPercentage
        self.phone = phone
        self.roles = roles
        self.taxIdentificationNumber = taxIdentificationNumber
        self.verificationId = verificationId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(CreateVerificationsRequestBodyBusinessOwnersItemAddress.self, forKey: .address)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.dateOfBirth = try container.decodeIfPresent(CalendarDate.self, forKey: .dateOfBirth)
        self.documentType = try container.decodeIfPresent(CreateVerificationsRequestBodyBusinessOwnersItemDocumentType.self, forKey: .documentType)
        self.documents = try container.decodeIfPresent(CreateVerificationsRequestBodyBusinessOwnersItemDocuments.self, forKey: .documents)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.ownershipPercentage = try container.decodeIfPresent(Double.self, forKey: .ownershipPercentage)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.roles = try container.decodeIfPresent([CreateVerificationsRequestBodyBusinessOwnersItemRolesItem].self, forKey: .roles)
        self.taxIdentificationNumber = try container.decodeIfPresent(String.self, forKey: .taxIdentificationNumber)
        self.verificationId = try container.decodeIfPresent(String.self, forKey: .verificationId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(self.documentType, forKey: .documentType)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.ownershipPercentage, forKey: .ownershipPercentage)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.roles, forKey: .roles)
        try container.encodeIfPresent(self.taxIdentificationNumber, forKey: .taxIdentificationNumber)
        try container.encodeIfPresent(self.verificationId, forKey: .verificationId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case country
        case dateOfBirth = "date_of_birth"
        case documentType = "document_type"
        case documents
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case ownershipPercentage = "ownership_percentage"
        case phone
        case roles
        case taxIdentificationNumber = "tax_identification_number"
        case verificationId = "verification_id"
    }
}