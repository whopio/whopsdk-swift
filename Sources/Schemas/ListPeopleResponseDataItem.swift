import Foundation

public struct ListPeopleResponseDataItem: Codable, Hashable, Sendable {
    public let accountId: String
    public let aov: Double?
    public let device: ListPeopleResponseDataItemDevice?
    /// The email from the person's most recent event that carried one.
    public let email: Nullable<String>?
    public let eventCount: Int
    public let firstPurchaseAt: Nullable<Date>?
    public let firstSeenAt: Date
    /// Where a visit came from: a whop ad click, a lead form, an external ad, or a referring site.
    public let firstSource: Nullable<ListPeopleResponseDataItemFirstSource>?
    public let id: String
    public let lastIp: Nullable<String>?
    public let lastPurchaseAt: Nullable<Date>?
    public let lastSeenAt: Date
    /// Where a visit came from: a whop ad click, a lead form, an external ad, or a referring site.
    public let lastSource: Nullable<ListPeopleResponseDataItemLastSource>?
    public let location: ListPeopleResponseDataItemLocation?
    public let ltv: Double?
    /// The user's member record at this account, when they are a member of it.
    public let member: Nullable<ListPeopleResponseDataItemMember>?
    /// The name from the person's most recent event that carried one.
    public let name: Nullable<String>?
    /// The phone from the person's most recent event that carried one.
    public let phone: Nullable<String>?
    public let purchaseCount: Int
    public let timezone: Nullable<String>?
    /// The person's primary whop user, when one of their identities is a whop account.
    public let user: Nullable<ListPeopleResponseDataItemUser>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        aov: Double? = nil,
        device: ListPeopleResponseDataItemDevice? = nil,
        email: Nullable<String>? = nil,
        eventCount: Int,
        firstPurchaseAt: Nullable<Date>? = nil,
        firstSeenAt: Date,
        firstSource: Nullable<ListPeopleResponseDataItemFirstSource>? = nil,
        id: String,
        lastIp: Nullable<String>? = nil,
        lastPurchaseAt: Nullable<Date>? = nil,
        lastSeenAt: Date,
        lastSource: Nullable<ListPeopleResponseDataItemLastSource>? = nil,
        location: ListPeopleResponseDataItemLocation? = nil,
        ltv: Double? = nil,
        member: Nullable<ListPeopleResponseDataItemMember>? = nil,
        name: Nullable<String>? = nil,
        phone: Nullable<String>? = nil,
        purchaseCount: Int,
        timezone: Nullable<String>? = nil,
        user: Nullable<ListPeopleResponseDataItemUser>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.aov = aov
        self.device = device
        self.email = email
        self.eventCount = eventCount
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
        self.phone = phone
        self.purchaseCount = purchaseCount
        self.timezone = timezone
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.aov = try container.decodeIfPresent(Double.self, forKey: .aov)
        self.device = try container.decodeIfPresent(ListPeopleResponseDataItemDevice.self, forKey: .device)
        self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
        self.eventCount = try container.decode(Int.self, forKey: .eventCount)
        self.firstPurchaseAt = try container.decodeNullableIfPresent(Date.self, forKey: .firstPurchaseAt)
        self.firstSeenAt = try container.decode(Date.self, forKey: .firstSeenAt)
        self.firstSource = try container.decodeNullableIfPresent(ListPeopleResponseDataItemFirstSource.self, forKey: .firstSource)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastIp = try container.decodeNullableIfPresent(String.self, forKey: .lastIp)
        self.lastPurchaseAt = try container.decodeNullableIfPresent(Date.self, forKey: .lastPurchaseAt)
        self.lastSeenAt = try container.decode(Date.self, forKey: .lastSeenAt)
        self.lastSource = try container.decodeNullableIfPresent(ListPeopleResponseDataItemLastSource.self, forKey: .lastSource)
        self.location = try container.decodeIfPresent(ListPeopleResponseDataItemLocation.self, forKey: .location)
        self.ltv = try container.decodeIfPresent(Double.self, forKey: .ltv)
        self.member = try container.decodeNullableIfPresent(ListPeopleResponseDataItemMember.self, forKey: .member)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.phone = try container.decodeNullableIfPresent(String.self, forKey: .phone)
        self.purchaseCount = try container.decode(Int.self, forKey: .purchaseCount)
        self.timezone = try container.decodeNullableIfPresent(String.self, forKey: .timezone)
        self.user = try container.decodeNullableIfPresent(ListPeopleResponseDataItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.aov, forKey: .aov)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encode(self.eventCount, forKey: .eventCount)
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
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encode(self.purchaseCount, forKey: .purchaseCount)
        try container.encodeNullableIfPresent(self.timezone, forKey: .timezone)
        try container.encodeNullableIfPresent(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case aov
        case device
        case email
        case eventCount = "event_count"
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
        case phone
        case purchaseCount = "purchase_count"
        case timezone
        case user
    }
}