import Foundation

/// A payment method named on this call rather than described by a confirmation token. `type` names it and the member named after it carries its details. Nothing is collected on this call: the payment is created first and the buyer or device then acts on the `next_action` the status endpoint serves. `card_present` (Tap to Pay): the reader collects against the payment with the client secret in `next_action`. `paypal`: the buyer approves on PayPal's page, reached through a `redirect` `next_action`, then returns to `return_url`; `member_id` or `email` names the buyer. Mutually exclusive with `confirmation_token` and `payment_method_id`, and with `member_id` except for `paypal`.
public struct CreatePaymentsRequestPaymentMethod: Codable, Hashable, Sendable {
    /// Required when `type` is `card_present`.
    public let cardPresent: CreatePaymentsRequestPaymentMethodCardPresent?
    /// Options for a `paypal` payment method.
    public let paypal: CreatePaymentsRequestPaymentMethodPaypal?
    /// The kind of payment method; the member named after it carries its details.
    public let type: CreatePaymentsRequestPaymentMethodType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardPresent: CreatePaymentsRequestPaymentMethodCardPresent? = nil,
        paypal: CreatePaymentsRequestPaymentMethodPaypal? = nil,
        type: CreatePaymentsRequestPaymentMethodType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardPresent = cardPresent
        self.paypal = paypal
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardPresent = try container.decodeIfPresent(CreatePaymentsRequestPaymentMethodCardPresent.self, forKey: .cardPresent)
        self.paypal = try container.decodeIfPresent(CreatePaymentsRequestPaymentMethodPaypal.self, forKey: .paypal)
        self.type = try container.decode(CreatePaymentsRequestPaymentMethodType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cardPresent, forKey: .cardPresent)
        try container.encodeIfPresent(self.paypal, forKey: .paypal)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardPresent = "card_present"
        case paypal
        case type
    }
}