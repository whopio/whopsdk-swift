import Foundation

/// A dispute alert represents an early warning notification from a payment processor about a potential dispute or chargeback.
public struct DisputeAlertLegacy: Codable, Hashable, Sendable {
    /// The type of the dispute alert.
    public let alertType: DisputeAlertTypes
    /// The alerted amount in the specified currency.
    public let amount: Double
    /// Whether this alert incurs a charge.
    public let chargeForAlert: Bool
    /// The time the dispute alert was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for the alerted amount.
    public let currency: Currencies
    /// The dispute associated with the dispute alert.
    public let dispute: Nullable<DisputeAlertLegacyDispute>
    /// The unique identifier of the dispute alert.
    public let id: String
    /// The payment associated with the dispute alert.
    public let payment: Nullable<DisputeAlertLegacyPayment>
    /// The date of the original transaction.
    public let transactionDate: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        alertType: DisputeAlertTypes,
        amount: Double,
        chargeForAlert: Bool,
        createdAt: Date,
        currency: Currencies,
        dispute: Nullable<DisputeAlertLegacyDispute>,
        id: String,
        payment: Nullable<DisputeAlertLegacyPayment>,
        transactionDate: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.alertType = alertType
        self.amount = amount
        self.chargeForAlert = chargeForAlert
        self.createdAt = createdAt
        self.currency = currency
        self.dispute = dispute
        self.id = id
        self.payment = payment
        self.transactionDate = transactionDate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.alertType = try container.decode(DisputeAlertTypes.self, forKey: .alertType)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.chargeForAlert = try container.decode(Bool.self, forKey: .chargeForAlert)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.dispute = try container.decode(Nullable<DisputeAlertLegacyDispute>.self, forKey: .dispute)
        self.id = try container.decode(String.self, forKey: .id)
        self.payment = try container.decode(Nullable<DisputeAlertLegacyPayment>.self, forKey: .payment)
        self.transactionDate = try container.decode(Nullable<Date>.self, forKey: .transactionDate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.alertType, forKey: .alertType)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.chargeForAlert, forKey: .chargeForAlert)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.dispute, forKey: .dispute)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.transactionDate, forKey: .transactionDate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case alertType = "alert_type"
        case amount
        case chargeForAlert = "charge_for_alert"
        case createdAt = "created_at"
        case currency
        case dispute
        case id
        case payment
        case transactionDate = "transaction_date"
    }
}