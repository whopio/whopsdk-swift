import Foundation

public struct RetrieveVerificationsResponse: Codable, Hashable, Sendable {
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
    public let kind: RetrieveVerificationsResponseKind?
    public let lastName: Nullable<String>?
    /// Phone number on the verification profile.
    public let phone: Nullable<String>?
    /// What Whop still needs before review can continue — one requirement per entry. Answer with Update Verification; nothing from the response is echoed back. Keys that don't apply are omitted.
    public let requestedInformation: [RetrieveVerificationsResponseRequestedInformationItem]?
    /// Documents for a document-upload verification and their progress. Present only on verifications created by sending `documents`. `pending_upload` documents were not accepted yet — send the full set again with another Create Verification call.
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
        address: Nullable<RetrieveVerificationsResponseAddress>? = nil,
        businessName: Nullable<String>? = nil,
        businessStructure: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        createdAt: String? = nil,
        dateOfBirth: Nullable<String>? = nil,
        email: Nullable<String>? = nil,
        firstName: Nullable<String>? = nil,
        id: String? = nil,
        kind: RetrieveVerificationsResponseKind? = nil,
        lastName: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        requestedInformation: [RetrieveVerificationsResponseRequestedInformationItem]? = nil,
        requiredDocuments: [RetrieveVerificationsResponseRequiredDocumentsItem]? = nil,
        sessionUrl: Nullable<String>? = nil,
        status: RetrieveVerificationsResponseStatus? = nil,
        updatedAt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.businessName = businessName
        self.businessStructure = businessStructure
        self.country = country
        self.createdAt = createdAt
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.firstName = firstName
        self.id = id
        self.kind = kind
        self.lastName = lastName
        self.phone = phone
        self.requestedInformation = requestedInformation
        self.requiredDocuments = requiredDocuments
        self.sessionUrl = sessionUrl
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeNullableIfPresent(RetrieveVerificationsResponseAddress.self, forKey: .address)
        self.businessName = try container.decodeNullableIfPresent(String.self, forKey: .businessName)
        self.businessStructure = try container.decodeNullableIfPresent(String.self, forKey: .businessStructure)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.dateOfBirth = try container.decodeNullableIfPresent(String.self, forKey: .dateOfBirth)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeNullableIfPresent(String.self, forKey: .firstName)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.kind = try container.decodeIfPresent(RetrieveVerificationsResponseKind.self, forKey: .kind)
        self.lastName = try container.decodeNullableIfPresent(String.self, forKey: .lastName)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
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
        try container.encodeNullableIfPresent(self.address, forKey: .address)
        try container.encodeNullableIfPresent(self.businessName, forKey: .businessName)
        try container.encodeNullableIfPresent(self.businessStructure, forKey: .businessStructure)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeNullableIfPresent(self.lastName, forKey: .lastName)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.requestedInformation, forKey: .requestedInformation)
        try container.encodeIfPresent(self.requiredDocuments, forKey: .requiredDocuments)
        try container.encodeNullableIfPresent(self.sessionUrl, forKey: .sessionUrl)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case businessName = "business_name"
        case businessStructure = "business_structure"
        case country
        case createdAt = "created_at"
        case dateOfBirth = "date_of_birth"
        case email
        case firstName = "first_name"
        case id
        case kind
        case lastName = "last_name"
        case phone
        case requestedInformation = "requested_information"
        case requiredDocuments = "required_documents"
        case sessionUrl = "session_url"
        case status
        case updatedAt = "updated_at"
    }
}