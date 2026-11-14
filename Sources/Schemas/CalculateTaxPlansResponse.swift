import Foundation

public struct CalculateTaxPlansResponse: Codable, Hashable, Sendable {
    public let currency: String
    public let status: CalculateTaxPlansResponseStatus
    public let subtotal: Int
    public let taxAmount: Int
    public let taxBehavior: CalculateTaxPlansResponseTaxBehavior
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