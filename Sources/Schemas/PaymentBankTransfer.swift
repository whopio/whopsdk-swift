import Foundation

public struct PaymentBankTransfer: Codable, Hashable, Sendable {
    /// Whether the buyer can complete this payment with more than one transfer. When false, only one transfer for the full amount completes it.
    public let acceptsSplitTransfers: Bool?
    /// The account to send to, in the local scheme's format — `account_number_label` says what to call it.
    public let accountNumber: String?
    /// What to call `account_number` when showing it, in the local scheme's own terms — `CLABE` in Mexico, for example.
    public let accountNumberLabel: String?
    /// Exactly what the buyer must send, in the charged currency.
    public let amount: Money?
    /// The kind of account receiving the transfer, such as a checking account, in the local system's own vocabulary.
    public let bankAccountType: String?
    /// The receiving bank's address.
    public let bankAddress: String?
    /// The receiving branch, where the local system routes by branch.
    public let bankBranch: String?
    /// The code that identifies the receiving bank — its code in the local clearing system, or its SWIFT/BIC on a transfer that crosses borders.
    public let bankCode: String?
    /// What to call `bank_code` when showing it, in the scheme's own terms — `SWIFT / BIC` on an international wire, for example.
    public let bankCodeLabel: String?
    /// The receiving bank's name.
    public let bankName: String?
    /// The account holder's tax or identity document number, where the local system needs it to send.
    public let beneficiaryDocument: String?
    /// What kind of document `beneficiary_document` is, in the local system's own vocabulary.
    public let beneficiaryDocumentType: String?
    /// Who the account belongs to — the name the buyer's bank may ask them to confirm.
    public let beneficiaryName: String?
    /// A hosted page with the complete, printable instructions. If you would rather not render the details yourself, send the buyer here.
    public let documentUrl: String?
    /// When these details stop being payable, as an ISO 8601 timestamp.
    public let expiresAt: String?
    /// The rail's own step-by-step payment text, when it supplies one.
    public let instructions: String?
    /// The SWIFT/BIC of the intermediary bank the buyer's bank should route the transfer through, when the buyer named the bank they are sending from.
    public let intermediaryBic: String?
    /// The reference the buyer must attach to the transfer so it can be matched to this payment.
    public let reference: String?
    /// The receiving bank's routing number for US transfers.
    public let routingNumber: String?
    /// A second account number, where the rail publishes the same destination in more than one format.
    public let secondaryAccountNumber: String?
    /// What to call `secondary_account_number` when showing it.
    public let secondaryAccountNumberLabel: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptsSplitTransfers: Bool? = nil,
        accountNumber: String? = nil,
        accountNumberLabel: String? = nil,
        amount: Money? = nil,
        bankAccountType: String? = nil,
        bankAddress: String? = nil,
        bankBranch: String? = nil,
        bankCode: String? = nil,
        bankCodeLabel: String? = nil,
        bankName: String? = nil,
        beneficiaryDocument: String? = nil,
        beneficiaryDocumentType: String? = nil,
        beneficiaryName: String? = nil,
        documentUrl: String? = nil,
        expiresAt: String? = nil,
        instructions: String? = nil,
        intermediaryBic: String? = nil,
        reference: String? = nil,
        routingNumber: String? = nil,
        secondaryAccountNumber: String? = nil,
        secondaryAccountNumberLabel: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptsSplitTransfers = acceptsSplitTransfers
        self.accountNumber = accountNumber
        self.accountNumberLabel = accountNumberLabel
        self.amount = amount
        self.bankAccountType = bankAccountType
        self.bankAddress = bankAddress
        self.bankBranch = bankBranch
        self.bankCode = bankCode
        self.bankCodeLabel = bankCodeLabel
        self.bankName = bankName
        self.beneficiaryDocument = beneficiaryDocument
        self.beneficiaryDocumentType = beneficiaryDocumentType
        self.beneficiaryName = beneficiaryName
        self.documentUrl = documentUrl
        self.expiresAt = expiresAt
        self.instructions = instructions
        self.intermediaryBic = intermediaryBic
        self.reference = reference
        self.routingNumber = routingNumber
        self.secondaryAccountNumber = secondaryAccountNumber
        self.secondaryAccountNumberLabel = secondaryAccountNumberLabel
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptsSplitTransfers = try container.decodeIfPresent(Bool.self, forKey: .acceptsSplitTransfers)
        self.accountNumber = try container.decodeIfPresent(String.self, forKey: .accountNumber)
        self.accountNumberLabel = try container.decodeIfPresent(String.self, forKey: .accountNumberLabel)
        self.amount = try container.decodeIfPresent(Money.self, forKey: .amount)
        self.bankAccountType = try container.decodeIfPresent(String.self, forKey: .bankAccountType)
        self.bankAddress = try container.decodeIfPresent(String.self, forKey: .bankAddress)
        self.bankBranch = try container.decodeIfPresent(String.self, forKey: .bankBranch)
        self.bankCode = try container.decodeIfPresent(String.self, forKey: .bankCode)
        self.bankCodeLabel = try container.decodeIfPresent(String.self, forKey: .bankCodeLabel)
        self.bankName = try container.decodeIfPresent(String.self, forKey: .bankName)
        self.beneficiaryDocument = try container.decodeIfPresent(String.self, forKey: .beneficiaryDocument)
        self.beneficiaryDocumentType = try container.decodeIfPresent(String.self, forKey: .beneficiaryDocumentType)
        self.beneficiaryName = try container.decodeIfPresent(String.self, forKey: .beneficiaryName)
        self.documentUrl = try container.decodeIfPresent(String.self, forKey: .documentUrl)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.intermediaryBic = try container.decodeIfPresent(String.self, forKey: .intermediaryBic)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.routingNumber = try container.decodeIfPresent(String.self, forKey: .routingNumber)
        self.secondaryAccountNumber = try container.decodeIfPresent(String.self, forKey: .secondaryAccountNumber)
        self.secondaryAccountNumberLabel = try container.decodeIfPresent(String.self, forKey: .secondaryAccountNumberLabel)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.acceptsSplitTransfers, forKey: .acceptsSplitTransfers)
        try container.encodeIfPresent(self.accountNumber, forKey: .accountNumber)
        try container.encodeIfPresent(self.accountNumberLabel, forKey: .accountNumberLabel)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.bankAccountType, forKey: .bankAccountType)
        try container.encodeIfPresent(self.bankAddress, forKey: .bankAddress)
        try container.encodeIfPresent(self.bankBranch, forKey: .bankBranch)
        try container.encodeIfPresent(self.bankCode, forKey: .bankCode)
        try container.encodeIfPresent(self.bankCodeLabel, forKey: .bankCodeLabel)
        try container.encodeIfPresent(self.bankName, forKey: .bankName)
        try container.encodeIfPresent(self.beneficiaryDocument, forKey: .beneficiaryDocument)
        try container.encodeIfPresent(self.beneficiaryDocumentType, forKey: .beneficiaryDocumentType)
        try container.encodeIfPresent(self.beneficiaryName, forKey: .beneficiaryName)
        try container.encodeIfPresent(self.documentUrl, forKey: .documentUrl)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encodeIfPresent(self.intermediaryBic, forKey: .intermediaryBic)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.routingNumber, forKey: .routingNumber)
        try container.encodeIfPresent(self.secondaryAccountNumber, forKey: .secondaryAccountNumber)
        try container.encodeIfPresent(self.secondaryAccountNumberLabel, forKey: .secondaryAccountNumberLabel)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptsSplitTransfers = "accepts_split_transfers"
        case accountNumber = "account_number"
        case accountNumberLabel = "account_number_label"
        case amount
        case bankAccountType = "bank_account_type"
        case bankAddress = "bank_address"
        case bankBranch = "bank_branch"
        case bankCode = "bank_code"
        case bankCodeLabel = "bank_code_label"
        case bankName = "bank_name"
        case beneficiaryDocument = "beneficiary_document"
        case beneficiaryDocumentType = "beneficiary_document_type"
        case beneficiaryName = "beneficiary_name"
        case documentUrl = "document_url"
        case expiresAt = "expires_at"
        case instructions
        case intermediaryBic = "intermediary_bic"
        case reference
        case routingNumber = "routing_number"
        case secondaryAccountNumber = "secondary_account_number"
        case secondaryAccountNumberLabel = "secondary_account_number_label"
    }
}