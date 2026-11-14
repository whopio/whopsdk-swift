import Foundation

public struct AccountFees: Codable, Hashable, Sendable {
    /// The account these fees are charged to, prefixed `biz_`.
    public let accountId: String
    /// A flat fee in US dollars (USD), charged when the account holder disputes an ACH payment. Replaces the `dispute` fee for that payment.
    public let achDispute: AccountFee
    /// A flat fee in US dollars (USD), charged when the buyer's bank returns an ACH payment unpaid.
    public let achReturn: AccountFee
    /// Charged on bank deposits into the account's balance.
    public let bankDeposit: AccountFee
    /// Charged on recurring billing.
    public let billing: AccountFee
    /// Charged to the buyer at checkout, on top of the price.
    public let buyer: AccountFee
    /// Card payments. `percentage` and `fixed` are the rate in the headline `region`; every other acquirer region is under `regions`.
    public let cardProcessing: AccountFee
    /// The default markups this account charges subaccounts, configurable before any accounts connect. `null` if this account has a parent.
    public let childMarkups: Nullable<AccountFeeMarkups>
    /// Which payout fees this account pays for its subaccounts.
    public let coveredPayoutFees: AccountCoveredPayoutFees
    /// Added to a payment whose card was issued outside the region where the payment was processed.
    public let crossBorder: AccountFee
    /// Charged when a payment is disputed.
    public let dispute: AccountFee
    /// Charged when an early dispute alert lets Whop refund a payment before it becomes a dispute.
    public let disputeAlert: AccountFee
    /// The early dispute alert fee when the alert comes through Verifi CDRN.
    public let disputeAlertCdrn: AccountFee
    /// The early dispute alert fee when the alert comes through Ethoca.
    public let disputeAlertEthoca: AccountFee
    /// The early dispute alert fee when the alert comes through Verifi RDR.
    public let disputeAlertRdr: AccountFee
    /// Charged on the amount recovered when Whop fights a dispute and wins.
    public let disputeRepresentment: AccountFee
    /// Added to a payment settled in a currency other than the one it was charged in.
    public let foreignExchange: AccountFee
    /// Charged when a payment is screened for fraud.
    public let fraudScreening: AccountFee
    /// Added to every payment while the account is classed as high risk.
    public let highRisk: AccountFee
    /// Charged on payments attributed to the Whop marketplace.
    public let marketplace: AccountFee
    /// What the platform this account is connected to adds on top of Whop's fees, collected by that platform. `null` unless the account has a parent.
    public let markups: Nullable<AccountFeeMarkups>
    /// Charged on payments routed through Whop's payment orchestration.
    public let orchestration: AccountFee
    /// The platform this account is connected to, whose markups appear under `markups`. `null` for a standalone account.
    public let parentAccountId: Nullable<String>
    /// Processing fees for every non-card payment method the platform prices, keyed by payment method type such as `us_bank_account` or `klarna`.
    public let paymentMethods: [String: AccountFee]
    /// Fees on withdrawals, keyed by payout method: `bank_wire`, `same_day_bank`, `next_day_bank`, `rtp`, `crypto`, and `digital_wallet`. Payout fees the parent account covers show as zero when a subaccount's fees are read without access to its parent account.
    public let payouts: [String: AccountFee]
    /// Charged when pending, not-yet-settled balance is advanced to fund the account's cards balance.
    public let pendingAutoTopup: AccountFee
    /// Whop's share of every payment, on top of card processing.
    public let platformProcessing: AccountFee
    /// Charged on payouts from a shared pool balance.
    public let poolPayout: AccountFee
    /// Charged on payments where the account shares revenue with revshare affiliates.
    public let revshare: AccountFee
    /// A flat fee in euros (EUR), charged when the account holder disputes a SEPA Direct Debit payment. Replaces the `dispute` fee for that payment.
    public let sepaDispute: AccountFee
    /// A flat fee in euros (EUR), charged when the buyer's bank returns a SEPA Direct Debit payment unpaid.
    public let sepaReturn: AccountFee
    /// Charged when Whop calculates tax on a payment and the account remits the tax itself. An account whose `tax_remitted_by` is `null` pays it on every taxed payment.
    public let taxCalculation: AccountFee
    /// Charged when Whop collects and remits tax on the account's behalf.
    public let taxService: AccountFee
    /// Charged when a payment is authenticated with 3-D Secure.
    public let threeDs: AccountFee
    /// Charged on transfers from the account's balance to another Whop balance.
    public let transfers: AccountFee
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        achDispute: AccountFee,
        achReturn: AccountFee,
        bankDeposit: AccountFee,
        billing: AccountFee,
        buyer: AccountFee,
        cardProcessing: AccountFee,
        childMarkups: Nullable<AccountFeeMarkups>,
        coveredPayoutFees: AccountCoveredPayoutFees,
        crossBorder: AccountFee,
        dispute: AccountFee,
        disputeAlert: AccountFee,
        disputeAlertCdrn: AccountFee,
        disputeAlertEthoca: AccountFee,
        disputeAlertRdr: AccountFee,
        disputeRepresentment: AccountFee,
        foreignExchange: AccountFee,
        fraudScreening: AccountFee,
        highRisk: AccountFee,
        marketplace: AccountFee,
        markups: Nullable<AccountFeeMarkups>,
        orchestration: AccountFee,
        parentAccountId: Nullable<String>,
        paymentMethods: [String: AccountFee],
        payouts: [String: AccountFee],
        pendingAutoTopup: AccountFee,
        platformProcessing: AccountFee,
        poolPayout: AccountFee,
        revshare: AccountFee,
        sepaDispute: AccountFee,
        sepaReturn: AccountFee,
        taxCalculation: AccountFee,
        taxService: AccountFee,
        threeDs: AccountFee,
        transfers: AccountFee,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.achDispute = achDispute
        self.achReturn = achReturn
        self.bankDeposit = bankDeposit
        self.billing = billing
        self.buyer = buyer
        self.cardProcessing = cardProcessing
        self.childMarkups = childMarkups
        self.coveredPayoutFees = coveredPayoutFees
        self.crossBorder = crossBorder
        self.dispute = dispute
        self.disputeAlert = disputeAlert
        self.disputeAlertCdrn = disputeAlertCdrn
        self.disputeAlertEthoca = disputeAlertEthoca
        self.disputeAlertRdr = disputeAlertRdr
        self.disputeRepresentment = disputeRepresentment
        self.foreignExchange = foreignExchange
        self.fraudScreening = fraudScreening
        self.highRisk = highRisk
        self.marketplace = marketplace
        self.markups = markups
        self.orchestration = orchestration
        self.parentAccountId = parentAccountId
        self.paymentMethods = paymentMethods
        self.payouts = payouts
        self.pendingAutoTopup = pendingAutoTopup
        self.platformProcessing = platformProcessing
        self.poolPayout = poolPayout
        self.revshare = revshare
        self.sepaDispute = sepaDispute
        self.sepaReturn = sepaReturn
        self.taxCalculation = taxCalculation
        self.taxService = taxService
        self.threeDs = threeDs
        self.transfers = transfers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.achDispute = try container.decode(AccountFee.self, forKey: .achDispute)
        self.achReturn = try container.decode(AccountFee.self, forKey: .achReturn)
        self.bankDeposit = try container.decode(AccountFee.self, forKey: .bankDeposit)
        self.billing = try container.decode(AccountFee.self, forKey: .billing)
        self.buyer = try container.decode(AccountFee.self, forKey: .buyer)
        self.cardProcessing = try container.decode(AccountFee.self, forKey: .cardProcessing)
        self.childMarkups = try container.decode(Nullable<AccountFeeMarkups>.self, forKey: .childMarkups)
        self.coveredPayoutFees = try container.decode(AccountCoveredPayoutFees.self, forKey: .coveredPayoutFees)
        self.crossBorder = try container.decode(AccountFee.self, forKey: .crossBorder)
        self.dispute = try container.decode(AccountFee.self, forKey: .dispute)
        self.disputeAlert = try container.decode(AccountFee.self, forKey: .disputeAlert)
        self.disputeAlertCdrn = try container.decode(AccountFee.self, forKey: .disputeAlertCdrn)
        self.disputeAlertEthoca = try container.decode(AccountFee.self, forKey: .disputeAlertEthoca)
        self.disputeAlertRdr = try container.decode(AccountFee.self, forKey: .disputeAlertRdr)
        self.disputeRepresentment = try container.decode(AccountFee.self, forKey: .disputeRepresentment)
        self.foreignExchange = try container.decode(AccountFee.self, forKey: .foreignExchange)
        self.fraudScreening = try container.decode(AccountFee.self, forKey: .fraudScreening)
        self.highRisk = try container.decode(AccountFee.self, forKey: .highRisk)
        self.marketplace = try container.decode(AccountFee.self, forKey: .marketplace)
        self.markups = try container.decode(Nullable<AccountFeeMarkups>.self, forKey: .markups)
        self.orchestration = try container.decode(AccountFee.self, forKey: .orchestration)
        self.parentAccountId = try container.decode(Nullable<String>.self, forKey: .parentAccountId)
        self.paymentMethods = try container.decode([String: AccountFee].self, forKey: .paymentMethods)
        self.payouts = try container.decode([String: AccountFee].self, forKey: .payouts)
        self.pendingAutoTopup = try container.decode(AccountFee.self, forKey: .pendingAutoTopup)
        self.platformProcessing = try container.decode(AccountFee.self, forKey: .platformProcessing)
        self.poolPayout = try container.decode(AccountFee.self, forKey: .poolPayout)
        self.revshare = try container.decode(AccountFee.self, forKey: .revshare)
        self.sepaDispute = try container.decode(AccountFee.self, forKey: .sepaDispute)
        self.sepaReturn = try container.decode(AccountFee.self, forKey: .sepaReturn)
        self.taxCalculation = try container.decode(AccountFee.self, forKey: .taxCalculation)
        self.taxService = try container.decode(AccountFee.self, forKey: .taxService)
        self.threeDs = try container.decode(AccountFee.self, forKey: .threeDs)
        self.transfers = try container.decode(AccountFee.self, forKey: .transfers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.achDispute, forKey: .achDispute)
        try container.encode(self.achReturn, forKey: .achReturn)
        try container.encode(self.bankDeposit, forKey: .bankDeposit)
        try container.encode(self.billing, forKey: .billing)
        try container.encode(self.buyer, forKey: .buyer)
        try container.encode(self.cardProcessing, forKey: .cardProcessing)
        try container.encode(self.childMarkups, forKey: .childMarkups)
        try container.encode(self.coveredPayoutFees, forKey: .coveredPayoutFees)
        try container.encode(self.crossBorder, forKey: .crossBorder)
        try container.encode(self.dispute, forKey: .dispute)
        try container.encode(self.disputeAlert, forKey: .disputeAlert)
        try container.encode(self.disputeAlertCdrn, forKey: .disputeAlertCdrn)
        try container.encode(self.disputeAlertEthoca, forKey: .disputeAlertEthoca)
        try container.encode(self.disputeAlertRdr, forKey: .disputeAlertRdr)
        try container.encode(self.disputeRepresentment, forKey: .disputeRepresentment)
        try container.encode(self.foreignExchange, forKey: .foreignExchange)
        try container.encode(self.fraudScreening, forKey: .fraudScreening)
        try container.encode(self.highRisk, forKey: .highRisk)
        try container.encode(self.marketplace, forKey: .marketplace)
        try container.encode(self.markups, forKey: .markups)
        try container.encode(self.orchestration, forKey: .orchestration)
        try container.encode(self.parentAccountId, forKey: .parentAccountId)
        try container.encode(self.paymentMethods, forKey: .paymentMethods)
        try container.encode(self.payouts, forKey: .payouts)
        try container.encode(self.pendingAutoTopup, forKey: .pendingAutoTopup)
        try container.encode(self.platformProcessing, forKey: .platformProcessing)
        try container.encode(self.poolPayout, forKey: .poolPayout)
        try container.encode(self.revshare, forKey: .revshare)
        try container.encode(self.sepaDispute, forKey: .sepaDispute)
        try container.encode(self.sepaReturn, forKey: .sepaReturn)
        try container.encode(self.taxCalculation, forKey: .taxCalculation)
        try container.encode(self.taxService, forKey: .taxService)
        try container.encode(self.threeDs, forKey: .threeDs)
        try container.encode(self.transfers, forKey: .transfers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case achDispute = "ach_dispute"
        case achReturn = "ach_return"
        case bankDeposit = "bank_deposit"
        case billing
        case buyer
        case cardProcessing = "card_processing"
        case childMarkups = "child_markups"
        case coveredPayoutFees = "covered_payout_fees"
        case crossBorder = "cross_border"
        case dispute
        case disputeAlert = "dispute_alert"
        case disputeAlertCdrn = "dispute_alert_cdrn"
        case disputeAlertEthoca = "dispute_alert_ethoca"
        case disputeAlertRdr = "dispute_alert_rdr"
        case disputeRepresentment = "dispute_representment"
        case foreignExchange = "foreign_exchange"
        case fraudScreening = "fraud_screening"
        case highRisk = "high_risk"
        case marketplace
        case markups
        case orchestration
        case parentAccountId = "parent_account_id"
        case paymentMethods = "payment_methods"
        case payouts
        case pendingAutoTopup = "pending_auto_topup"
        case platformProcessing = "platform_processing"
        case poolPayout = "pool_payout"
        case revshare
        case sepaDispute = "sepa_dispute"
        case sepaReturn = "sepa_return"
        case taxCalculation = "tax_calculation"
        case taxService = "tax_service"
        case threeDs = "three_ds"
        case transfers
    }
}