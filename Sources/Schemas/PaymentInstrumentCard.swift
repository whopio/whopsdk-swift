import Foundation

public struct PaymentInstrumentCard: Codable, Hashable, Sendable {
    /// The network identifier (`visa`, `amex`, …), matching `card.networks` entries and saved card payment methods. Null when the vault did not record the network.
    public let brand: Nullable<String>
    /// The card's expiry month, 1 to 12. Null when the vault did not record it.
    public let expMonth: Nullable<Double>
    /// The card's four-digit expiry year. Null when the vault did not record it.
    public let expYear: Nullable<Double>
    /// The issuer identification number, also called the BIN: the card's leading six or eight digits, which identify the issuing bank. Null when the processor did not report it.
    public let issuerIdentificationNumber: Nullable<String>
    /// The card's last four digits, when captured.
    public let last4: Nullable<String>
    /// The network transaction id this account uses for the card. It's this account's own id, from its first customer-present charge or verification on the card, when Whop has one. Otherwise it's an earlier network transaction id for this card, which can come from another account's transaction or be one brought with the card. Cite it as the prior transaction on a later merchant-initiated charge of this card at this account. Null until there is one. A webhook sent as a payment is first recorded can carry `null`, so retrieve the payment to read it.
    public let networkTransactionId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: Nullable<String>,
        expMonth: Nullable<Double>,
        expYear: Nullable<Double>,
        issuerIdentificationNumber: Nullable<String>,
        last4: Nullable<String>,
        networkTransactionId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.expMonth = expMonth
        self.expYear = expYear
        self.issuerIdentificationNumber = issuerIdentificationNumber
        self.last4 = last4
        self.networkTransactionId = networkTransactionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(Nullable<String>.self, forKey: .brand)
        self.expMonth = try container.decode(Nullable<Double>.self, forKey: .expMonth)
        self.expYear = try container.decode(Nullable<Double>.self, forKey: .expYear)
        self.issuerIdentificationNumber = try container.decode(Nullable<String>.self, forKey: .issuerIdentificationNumber)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.networkTransactionId = try container.decode(Nullable<String>.self, forKey: .networkTransactionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.expMonth, forKey: .expMonth)
        try container.encode(self.expYear, forKey: .expYear)
        try container.encode(self.issuerIdentificationNumber, forKey: .issuerIdentificationNumber)
        try container.encode(self.last4, forKey: .last4)
        try container.encode(self.networkTransactionId, forKey: .networkTransactionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case issuerIdentificationNumber = "issuer_identification_number"
        case last4
        case networkTransactionId = "network_transaction_id"
    }
}