import Foundation

public struct CreateCardsResponse: Codable, Hashable, Sendable {
    /// The billing address.
    public let billing: Nullable<CreateCardsResponseBilling>
    /// When the card was canceled.
    public let canceledAt: Nullable<Date>
    /// When the card was created.
    public let createdAt: Nullable<Date>
    /// Card expiration month.
    public let expirationMonth: Nullable<String>
    /// Card expiration year.
    public let expirationYear: Nullable<String>
    /// Card ID, prefixed `icrd_`.
    public let id: String
    /// Last four digits of the card number. `null` for pending invitation cards.
    public let last4: Nullable<String>
    /// The spending limit configuration.
    public let limit: Nullable<CreateCardsResponseLimit>
    /// Card display name.
    public let name: Nullable<String>
    public let object: CreateCardsResponseObject
    /// Sensitive card details. Present only on `GET /cards/:id` for active cards; `null` when the card is inactive or details cannot be retrieved.
    public let secrets: Nullable<CreateCardsResponseSecrets>?
    /// Total spend in the last 30 days, in cents.
    public let spentLastMonth: Nullable<Int>
    /// The card status. `denied` means the issuer declined the cardholder, so the card will never be issued.
    public let status: Nullable<CreateCardsResponseStatus>
    /// The card type.
    public let type: Nullable<CreateCardsResponseType>
    /// Cardholder user ID, prefixed `user_`, when assigned.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billing: Nullable<CreateCardsResponseBilling>,
        canceledAt: Nullable<Date>,
        createdAt: Nullable<Date>,
        expirationMonth: Nullable<String>,
        expirationYear: Nullable<String>,
        id: String,
        last4: Nullable<String>,
        limit: Nullable<CreateCardsResponseLimit>,
        name: Nullable<String>,
        object: CreateCardsResponseObject,
        secrets: Nullable<CreateCardsResponseSecrets>? = nil,
        spentLastMonth: Nullable<Int>,
        status: Nullable<CreateCardsResponseStatus>,
        type: Nullable<CreateCardsResponseType>,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billing = billing
        self.canceledAt = canceledAt
        self.createdAt = createdAt
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.id = id
        self.last4 = last4
        self.limit = limit
        self.name = name
        self.object = object
        self.secrets = secrets
        self.spentLastMonth = spentLastMonth
        self.status = status
        self.type = type
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billing = try container.decode(Nullable<CreateCardsResponseBilling>.self, forKey: .billing)
        self.canceledAt = try container.decode(Nullable<Date>.self, forKey: .canceledAt)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.expirationMonth = try container.decode(Nullable<String>.self, forKey: .expirationMonth)
        self.expirationYear = try container.decode(Nullable<String>.self, forKey: .expirationYear)
        self.id = try container.decode(String.self, forKey: .id)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.limit = try container.decode(Nullable<CreateCardsResponseLimit>.self, forKey: .limit)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.object = try container.decode(CreateCardsResponseObject.self, forKey: .object)
        self.secrets = try container.decodeNullableIfPresent(CreateCardsResponseSecrets.self, forKey: .secrets)
        self.spentLastMonth = try container.decode(Nullable<Int>.self, forKey: .spentLastMonth)
        self.status = try container.decode(Nullable<CreateCardsResponseStatus>.self, forKey: .status)
        self.type = try container.decode(Nullable<CreateCardsResponseType>.self, forKey: .type)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billing, forKey: .billing)
        try container.encode(self.canceledAt, forKey: .canceledAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.expirationMonth, forKey: .expirationMonth)
        try container.encode(self.expirationYear, forKey: .expirationYear)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.last4, forKey: .last4)
        try container.encode(self.limit, forKey: .limit)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.object, forKey: .object)
        try container.encodeNullableIfPresent(self.secrets, forKey: .secrets)
        try container.encode(self.spentLastMonth, forKey: .spentLastMonth)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billing
        case canceledAt = "canceled_at"
        case createdAt = "created_at"
        case expirationMonth = "expiration_month"
        case expirationYear = "expiration_year"
        case id
        case last4
        case limit
        case name
        case object
        case secrets
        case spentLastMonth = "spent_last_month"
        case status
        case type
        case userId = "user_id"
    }
}