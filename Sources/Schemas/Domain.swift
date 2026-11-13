import Foundation

public struct Domain: Codable, Hashable, Sendable {
    /// ID of the account the domain belongs to, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// Offering Apple Pay at checkouts served from the domain. `null` when not enrolled or not visible to you.
    public let applePay: Nullable<DomainApplePay>
    /// Whether you can register the hostname and what it costs. Set only when no domain on Whop has it.
    public let availability: Nullable<DomainAvailability>
    /// When the domain was created, as an ISO 8601 timestamp.
    public let createdAt: Nullable<String>
    /// Normalized hostname, such as checkout.example.com.
    public let domain: String
    /// Sending and receiving email on the domain through Whop. `null` when not wanted, or when the domain belongs to an account you can't read.
    public let email: Nullable<DomainEmail>
    /// Domain ID, prefixed `dom_`. `null` when no domain on Whop has this hostname.
    public let id: Nullable<String>
    public let issues: [DomainIssue]
    /// Custom string keys and values attached to this domain. Empty when the domain isn't yours.
    public let metadata: [String: String]
    /// The account that has proven it owns this hostname on Whop, which can be your own. `null` when no account has.
    public let ownedBy: Nullable<DomainOwner>
    /// Tracking page views on the domain with the Whop pixel. `null` when not tracked or not visible to you.
    public let pixel: Nullable<DomainPixel>
    /// An address on a zone Whop runs, such as example.whop.site, that follows its app's route. `null` for other domains or when not visible to you.
    public let platform: Nullable<DomainPlatform>
    /// The domain's public registration record (RDAP), read when you retrieve it by hostname. `null` for domains on Whop, available domains, or a record that couldn't be read.
    public let publicRecord: Nullable<DomainPublicRecord>
    /// Buying the domain through Whop, renewing it, and running its DNS. `null` when not wanted or not visible to you.
    public let registration: Nullable<DomainRegistration>
    /// Traffic on the domain. `null` when the domain isn't on Whop or isn't visible to you.
    public let stats: Nullable<DomainStats>
    /// The most pressing state of the domain's capabilities: `releasing`, then `action_required`, then `pending`, then `ready`. `idle` when it wants nothing.
    public let status: Nullable<DomainStatus>
    /// A subdomain of a domain this account bought through Whop, whose DNS Whop runs. Whop removes it when the account no longer holds the root domain. `null` for other domains or when not visible to you.
    public let subdomain: Nullable<DomainSubdomain>
    /// Moving the domain to another Whop account. `null` when not turned on or not visible to you.
    public let transfer: Nullable<DomainTransfer>
    /// When the domain was last updated, as an ISO 8601 timestamp.
    public let updatedAt: Nullable<String>
    /// Proving you control the domain's DNS with a TXT record. `null` when not wanted or not visible to you.
    public let verification: Nullable<DomainVerification>
    /// Serving a Whop website on the domain. `null` when not wanted.
    public let website: Nullable<DomainWebsite>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        applePay: Nullable<DomainApplePay>,
        availability: Nullable<DomainAvailability>,
        createdAt: Nullable<String>,
        domain: String,
        email: Nullable<DomainEmail>,
        id: Nullable<String>,
        issues: [DomainIssue],
        metadata: [String: String],
        ownedBy: Nullable<DomainOwner>,
        pixel: Nullable<DomainPixel>,
        platform: Nullable<DomainPlatform>,
        publicRecord: Nullable<DomainPublicRecord>,
        registration: Nullable<DomainRegistration>,
        stats: Nullable<DomainStats>,
        status: Nullable<DomainStatus>,
        subdomain: Nullable<DomainSubdomain>,
        transfer: Nullable<DomainTransfer>,
        updatedAt: Nullable<String>,
        verification: Nullable<DomainVerification>,
        website: Nullable<DomainWebsite>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.applePay = applePay
        self.availability = availability
        self.createdAt = createdAt
        self.domain = domain
        self.email = email
        self.id = id
        self.issues = issues
        self.metadata = metadata
        self.ownedBy = ownedBy
        self.pixel = pixel
        self.platform = platform
        self.publicRecord = publicRecord
        self.registration = registration
        self.stats = stats
        self.status = status
        self.subdomain = subdomain
        self.transfer = transfer
        self.updatedAt = updatedAt
        self.verification = verification
        self.website = website
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.applePay = try container.decode(Nullable<DomainApplePay>.self, forKey: .applePay)
        self.availability = try container.decode(Nullable<DomainAvailability>.self, forKey: .availability)
        self.createdAt = try container.decode(Nullable<String>.self, forKey: .createdAt)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.email = try container.decode(Nullable<DomainEmail>.self, forKey: .email)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.issues = try container.decode([DomainIssue].self, forKey: .issues)
        self.metadata = try container.decode([String: String].self, forKey: .metadata)
        self.ownedBy = try container.decode(Nullable<DomainOwner>.self, forKey: .ownedBy)
        self.pixel = try container.decode(Nullable<DomainPixel>.self, forKey: .pixel)
        self.platform = try container.decode(Nullable<DomainPlatform>.self, forKey: .platform)
        self.publicRecord = try container.decode(Nullable<DomainPublicRecord>.self, forKey: .publicRecord)
        self.registration = try container.decode(Nullable<DomainRegistration>.self, forKey: .registration)
        self.stats = try container.decode(Nullable<DomainStats>.self, forKey: .stats)
        self.status = try container.decode(Nullable<DomainStatus>.self, forKey: .status)
        self.subdomain = try container.decode(Nullable<DomainSubdomain>.self, forKey: .subdomain)
        self.transfer = try container.decode(Nullable<DomainTransfer>.self, forKey: .transfer)
        self.updatedAt = try container.decode(Nullable<String>.self, forKey: .updatedAt)
        self.verification = try container.decode(Nullable<DomainVerification>.self, forKey: .verification)
        self.website = try container.decode(Nullable<DomainWebsite>.self, forKey: .website)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.applePay, forKey: .applePay)
        try container.encode(self.availability, forKey: .availability)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issues, forKey: .issues)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.ownedBy, forKey: .ownedBy)
        try container.encode(self.pixel, forKey: .pixel)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.publicRecord, forKey: .publicRecord)
        try container.encode(self.registration, forKey: .registration)
        try container.encode(self.stats, forKey: .stats)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.subdomain, forKey: .subdomain)
        try container.encode(self.transfer, forKey: .transfer)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.verification, forKey: .verification)
        try container.encode(self.website, forKey: .website)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case applePay = "apple_pay"
        case availability
        case createdAt = "created_at"
        case domain
        case email
        case id
        case issues
        case metadata
        case ownedBy = "owned_by"
        case pixel
        case platform
        case publicRecord = "public_record"
        case registration
        case stats
        case status
        case subdomain
        case transfer
        case updatedAt = "updated_at"
        case verification
        case website
    }
}