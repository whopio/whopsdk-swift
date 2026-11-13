import Foundation

public struct PostEventsCreatedPayloadDataEventsItem: Codable, Hashable, Sendable {
    /// UTM parameters, ad click ids and ad ids, as the page reported them. Keys the event did not carry are left out.
    public let context: PostEventsCreatedPayloadDataEventsItemContext
    /// The custom event's own name, for `custom` events.
    public let customName: Nullable<String>?
    /// The event name as `POST /events` takes it, such as `page`, `view_content`, `add_to_cart` or `custom`.
    public let eventName: String
    /// When the event happened.
    public let eventTime: Date
    /// The event id, unique together with `event_name`. A redelivered event carries the same pair.
    public let id: String
    /// The product the event was about.
    public let productId: Nullable<String>?
    /// The page that linked to `url`.
    public let referrerUrl: Nullable<String>?
    /// The page title.
    public let title: Nullable<String>?
    /// The page the event happened on.
    public let url: Nullable<String>?
    /// Who the event was about, as far as the page knew. Keys the event did not carry are left out.
    public let user: PostEventsCreatedPayloadDataEventsItemUser
    /// The event's monetary value. Null when the event carried no value or no currency.
    public let value: Nullable<Money>?
    /// The variant the event was about.
    public let variantId: Nullable<String>?
    /// The visitor's `_wuid` first-party cookie id, so a browser session can be joined to this event. Null when the event carried none.
    public let wuid: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        context: PostEventsCreatedPayloadDataEventsItemContext,
        customName: Nullable<String>? = nil,
        eventName: String,
        eventTime: Date,
        id: String,
        productId: Nullable<String>? = nil,
        referrerUrl: Nullable<String>? = nil,
        title: Nullable<String>? = nil,
        url: Nullable<String>? = nil,
        user: PostEventsCreatedPayloadDataEventsItemUser,
        value: Nullable<Money>? = nil,
        variantId: Nullable<String>? = nil,
        wuid: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.context = context
        self.customName = customName
        self.eventName = eventName
        self.eventTime = eventTime
        self.id = id
        self.productId = productId
        self.referrerUrl = referrerUrl
        self.title = title
        self.url = url
        self.user = user
        self.value = value
        self.variantId = variantId
        self.wuid = wuid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.decode(PostEventsCreatedPayloadDataEventsItemContext.self, forKey: .context)
        self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
        self.eventName = try container.decode(String.self, forKey: .eventName)
        self.eventTime = try container.decode(Date.self, forKey: .eventTime)
        self.id = try container.decode(String.self, forKey: .id)
        self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
        self.referrerUrl = try container.decodeNullableIfPresent(String.self, forKey: .referrerUrl)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
        self.user = try container.decode(PostEventsCreatedPayloadDataEventsItemUser.self, forKey: .user)
        self.value = try container.decodeNullableIfPresent(Money.self, forKey: .value)
        self.variantId = try container.decodeNullableIfPresent(String.self, forKey: .variantId)
        self.wuid = try container.decode(Nullable<String>.self, forKey: .wuid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.context, forKey: .context)
        try container.encodeNullableIfPresent(self.customName, forKey: .customName)
        try container.encode(self.eventName, forKey: .eventName)
        try container.encode(self.eventTime, forKey: .eventTime)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.productId, forKey: .productId)
        try container.encodeNullableIfPresent(self.referrerUrl, forKey: .referrerUrl)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encodeNullableIfPresent(self.url, forKey: .url)
        try container.encode(self.user, forKey: .user)
        try container.encodeNullableIfPresent(self.value, forKey: .value)
        try container.encodeNullableIfPresent(self.variantId, forKey: .variantId)
        try container.encode(self.wuid, forKey: .wuid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case context
        case customName = "custom_name"
        case eventName = "event_name"
        case eventTime = "event_time"
        case id
        case productId = "product_id"
        case referrerUrl = "referrer_url"
        case title
        case url
        case user
        case value
        case variantId = "variant_id"
        case wuid
    }
}