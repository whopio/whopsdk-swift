import Foundation

public struct RetrieveFinancialReportsResponsePaymentFeeBreakdownItem: Codable, Hashable, Sendable {
    /// Payment costs attributed to this payment method.
    public let amount: Money
    /// The customer-facing payment method family or standalone service.
    public let category: RetrieveFinancialReportsResponsePaymentFeeBreakdownItemCategory
    /// The card brand, payment provider, payment rail, or standalone service.
    public let paymentMethod: String
    /// Start of the time bucket containing these payment costs.
    public let period: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        category: RetrieveFinancialReportsResponsePaymentFeeBreakdownItemCategory,
        paymentMethod: String,
        period: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.category = category
        self.paymentMethod = paymentMethod
        self.period = period
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.category = try container.decode(RetrieveFinancialReportsResponsePaymentFeeBreakdownItemCategory.self, forKey: .category)
        self.paymentMethod = try container.decode(String.self, forKey: .paymentMethod)
        self.period = try container.decode(String.self, forKey: .period)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.paymentMethod, forKey: .paymentMethod)
        try container.encode(self.period, forKey: .period)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case category
        case paymentMethod = "payment_method"
        case period
    }
}