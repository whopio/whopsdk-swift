import Foundation

public struct LedgerActivityPayment: Codable, Hashable, Sendable {
    /// Total charged by the payment.
    public let amount: Nullable<Money>
    /// Card brand, when the customer paid by card.
    public let cardBrand: Nullable<String>
    /// Last four digits of the card, when the customer paid by card.
    public let cardLast4: Nullable<String>
    /// When the payment was created.
    public let createdAt: Date
    /// Payment ID, prefixed `pay_`.
    public let id: String
    public let object: LedgerActivityPaymentObject
    /// How the customer paid, such as `card` or `paypal`.
    public let paymentMethodType: Nullable<String>
    /// Processor that handled the payment, such as `stripe`.
    public let paymentProcessor: Nullable<String>
    /// Variant associated with the payment, when applicable.
    public let plan: Nullable<LedgerActivityPaymentPlan>
    /// Product associated with the payment, when applicable.
    public let product: Nullable<LedgerActivityPaymentProduct>
    /// Customer associated with the payment. Email requires member:email:read.
    public let user: Nullable<LedgerActivityPaymentUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Nullable<Money>,
        cardBrand: Nullable<String>,
        cardLast4: Nullable<String>,
        createdAt: Date,
        id: String,
        object: LedgerActivityPaymentObject,
        paymentMethodType: Nullable<String>,
        paymentProcessor: Nullable<String>,
        plan: Nullable<LedgerActivityPaymentPlan>,
        product: Nullable<LedgerActivityPaymentProduct>,
        user: Nullable<LedgerActivityPaymentUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.cardBrand = cardBrand
        self.cardLast4 = cardLast4
        self.createdAt = createdAt
        self.id = id
        self.object = object
        self.paymentMethodType = paymentMethodType
        self.paymentProcessor = paymentProcessor
        self.plan = plan
        self.product = product
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Nullable<Money>.self, forKey: .amount)
        self.cardBrand = try container.decode(Nullable<String>.self, forKey: .cardBrand)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(LedgerActivityPaymentObject.self, forKey: .object)
        self.paymentMethodType = try container.decode(Nullable<String>.self, forKey: .paymentMethodType)
        self.paymentProcessor = try container.decode(Nullable<String>.self, forKey: .paymentProcessor)
        self.plan = try container.decode(Nullable<LedgerActivityPaymentPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<LedgerActivityPaymentProduct>.self, forKey: .product)
        self.user = try container.decode(Nullable<LedgerActivityPaymentUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.cardLast4, forKey: .cardLast4)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.paymentProcessor, forKey: .paymentProcessor)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case cardBrand = "card_brand"
        case cardLast4 = "card_last4"
        case createdAt = "created_at"
        case id
        case object
        case paymentMethodType = "payment_method_type"
        case paymentProcessor = "payment_processor"
        case plan
        case product
        case user
    }
}