import Foundation

/// The SEPA Direct Debit-specific details for this payment method, including bank code and last four IBAN digits.
public struct PaymentMethodSepaDebitPaymentMethodSepaDebit: Codable, Hashable, Sendable {
    /// The bank code of the financial institution associated with this SEPA account. Null if not available.
    public let bankCode: Nullable<String>
    /// The branch code of the financial institution associated with this SEPA account. Null if not available.
    public let branchCode: Nullable<String>
    /// The two-letter ISO country code where the bank account is located. Null if not available.
    public let country: Nullable<String>
    /// The last four digits of the IBAN associated with this SEPA account. Null if not available.
    public let last4: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bankCode: Nullable<String>,
        branchCode: Nullable<String>,
        country: Nullable<String>,
        last4: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bankCode = bankCode
        self.branchCode = branchCode
        self.country = country
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bankCode = try container.decode(Nullable<String>.self, forKey: .bankCode)
        self.branchCode = try container.decode(Nullable<String>.self, forKey: .branchCode)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bankCode, forKey: .bankCode)
        try container.encode(self.branchCode, forKey: .branchCode)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bankCode = "bank_code"
        case branchCode = "branch_code"
        case country
        case last4
    }
}