import Foundation

public struct ListEventsResponseDataItem: Codable, Hashable, Sendable {
    public let context: Nullable<ListEventsResponseDataItemContext>?
    public let currency: Nullable<String>?
    public let customName: Nullable<String>?
    public let eventId: String
    public let eventName: String
    public let eventTime: Date
    public let id: String
    public let path: Nullable<String>?
    public let personId: String
    public let questions: Nullable<[ListEventsResponseDataItemQuestionsItem]>?
    public let recommendedActionChainId: Nullable<String>?
    public let recommendedActionShownPosition: Nullable<Int>?
    public let referrerUrl: Nullable<String>?
    /// Hydrated details for the records this event references. Only present keys resolved.
    public let related: Nullable<ListEventsResponseDataItemRelated>?
    public let totalUsdAmount: Nullable<Double>?
    public let url: Nullable<String>?
    public let user: Nullable<ListEventsResponseDataItemUser>?
    public let value: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        context: Nullable<ListEventsResponseDataItemContext>? = nil,
        currency: Nullable<String>? = nil,
        customName: Nullable<String>? = nil,
        eventId: String,
        eventName: String,
        eventTime: Date,
        id: String,
        path: Nullable<String>? = nil,
        personId: String,
        questions: Nullable<[ListEventsResponseDataItemQuestionsItem]>? = nil,
        recommendedActionChainId: Nullable<String>? = nil,
        recommendedActionShownPosition: Nullable<Int>? = nil,
        referrerUrl: Nullable<String>? = nil,
        related: Nullable<ListEventsResponseDataItemRelated>? = nil,
        totalUsdAmount: Nullable<Double>? = nil,
        url: Nullable<String>? = nil,
        user: Nullable<ListEventsResponseDataItemUser>? = nil,
        value: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.context = context
        self.currency = currency
        self.customName = customName
        self.eventId = eventId
        self.eventName = eventName
        self.eventTime = eventTime
        self.id = id
        self.path = path
        self.personId = personId
        self.questions = questions
        self.recommendedActionChainId = recommendedActionChainId
        self.recommendedActionShownPosition = recommendedActionShownPosition
        self.referrerUrl = referrerUrl
        self.related = related
        self.totalUsdAmount = totalUsdAmount
        self.url = url
        self.user = user
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.decodeNullableIfPresent(ListEventsResponseDataItemContext.self, forKey: .context)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
        self.eventId = try container.decode(String.self, forKey: .eventId)
        self.eventName = try container.decode(String.self, forKey: .eventName)
        self.eventTime = try container.decode(Date.self, forKey: .eventTime)
        self.id = try container.decode(String.self, forKey: .id)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.personId = try container.decode(String.self, forKey: .personId)
        self.questions = try container.decodeNullableIfPresent([ListEventsResponseDataItemQuestionsItem].self, forKey: .questions)
        self.recommendedActionChainId = try container.decodeNullableIfPresent(String.self, forKey: .recommendedActionChainId)
        self.recommendedActionShownPosition = try container.decodeNullableIfPresent(Int.self, forKey: .recommendedActionShownPosition)
        self.referrerUrl = try container.decodeNullableIfPresent(String.self, forKey: .referrerUrl)
        self.related = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelated.self, forKey: .related)
        self.totalUsdAmount = try container.decodeNullableIfPresent(Double.self, forKey: .totalUsdAmount)
        self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
        self.user = try container.decodeNullableIfPresent(ListEventsResponseDataItemUser.self, forKey: .user)
        self.value = try container.decodeNullableIfPresent(Double.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.context, forKey: .context)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.customName, forKey: .customName)
        try container.encode(self.eventId, forKey: .eventId)
        try container.encode(self.eventName, forKey: .eventName)
        try container.encode(self.eventTime, forKey: .eventTime)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
        try container.encode(self.personId, forKey: .personId)
        try container.encodeNullableIfPresent(self.questions, forKey: .questions)
        try container.encodeNullableIfPresent(self.recommendedActionChainId, forKey: .recommendedActionChainId)
        try container.encodeNullableIfPresent(self.recommendedActionShownPosition, forKey: .recommendedActionShownPosition)
        try container.encodeNullableIfPresent(self.referrerUrl, forKey: .referrerUrl)
        try container.encodeNullableIfPresent(self.related, forKey: .related)
        try container.encodeNullableIfPresent(self.totalUsdAmount, forKey: .totalUsdAmount)
        try container.encodeNullableIfPresent(self.url, forKey: .url)
        try container.encodeNullableIfPresent(self.user, forKey: .user)
        try container.encodeNullableIfPresent(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case context
        case currency
        case customName = "custom_name"
        case eventId = "event_id"
        case eventName = "event_name"
        case eventTime = "event_time"
        case id
        case path
        case personId = "person_id"
        case questions
        case recommendedActionChainId = "recommended_action_chain_id"
        case recommendedActionShownPosition = "recommended_action_shown_position"
        case referrerUrl = "referrer_url"
        case related
        case totalUsdAmount = "total_usd_amount"
        case url
        case user
        case value
    }
}