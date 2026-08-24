import Foundation

public struct PulseEventsResponseDataItem: Codable, Hashable, Sendable {
    /// The underlying event recorded. Every movement on this feed is a ledger line, so switch on `type` rather than this.
    public let eventName: PulseEventsResponseDataItemEventName
    /// When the event happened, coarsened to the start of the minute.
    public let eventTime: Date
    /// The USD amount of the event.
    public let totalUsdAmount: Nullable<Double>?
    /// What moved: a purchase, an affiliate commission, Whop card spend, ad spend, app revenue, an off-platform sale, a wallet deposit, a card load, a claimed drop, a transfer between accounts, or a referral bonus.
    public let type: PulseEventsResponseDataItemType
    /// Coarse location, shaped like the event `user` block. It belongs to the owner of the wallet the money moved into or out of — the party the event is about, never their counterparty. Omitted entirely when nothing is known.
    public let user: PulseEventsResponseDataItemUser?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        eventName: PulseEventsResponseDataItemEventName,
        eventTime: Date,
        totalUsdAmount: Nullable<Double>? = nil,
        type: PulseEventsResponseDataItemType,
        user: PulseEventsResponseDataItemUser? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.eventName = eventName
        self.eventTime = eventTime
        self.totalUsdAmount = totalUsdAmount
        self.type = type
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventName = try container.decode(PulseEventsResponseDataItemEventName.self, forKey: .eventName)
        self.eventTime = try container.decode(Date.self, forKey: .eventTime)
        self.totalUsdAmount = try container.decodeNullableIfPresent(Double.self, forKey: .totalUsdAmount)
        self.type = try container.decode(PulseEventsResponseDataItemType.self, forKey: .type)
        self.user = try container.decodeIfPresent(PulseEventsResponseDataItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.eventName, forKey: .eventName)
        try container.encode(self.eventTime, forKey: .eventTime)
        try container.encodeNullableIfPresent(self.totalUsdAmount, forKey: .totalUsdAmount)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eventName = "event_name"
        case eventTime = "event_time"
        case totalUsdAmount = "total_usd_amount"
        case type
        case user
    }
}