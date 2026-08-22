import Foundation

public struct LedgerActivityResourceBankBank: Codable, Hashable, Sendable {
    /// Bank account holder name.
    public let accountName: Nullable<String>
    /// Bank account type.
    public let accountType: Nullable<String>
    /// Bank name.
    public let bankName: Nullable<String>
    /// Last four digits of the bank account.
    public let last4: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountName: Nullable<String>,
        accountType: Nullable<String>,
        bankName: Nullable<String>,
        last4: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountName = accountName
        self.accountType = accountType
        self.bankName = bankName
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountName = try container.decode(Nullable<String>.self, forKey: .accountName)
        self.accountType = try container.decode(Nullable<String>.self, forKey: .accountType)
        self.bankName = try container.decode(Nullable<String>.self, forKey: .bankName)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountName, forKey: .accountName)
        try container.encode(self.accountType, forKey: .accountType)
        try container.encode(self.bankName, forKey: .bankName)
        try container.encode(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountName = "account_name"
        case accountType = "account_type"
        case bankName = "bank_name"
        case last4
    }
}