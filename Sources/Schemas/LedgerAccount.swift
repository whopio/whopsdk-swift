import Foundation

/// A ledger account represents a financial account on Whop that can hold many balances.
public struct LedgerAccount: Codable, Hashable, Sendable {
    /// The balances associated with the account.
    public let balances: [LedgerAccountBalancesItem]
    /// The unique identifier for the ledger account.
    public let id: String
    /// The type of ledger account.
    public let ledgerType: LedgerTypes
    /// The owner of the ledger account.
    public let owner: LedgerAccountOwner
    /// The status of payments approval for the ledger account.
    public let paymentsApprovalStatus: Nullable<PaymentsApprovalStatuses>
    /// The payout account associated with the LedgerAccount, if any.
    public let payoutAccountDetails: Nullable<LedgerAccountPayoutAccountDetails>
    /// The settlement batch most recently posted to this account's available balance, at midnight UTC. Every payment settling in that batch carries the same `settlement_time_at`.
    public let settlementTimeAt: Nullable<Date>
    /// The fee for transfers, if applicable.
    public let transferFee: Nullable<Double>
    /// The balance cache associated with the account by currency.
    public let treasuryBalance: Nullable<LedgerAccountTreasuryBalance>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balances: [LedgerAccountBalancesItem],
        id: String,
        ledgerType: LedgerTypes,
        owner: LedgerAccountOwner,
        paymentsApprovalStatus: Nullable<PaymentsApprovalStatuses>,
        payoutAccountDetails: Nullable<LedgerAccountPayoutAccountDetails>,
        settlementTimeAt: Nullable<Date>,
        transferFee: Nullable<Double>,
        treasuryBalance: Nullable<LedgerAccountTreasuryBalance>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balances = balances
        self.id = id
        self.ledgerType = ledgerType
        self.owner = owner
        self.paymentsApprovalStatus = paymentsApprovalStatus
        self.payoutAccountDetails = payoutAccountDetails
        self.settlementTimeAt = settlementTimeAt
        self.transferFee = transferFee
        self.treasuryBalance = treasuryBalance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balances = try container.decode([LedgerAccountBalancesItem].self, forKey: .balances)
        self.id = try container.decode(String.self, forKey: .id)
        self.ledgerType = try container.decode(LedgerTypes.self, forKey: .ledgerType)
        self.owner = try container.decode(LedgerAccountOwner.self, forKey: .owner)
        self.paymentsApprovalStatus = try container.decode(Nullable<PaymentsApprovalStatuses>.self, forKey: .paymentsApprovalStatus)
        self.payoutAccountDetails = try container.decode(Nullable<LedgerAccountPayoutAccountDetails>.self, forKey: .payoutAccountDetails)
        self.settlementTimeAt = try container.decode(Nullable<Date>.self, forKey: .settlementTimeAt)
        self.transferFee = try container.decode(Nullable<Double>.self, forKey: .transferFee)
        self.treasuryBalance = try container.decode(Nullable<LedgerAccountTreasuryBalance>.self, forKey: .treasuryBalance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balances, forKey: .balances)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.ledgerType, forKey: .ledgerType)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.paymentsApprovalStatus, forKey: .paymentsApprovalStatus)
        try container.encode(self.payoutAccountDetails, forKey: .payoutAccountDetails)
        try container.encode(self.settlementTimeAt, forKey: .settlementTimeAt)
        try container.encode(self.transferFee, forKey: .transferFee)
        try container.encode(self.treasuryBalance, forKey: .treasuryBalance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balances
        case id
        case ledgerType = "ledger_type"
        case owner
        case paymentsApprovalStatus = "payments_approval_status"
        case payoutAccountDetails = "payout_account_details"
        case settlementTimeAt = "settlement_time_at"
        case transferFee = "transfer_fee"
        case treasuryBalance = "treasury_balance"
    }
}