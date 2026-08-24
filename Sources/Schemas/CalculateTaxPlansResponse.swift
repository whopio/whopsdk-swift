import Foundation

public struct CalculateTaxPlansResponse: Codable, Hashable, Sendable {
    /// Three-letter ISO 4217 currency code for the returned amounts.
    public let currency: String
    /// Whether Whop calculated tax for this preview. `not_calculated` means no tax could be determined, so `tax_amount` is 0 and `total` equals `subtotal`.
    public let status: CalculateTaxPlansResponseStatus
    /// Plan price in the currency's smallest unit, for example cents. For exclusive tax, this is the pre-tax amount; for inclusive tax, it already includes tax and equals the total.
    public let subtotal: Int
    /// Calculated tax amount in the currency's smallest unit. For exclusive tax, this is added on top of the subtotal; for inclusive tax, it is the portion of the subtotal that is tax.
    public let taxAmount: Int
    /// Whether tax is added on top of the plan price or already included in it for this buyer's location.
    public let taxBehavior: CalculateTaxPlansResponseTaxBehavior
    /// Amount the buyer would pay in the currency's smallest unit.
    public let total: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: String,
        status: CalculateTaxPlansResponseStatus,
        subtotal: Int,
        taxAmount: Int,
        taxBehavior: CalculateTaxPlansResponseTaxBehavior,
        total: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.status = status
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.taxBehavior = taxBehavior
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.status = try container.decode(CalculateTaxPlansResponseStatus.self, forKey: .status)
        self.subtotal = try container.decode(Int.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Int.self, forKey: .taxAmount)
        self.taxBehavior = try container.decode(CalculateTaxPlansResponseTaxBehavior.self, forKey: .taxBehavior)
        self.total = try container.decode(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.taxBehavior, forKey: .taxBehavior)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case status
        case subtotal
        case taxAmount = "tax_amount"
        case taxBehavior = "tax_behavior"
        case total
    }
}