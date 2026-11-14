import Foundation

/// The bank account-specific details for this payment method, including bank name and last four digits.
public struct PaymentMethodListItemUsBankAccountPaymentMethodUsBankAccount: Codable, Hashable, Sendable {
    /// The type of bank account (e.g., checking, savings).
    public let accountType: Nullable<String>
    /// The name of the financial institution holding the account.
    public let bankName: Nullable<String>
    /// The last four digits of the bank account number.
    public let last4: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountType: Nullable<String>,
        bankName: Nullable<String>,
        last4: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountType = accountType
        self.bankName = bankName
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountType = try container.decode(Nullable<String>.self, forKey: .accountType)
        self.bankName = try container.decode(Nullable<String>.self, forKey: .bankName)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountType, forKey: .accountType)
        try container.encode(self.bankName, forKey: .bankName)
        try container.encode(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountType = "account_type"
        case bankName = "bank_name"
        case last4
    }
}