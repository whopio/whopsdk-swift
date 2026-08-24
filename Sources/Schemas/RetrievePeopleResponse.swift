import Foundation

/// The full profile a retrieve returns: the summary plus every linked identity, purchase rows, all acquisition sources, and exact usage breakdowns.
public struct RetrievePeopleResponse: Codable, Hashable, Sendable {
    public let accountId: String
    public let aov: Double?
    public let audienceIds: [String]?
    public let customEventNames: [String]?
    public let device: RetrievePeopleResponseDevice?
    /// The email from the person's most recent event that carried one.
    public let email: Nullable<String>?
    /// Every linked email, primary first.
    public let emails: [String]?
    public let eventCount: Int
    public let eventNames: [String]?
    public let firstPurchaseAt: Nullable<Date>?
    public let firstSeenAt: Date
    /// Where a visit came from: a whop ad click, a lead form, an external ad, or a referring site.
    public let firstSource: Nullable<RetrievePeopleResponseFirstSource>?
    public let id: String
    public let lastIp: Nullable<String>?
    public let lastPurchaseAt: Nullable<Date>?
    public let lastSeenAt: Date
    /// Where a visit came from: a whop ad click, a lead form, an external ad, or a referring site.
    public let lastSource: Nullable<RetrievePeopleResponseLastSource>?
    public let location: RetrievePeopleResponseLocation?
    public let ltv: Double?
    /// The user's member record at this account, when they are a member of it.
    public let member: Nullable<RetrievePeopleResponseMember>?
    /// The name from the person's most recent event that carried one.
    public let name: Nullable<String>?
    /// Every name the person's linked identities carried, primary first.
    public let names: [String]?
    /// The phone from the person's most recent event that carried one.
    public let phone: Nullable<String>?
    /// Every linked phone, primary first.
    public let phones: [String]?
    public let purchaseCount: Int
    public let purchases: [RetrievePeopleResponsePurchasesItem]?
    public let roles: [String]?
    /// Every distinct acquisition signal the person ever carried, ad entities hydrated.
    public let sources: [RetrievePeopleResponseSourcesItem]?
    public let timezone: Nullable<String>?
    /// Exact usage breakdowns for the person's browser traffic (distinct events per value).
    public let usage: RetrievePeopleResponseUsage?
    /// The person's primary whop user, when one of their identities is a whop account.
    public let user: Nullable<RetrievePeopleResponseUser>?
    /// Every linked whop account, the most used one first.
    public let userIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        aov: Double? = nil,
        audienceIds: [String]? = nil,
        customEventNames: [String]? = nil,
        device: RetrievePeopleResponseDevice? = nil,
        email: Nullable<String>? = nil,
        emails: [String]? = nil,
        eventCount: Int,
        eventNames: [String]? = nil,
        firstPurchaseAt: Nullable<Date>? = nil,
        firstSeenAt: Date,
        firstSource: Nullable<RetrievePeopleResponseFirstSource>? = nil,
        id: String,
        lastIp: Nullable<String>? = nil,
        lastPurchaseAt: Nullable<Date>? = nil,
        lastSeenAt: Date,
        lastSource: Nullable<RetrievePeopleResponseLastSource>? = nil,
        location: RetrievePeopleResponseLocation? = nil,
        ltv: Double? = nil,
        member: Nullable<RetrievePeopleResponseMember>? = nil,
        name: Nullable<String>? = nil,
        names: [String]? = nil,
        phone: Nullable<String>? = nil,
        phones: [String]? = nil,
        purchaseCount: Int,
        purchases: [RetrievePeopleResponsePurchasesItem]? = nil,
        roles: [String]? = nil,
        sources: [RetrievePeopleResponseSourcesItem]? = nil,
        timezone: Nullable<String>? = nil,
        usage: RetrievePeopleResponseUsage? = nil,
        user: Nullable<RetrievePeopleResponseUser>? = nil,
        userIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.aov = aov
        self.audienceIds = audienceIds
        self.customEventNames = customEventNames
        self.device = device
        self.email = email
        self.emails = emails
        self.eventCount = eventCount
        self.eventNames = eventNames
        self.firstPurchaseAt = firstPurchaseAt
        self.firstSeenAt = firstSeenAt
        self.firstSource = firstSource
        self.id = id
        self.lastIp = lastIp
        self.lastPurchaseAt = lastPurchaseAt
        self.lastSeenAt = lastSeenAt
        self.lastSource = lastSource
        self.location = location
        self.ltv = ltv
        self.member = member
        self.name = name
        self.names = names
        self.phone = phone
        self.phones = phones
        self.purchaseCount = purchaseCount
        self.purchases = purchases
        self.roles = roles
        self.sources = sources
        self.timezone = timezone
        self.usage = usage
        self.user = user
        self.userIds = userIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.aov = try container.decodeIfPresent(Double.self, forKey: .aov)
        self.audienceIds = try container.decodeIfPresent([String].self, forKey: .audienceIds)
        self.customEventNames = try container.decodeIfPresent([String].self, forKey: .customEventNames)
        self.device = try container.decodeIfPresent(RetrievePeopleResponseDevice.self, forKey: .device)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.emails = try container.decodeIfPresent([String].self, forKey: .emails)
        self.eventCount = try container.decode(Int.self, forKey: .eventCount)
        self.eventNames = try container.decodeIfPresent([String].self, forKey: .eventNames)
        self.firstPurchaseAt = try container.decodeNullableIfPresent(Date.self, forKey: .firstPurchaseAt)
        self.firstSeenAt = try container.decode(Date.self, forKey: .firstSeenAt)
        self.firstSource = try container.decodeNullableIfPresent(RetrievePeopleResponseFirstSource.self, forKey: .firstSource)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastIp = try container.decodeNullableIfPresent(String.self, forKey: .lastIp)
        self.lastPurchaseAt = try container.decodeNullableIfPresent(Date.self, forKey: .lastPurchaseAt)
        self.lastSeenAt = try container.decode(Date.self, forKey: .lastSeenAt)
        self.lastSource = try container.decodeNullableIfPresent(RetrievePeopleResponseLastSource.self, forKey: .lastSource)
        self.location = try container.decodeIfPresent(RetrievePeopleResponseLocation.self, forKey: .location)
        self.ltv = try container.decodeIfPresent(Double.self, forKey: .ltv)
        self.member = try container.decodeNullableIfPresent(RetrievePeopleResponseMember.self, forKey: .member)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.names = try container.decodeIfPresent([String].self, forKey: .names)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.phones = try container.decodeIfPresent([String].self, forKey: .phones)
        self.purchaseCount = try container.decode(Int.self, forKey: .purchaseCount)
        self.purchases = try container.decodeIfPresent([RetrievePeopleResponsePurchasesItem].self, forKey: .purchases)
        self.roles = try container.decodeIfPresent([String].self, forKey: .roles)
        self.sources = try container.decodeIfPresent([RetrievePeopleResponseSourcesItem].self, forKey: .sources)
        self.timezone = try container.decodeNullableIfPresent(String.self, forKey: .timezone)
        self.usage = try container.decodeIfPresent(RetrievePeopleResponseUsage.self, forKey: .usage)
        self.user = try container.decodeNullableIfPresent(RetrievePeopleResponseUser.self, forKey: .user)
        self.userIds = try container.decodeIfPresent([String].self, forKey: .userIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.aov, forKey: .aov)
        try container.encodeIfPresent(self.audienceIds, forKey: .audienceIds)
        try container.encodeIfPresent(self.customEventNames, forKey: .customEventNames)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.emails, forKey: .emails)
        try container.encode(self.eventCount, forKey: .eventCount)
        try container.encodeIfPresent(self.eventNames, forKey: .eventNames)
        try container.encodeNullableIfPresent(self.firstPurchaseAt, forKey: .firstPurchaseAt)
        try container.encode(self.firstSeenAt, forKey: .firstSeenAt)
        try container.encodeNullableIfPresent(self.firstSource, forKey: .firstSource)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.lastIp, forKey: .lastIp)
        try container.encodeNullableIfPresent(self.lastPurchaseAt, forKey: .lastPurchaseAt)
        try container.encode(self.lastSeenAt, forKey: .lastSeenAt)
        try container.encodeNullableIfPresent(self.lastSource, forKey: .lastSource)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.ltv, forKey: .ltv)
        try container.encodeNullableIfPresent(self.member, forKey: .member)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.names, forKey: .names)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.phones, forKey: .phones)
        try container.encode(self.purchaseCount, forKey: .purchaseCount)
        try container.encodeIfPresent(self.purchases, forKey: .purchases)
        try container.encodeIfPresent(self.roles, forKey: .roles)
        try container.encodeIfPresent(self.sources, forKey: .sources)
        try container.encodeNullableIfPresent(self.timezone, forKey: .timezone)
        try container.encodeIfPresent(self.usage, forKey: .usage)
        try container.encodeNullableIfPresent(self.user, forKey: .user)
        try container.encodeIfPresent(self.userIds, forKey: .userIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case aov
        case audienceIds = "audience_ids"
        case customEventNames = "custom_event_names"
        case device
        case email
        case emails
        case eventCount = "event_count"
        case eventNames = "event_names"
        case firstPurchaseAt = "first_purchase_at"
        case firstSeenAt = "first_seen_at"
        case firstSource = "first_source"
        case id
        case lastIp = "last_ip"
        case lastPurchaseAt = "last_purchase_at"
        case lastSeenAt = "last_seen_at"
        case lastSource = "last_source"
        case location
        case ltv
        case member
        case name
        case names
        case phone
        case phones
        case purchaseCount = "purchase_count"
        case purchases
        case roles
        case sources
        case timezone
        case usage
        case user
        case userIds = "user_ids"
    }
}