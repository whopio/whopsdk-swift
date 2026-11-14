import Foundation

public struct CreateDepositsResponseMethodsBankCurrenciesItem: Codable, Hashable, Sendable {
    /// Bank account number for deposits in this currency.
    public let accountNumber: Nullable<String>
    /// Currency supported by these bank instructions.
    public let currency: String
    /// Receiving bank address.
    public let depositBankAddress: Nullable<String>
    /// Receiving bank name.
    public let depositBankName: Nullable<String>
    /// Beneficiary name to use for transfer.
    public let depositBeneficiaryName: Nullable<String>
    /// Reference to include with bank transfer.
    public let depositReference: Nullable<String>
    /// Active deposit rails for this currency.
    public let rails: [CreateDepositsResponseMethodsBankCurrenciesItemRailsItem]
    /// Bank routing number for deposits in this currency.
    public let routingNumber: Nullable<String>
    /// SWIFT/BIC of the intermediary bank the sending bank routes an international wire through. Null unless `origin_bic` is provided and an intermediary is published for that bank and currency.
    public let swiftBic: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountNumber: Nullable<String>,
        currency: String,
        depositBankAddress: Nullable<String>,
        depositBankName: Nullable<String>,
        depositBeneficiaryName: Nullable<String>,
        depositReference: Nullable<String>,
        rails: [CreateDepositsResponseMethodsBankCurrenciesItemRailsItem],
        routingNumber: Nullable<String>,
        swiftBic: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountNumber = accountNumber
        self.currency = currency
        self.depositBankAddress = depositBankAddress
        self.depositBankName = depositBankName
        self.depositBeneficiaryName = depositBeneficiaryName
        self.depositReference = depositReference
        self.rails = rails
        self.routingNumber = routingNumber
        self.swiftBic = swiftBic
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountNumber = try container.decode(Nullable<String>.self, forKey: .accountNumber)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.depositBankAddress = try container.decode(Nullable<String>.self, forKey: .depositBankAddress)
        self.depositBankName = try container.decode(Nullable<String>.self, forKey: .depositBankName)
        self.depositBeneficiaryName = try container.decode(Nullable<String>.self, forKey: .depositBeneficiaryName)
        self.depositReference = try container.decode(Nullable<String>.self, forKey: .depositReference)
        self.rails = try container.decode([CreateDepositsResponseMethodsBankCurrenciesItemRailsItem].self, forKey: .rails)
        self.routingNumber = try container.decode(Nullable<String>.self, forKey: .routingNumber)
        self.swiftBic = try container.decode(Nullable<String>.self, forKey: .swiftBic)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountNumber, forKey: .accountNumber)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.depositBankAddress, forKey: .depositBankAddress)
        try container.encode(self.depositBankName, forKey: .depositBankName)
        try container.encode(self.depositBeneficiaryName, forKey: .depositBeneficiaryName)
        try container.encode(self.depositReference, forKey: .depositReference)
        try container.encode(self.rails, forKey: .rails)
        try container.encode(self.routingNumber, forKey: .routingNumber)
        try container.encode(self.swiftBic, forKey: .swiftBic)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountNumber = "account_number"
        case currency
        case depositBankAddress = "deposit_bank_address"
        case depositBankName = "deposit_bank_name"
        case depositBeneficiaryName = "deposit_beneficiary_name"
        case depositReference = "deposit_reference"
        case rails
        case routingNumber = "routing_number"
        case swiftBic = "swift_bic"
    }
}