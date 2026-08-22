import Foundation

/// Sensitive card details. Present only on `GET /cards/:id` for active cards; `null` when the card is inactive or details cannot be retrieved.
public struct PostCardCanceledPayloadDataSecrets: Codable, Hashable, Sendable {
    /// Full card number.
    public let cardNumber: String
    /// Card verification code.
    public let cvc: String
    /// Cardholder name printed on the card.
    public let nameOnCard: Nullable<String>
    /// The card PIN. Only returned when the request is authenticated as the user the card is assigned to; `null` for all other callers, including account API keys.
    public let pin: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardNumber: String,
        cvc: String,
        nameOnCard: Nullable<String>,
        pin: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardNumber = cardNumber
        self.cvc = cvc
        self.nameOnCard = nameOnCard
        self.pin = pin
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardNumber = try container.decode(String.self, forKey: .cardNumber)
        self.cvc = try container.decode(String.self, forKey: .cvc)
        self.nameOnCard = try container.decode(Nullable<String>.self, forKey: .nameOnCard)
        self.pin = try container.decode(Nullable<String>.self, forKey: .pin)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardNumber, forKey: .cardNumber)
        try container.encode(self.cvc, forKey: .cvc)
        try container.encode(self.nameOnCard, forKey: .nameOnCard)
        try container.encode(self.pin, forKey: .pin)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardNumber = "card_number"
        case cvc
        case nameOnCard = "name_on_card"
        case pin
    }
}