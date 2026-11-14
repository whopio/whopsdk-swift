import Foundation

public struct RetrieveVerificationsResponse: Codable, Hashable, Sendable {
    /// Accounts this verification was read for, each prefixed `biz_`: the account you listed by, the account or subaccount it belongs to with `include_subaccounts`, or every account you can read that it belongs to when retrieved by ID. Usually one. Empty for a personal verification.
    public let accountIds: [String]
    /// Address on the verification profile. `null` when no address is set.
    public let address: Nullable<RetrieveVerificationsResponseAddress>?
    /// Legal business name.
    public let businessName: Nullable<String>?
    /// Legal entity structure of the business, such as `private_corporation` or `sole_proprietorship`. Supported values vary by country of incorporation — see [Business structures](/developer/verification/business-structures).
    public let businessStructure: Nullable<String>?
    /// Two-letter ISO 3166-1 country code, for example `US`, `DE`, or `GB`.
    public let country: Nullable<String>?
    /// When the verification profile was created, as an ISO 8601 timestamp.
    public let createdAt: String?
    /// Formatted as `YYYY-MM-DD`.
    public let dateOfBirth: Nullable<String>?
    /// Email address on the verification profile.
    public let email: Nullable<String>?
    public let firstName: Nullable<String>?
    /// Verification profile ID, prefixed `idpf_`.
    public let id: String?
    /// Date the business was incorporated, formatted as `YYYY-MM-DD`, as on file for the business verification. Business verifications only; `null` until it is sent.
    public let incorporationDate: Nullable<String>?
    public let kind: RetrieveVerificationsResponseKind?
    public let lastName: Nullable<String>?
    /// Owners of the business and the progress of each one's own verification. Empty for individual verifications.
    public let owners: [RetrieveVerificationsResponseOwnersItem]
    /// Phone number on the verification profile.
    public let phone: Nullable<String>?
    /// State or region where the business is incorporated, as on file for the business verification. Business verifications only; `null` until it is sent.
    public let placeOfIncorporation: Nullable<String>?
    /// Number the business was registered under in its place of incorporation, such as a state file number in the US or a Company Number in the UK. Business verifications only; as on file for the business verification, or `null` until it is sent.
    public let registrationNumber: Nullable<String>?
    /// What Whop still needs before review can continue — one requirement per entry. Answer with Update Verification; nothing from the response is echoed back. Keys that don't apply are omitted. For a business verification created with `documents` or `owners`, this includes the company details and documents still missing before it can be sent for review; each owner's documents are listed under that owner.
    public let requestedInformation: [RetrieveVerificationsResponseRequestedInformationItem]?
    /// Documents for a document-upload verification and their progress. Present only on individual verifications created by sending `documents`. `pending_upload` documents were not accepted yet — send the full set again with another Create Verification call.
    public let requiredDocuments: [RetrieveVerificationsResponseRequiredDocumentsItem]?
    /// Hosted verification session URL for the user to complete identity checks. Expires 7 days after creation.
    public let sessionUrl: Nullable<String>?
    /// Current verification state. `not_started` before any session exists; `pending` while a session needs the user's input; `processing` while the provider's automated checks run on a fresh submission; `action_required` when `requested_information` needs answers; `manual_review` while information already sent is under review — an audit answer, or a document the payout provider holds — nothing to submit, usually done within 3 business days; `approved` on success; `rejected` on failure. Call Create Verification again to start a new session.
    public let status: RetrieveVerificationsResponseStatus?
    /// When the verification profile was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountIds: [String],
        address: Nullable<RetrieveVerificationsResponseAddress>? = nil,
        businessName: Nullable<String>? = nil,
        businessStructure: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        createdAt: String? = nil,
        dateOfBirth: Nullable<String>? = nil,
        email: Nullable<String>? = nil,
        firstName: Nullable<String>? = nil,
        id: String? = nil,
        incorporationDate: Nullable<String>? = nil,
        kind: RetrieveVerificationsResponseKind? = nil,
        lastName: Nullable<String>? = nil,
        owners: [RetrieveVerificationsResponseOwnersItem],
        phone: Nullable<String>? = nil,
        placeOfIncorporation: Nullable<String>? = nil,
        registrationNumber: Nullable<String>? = nil,
        requestedInformation: [RetrieveVerificationsResponseRequestedInformationItem]? = nil,
        requiredDocuments: [RetrieveVerificationsResponseRequiredDocumentsItem]? = nil,
        sessionUrl: Nullable<String>? = nil,
        status: RetrieveVerificationsResponseStatus? = nil,
        updatedAt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountIds = accountIds
        self.address = address
        self.businessName = businessName
        self.businessStructure = businessStructure
        self.country = country
        self.createdAt = createdAt
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.firstName = firstName
        self.id = id
        self.incorporationDate = incorporationDate
        self.kind = kind
        self.lastName = lastName
        self.owners = owners
        self.phone = phone
        self.placeOfIncorporation = placeOfIncorporation
        self.registrationNumber = registrationNumber
        self.requestedInformation = requestedInformation
        self.requiredDocuments = requiredDocuments
        self.sessionUrl = sessionUrl
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountIds = try container.decode([String].self, forKey: .accountIds)
        self.address = try container.decodeNullableIfPresent(RetrieveVerificationsResponseAddress.self, forKey: .address)
        self.businessName = try container.decodeNullableIfPresent(String.self, forKey: .businessName)
        self.businessStructure = try container.decodeNullableIfPresent(String.self, forKey: .businessStructure)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.dateOfBirth = try container.decodeNullableIfPresent(String.self, forKey: .dateOfBirth)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeNullableIfPresent(String.self, forKey: .firstName)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.incorporationDate = try container.decodeNullableIfPresent(String.self, forKey: .incorporationDate)
        self.kind = try container.decodeIfPresent(RetrieveVerificationsResponseKind.self, forKey: .kind)
        self.lastName = try container.decodeNullableIfPresent(String.self, forKey: .lastName)
        self.owners = try container.decode([RetrieveVerificationsResponseOwnersItem].self, forKey: .owners)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.placeOfIncorporation = try container.decodeNullableIfPresent(String.self, forKey: .placeOfIncorporation)
        self.registrationNumber = try container.decodeNullableIfPresent(String.self, forKey: .registrationNumber)
        self.requestedInformation = try container.decodeIfPresent([RetrieveVerificationsResponseRequestedInformationItem].self, forKey: .requestedInformation)
        self.requiredDocuments = try container.decodeIfPresent([RetrieveVerificationsResponseRequiredDocumentsItem].self, forKey: .requiredDocuments)
        self.sessionUrl = try container.decodeNullableIfPresent(String.self, forKey: .sessionUrl)
        self.status = try container.decodeIfPresent(RetrieveVerificationsResponseStatus.self, forKey: .status)
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountIds, forKey: .accountIds)
        try container.encodeNullableIfPresent(self.address, forKey: .address)
        try container.encodeNullableIfPresent(self.businessName, forKey: .businessName)
        try container.encodeNullableIfPresent(self.businessStructure, forKey: .businessStructure)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.incorporationDate, forKey: .incorporationDate)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeNullableIfPresent(self.lastName, forKey: .lastName)
        try container.encode(self.owners, forKey: .owners)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.placeOfIncorporation, forKey: .placeOfIncorporation)
        try container.encodeNullableIfPresent(self.registrationNumber, forKey: .registrationNumber)
        try container.encodeIfPresent(self.requestedInformation, forKey: .requestedInformation)
        try container.encodeIfPresent(self.requiredDocuments, forKey: .requiredDocuments)
        try container.encodeNullableIfPresent(self.sessionUrl, forKey: .sessionUrl)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountIds = "account_ids"
        case address
        case businessName = "business_name"
        case businessStructure = "business_structure"
        case country
        case createdAt = "created_at"
        case dateOfBirth = "date_of_birth"
        case email
        case firstName = "first_name"
        case id
        case incorporationDate = "incorporation_date"
        case kind
        case lastName = "last_name"
        case owners
        case phone
        case placeOfIncorporation = "place_of_incorporation"
        case registrationNumber = "registration_number"
        case requestedInformation = "requested_information"
        case requiredDocuments = "required_documents"
        case sessionUrl = "session_url"
        case status
        case updatedAt = "updated_at"
    }
}