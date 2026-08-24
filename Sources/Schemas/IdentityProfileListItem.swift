import Foundation

/// A consolidated identity or business profile synced from verification provider data.
public struct IdentityProfileListItem: Codable, Hashable, Sendable {
    /// Registered business address reported by the identity provider. Present on `business` profiles.
    public let businessAddress: Nullable<IdentityProfileListItemBusinessAddress>
    /// Business entity name. Present on `business` profiles.
    public let businessName: Nullable<String>
    /// Reported legal structure of a business profile (e.g. `corp`, `llc`). Provider-specific values; present on `business` profiles.
    public let businessStructure: Nullable<String>
    /// ISO 3166-1 alpha-2 country code reported by the identity provider, such as `US` or `GB`. For individuals this is the country of citizenship or residence; for businesses, the country of incorporation.
    public let country: Nullable<String>
    /// When the identity profile was first created.
    public let createdAt: Date
    /// ISO date (`YYYY-MM-DD`) reported by the identity provider. Present on `individual` profiles.
    public let dateOfBirth: Nullable<String>
    /// Email address reported by the identity provider. Typically present on `individual` profiles.
    public let email: Nullable<String>
    /// Individual's first name.
    public let firstName: Nullable<String>
    /// The tag of the identity profile (idpf_xxx).
    public let id: String
    /// Individual's last name.
    public let lastName: Nullable<String>
    /// The companies this identity profile is currently linked to. Only populated for direct Whop user sessions; always empty when authenticated via API key, app, or OAuth scope (a single identity can be linked to companies the calling platform is not entitled to see).
    public let linkedCompanies: [IdentityProfileListItemLinkedCompaniesItem]
    /// Progress of payout-account setup for this profile, independent of holds. `connected` means onboarding is complete; a `connected` status paired with `payouts_enabled: false` indicates an active account restriction rather than incomplete setup.
    public let payoutStatus: PayoutAccountCalculatedStatuses
    /// Whether this profile can receive payouts right now. True only when payout onboarding is complete and no payout holds are active on the linked account. Treat this as the single source of truth for payout readiness.
    public let payoutsEnabled: Bool
    /// Residential address reported by the identity provider. Present on `individual` profiles.
    public let personalAddress: Nullable<IdentityProfileListItemPersonalAddress>
    /// Phone number reported by the identity provider. Typically present on `individual` profiles.
    public let phone: Nullable<String>
    /// Whether this is an 'individual' or 'business' profile.
    public let profileType: String
    /// Derived verification status across all linked verifications. Returns `action_required` whenever the profile has an open request for information (whether a verification, payout, or audit RFI) — i.e. the merchant must submit something before it is in good standing.
    public let status: IdentityProfileStatuses
    /// When the identity profile was last synced from a verification.
    public let updatedAt: Date
    /// All verification attempts attached to this identity profile, ordered most-recent first.
    public let verifications: [IdentityProfileListItemVerificationsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businessAddress: Nullable<IdentityProfileListItemBusinessAddress>,
        businessName: Nullable<String>,
        businessStructure: Nullable<String>,
        country: Nullable<String>,
        createdAt: Date,
        dateOfBirth: Nullable<String>,
        email: Nullable<String>,
        firstName: Nullable<String>,
        id: String,
        lastName: Nullable<String>,
        linkedCompanies: [IdentityProfileListItemLinkedCompaniesItem],
        payoutStatus: PayoutAccountCalculatedStatuses,
        payoutsEnabled: Bool,
        personalAddress: Nullable<IdentityProfileListItemPersonalAddress>,
        phone: Nullable<String>,
        profileType: String,
        status: IdentityProfileStatuses,
        updatedAt: Date,
        verifications: [IdentityProfileListItemVerificationsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businessAddress = businessAddress
        self.businessName = businessName
        self.businessStructure = businessStructure
        self.country = country
        self.createdAt = createdAt
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.linkedCompanies = linkedCompanies
        self.payoutStatus = payoutStatus
        self.payoutsEnabled = payoutsEnabled
        self.personalAddress = personalAddress
        self.phone = phone
        self.profileType = profileType
        self.status = status
        self.updatedAt = updatedAt
        self.verifications = verifications
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businessAddress = try container.decode(Nullable<IdentityProfileListItemBusinessAddress>.self, forKey: .businessAddress)
        self.businessName = try container.decode(Nullable<String>.self, forKey: .businessName)
        self.businessStructure = try container.decode(Nullable<String>.self, forKey: .businessStructure)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.dateOfBirth = try container.decode(Nullable<String>.self, forKey: .dateOfBirth)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.firstName = try container.decode(Nullable<String>.self, forKey: .firstName)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastName = try container.decode(Nullable<String>.self, forKey: .lastName)
        self.linkedCompanies = try container.decode([IdentityProfileListItemLinkedCompaniesItem].self, forKey: .linkedCompanies)
        self.payoutStatus = try container.decode(PayoutAccountCalculatedStatuses.self, forKey: .payoutStatus)
        self.payoutsEnabled = try container.decode(Bool.self, forKey: .payoutsEnabled)
        self.personalAddress = try container.decode(Nullable<IdentityProfileListItemPersonalAddress>.self, forKey: .personalAddress)
        self.phone = try container.decode(Nullable<String>.self, forKey: .phone)
        self.profileType = try container.decode(String.self, forKey: .profileType)
        self.status = try container.decode(IdentityProfileStatuses.self, forKey: .status)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.verifications = try container.decode([IdentityProfileListItemVerificationsItem].self, forKey: .verifications)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.businessAddress, forKey: .businessAddress)
        try container.encode(self.businessName, forKey: .businessName)
        try container.encode(self.businessStructure, forKey: .businessStructure)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.linkedCompanies, forKey: .linkedCompanies)
        try container.encode(self.payoutStatus, forKey: .payoutStatus)
        try container.encode(self.payoutsEnabled, forKey: .payoutsEnabled)
        try container.encode(self.personalAddress, forKey: .personalAddress)
        try container.encode(self.phone, forKey: .phone)
        try container.encode(self.profileType, forKey: .profileType)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.verifications, forKey: .verifications)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businessAddress = "business_address"
        case businessName = "business_name"
        case businessStructure = "business_structure"
        case country
        case createdAt = "created_at"
        case dateOfBirth = "date_of_birth"
        case email
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case linkedCompanies = "linked_companies"
        case payoutStatus = "payout_status"
        case payoutsEnabled = "payouts_enabled"
        case personalAddress = "personal_address"
        case phone
        case profileType = "profile_type"
        case status
        case updatedAt = "updated_at"
        case verifications
    }
}