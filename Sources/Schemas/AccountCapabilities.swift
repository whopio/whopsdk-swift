import Foundation

public struct AccountCapabilities: Codable, Hashable, Sendable {
    /// Bank payins: debits, transfers, and local bank rails
    public let acceptBankPayments: AccountCapabilitiesAcceptBankPayments
    /// Buy-now-pay-later payins; requires approval
    public let acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments
    /// Card payins, including Apple Pay and Google Pay
    public let acceptCardPayments: AccountCapabilitiesAcceptCardPayments
    /// Deposits by bank wire or ACH to the account's virtual bank account
    public let bankDeposit: AccountCapabilitiesBankDeposit
    /// Balance top-ups by charging a stored payment method
    public let cardDeposit: AccountCapabilitiesCardDeposit
    /// Issuing Whop cards; requires card application approval
    public let cardIssuing: AccountCapabilitiesCardIssuing
    /// On-chain deposits to the account's crypto wallet
    public let cryptoDeposit: AccountCapabilitiesCryptoDeposit
    /// On-chain payouts to a crypto wallet
    public let cryptoPayout: AccountCapabilitiesCryptoPayout
    /// Instant payouts to an eligible payout destination
    public let instantPayout: AccountCapabilitiesInstantPayout
    /// Launching ad campaigns through Whop Ads. `inactive` until the account's identity or business is verified, while a requested ads services agreement is awaiting the account's signature, and while the account is suspended from Whop Ads.
    public let runAds: AccountCapabilitiesRunAds
    /// Standard payouts to an external payout destination
    public let standardPayout: AccountCapabilitiesStandardPayout
    /// Transfers to other accounts
    public let transfer: AccountCapabilitiesTransfer
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptBankPayments: AccountCapabilitiesAcceptBankPayments,
        acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments,
        acceptCardPayments: AccountCapabilitiesAcceptCardPayments,
        bankDeposit: AccountCapabilitiesBankDeposit,
        cardDeposit: AccountCapabilitiesCardDeposit,
        cardIssuing: AccountCapabilitiesCardIssuing,
        cryptoDeposit: AccountCapabilitiesCryptoDeposit,
        cryptoPayout: AccountCapabilitiesCryptoPayout,
        instantPayout: AccountCapabilitiesInstantPayout,
        runAds: AccountCapabilitiesRunAds,
        standardPayout: AccountCapabilitiesStandardPayout,
        transfer: AccountCapabilitiesTransfer,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptBankPayments = acceptBankPayments
        self.acceptBnplPayments = acceptBnplPayments
        self.acceptCardPayments = acceptCardPayments
        self.bankDeposit = bankDeposit
        self.cardDeposit = cardDeposit
        self.cardIssuing = cardIssuing
        self.cryptoDeposit = cryptoDeposit
        self.cryptoPayout = cryptoPayout
        self.instantPayout = instantPayout
        self.runAds = runAds
        self.standardPayout = standardPayout
        self.transfer = transfer
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptBankPayments = try container.decode(AccountCapabilitiesAcceptBankPayments.self, forKey: .acceptBankPayments)
        self.acceptBnplPayments = try container.decode(AccountCapabilitiesAcceptBnplPayments.self, forKey: .acceptBnplPayments)
        self.acceptCardPayments = try container.decode(AccountCapabilitiesAcceptCardPayments.self, forKey: .acceptCardPayments)
        self.bankDeposit = try container.decode(AccountCapabilitiesBankDeposit.self, forKey: .bankDeposit)
        self.cardDeposit = try container.decode(AccountCapabilitiesCardDeposit.self, forKey: .cardDeposit)
        self.cardIssuing = try container.decode(AccountCapabilitiesCardIssuing.self, forKey: .cardIssuing)
        self.cryptoDeposit = try container.decode(AccountCapabilitiesCryptoDeposit.self, forKey: .cryptoDeposit)
        self.cryptoPayout = try container.decode(AccountCapabilitiesCryptoPayout.self, forKey: .cryptoPayout)
        self.instantPayout = try container.decode(AccountCapabilitiesInstantPayout.self, forKey: .instantPayout)
        self.runAds = try container.decode(AccountCapabilitiesRunAds.self, forKey: .runAds)
        self.standardPayout = try container.decode(AccountCapabilitiesStandardPayout.self, forKey: .standardPayout)
        self.transfer = try container.decode(AccountCapabilitiesTransfer.self, forKey: .transfer)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.acceptBankPayments, forKey: .acceptBankPayments)
        try container.encode(self.acceptBnplPayments, forKey: .acceptBnplPayments)
        try container.encode(self.acceptCardPayments, forKey: .acceptCardPayments)
        try container.encode(self.bankDeposit, forKey: .bankDeposit)
        try container.encode(self.cardDeposit, forKey: .cardDeposit)
        try container.encode(self.cardIssuing, forKey: .cardIssuing)
        try container.encode(self.cryptoDeposit, forKey: .cryptoDeposit)
        try container.encode(self.cryptoPayout, forKey: .cryptoPayout)
        try container.encode(self.instantPayout, forKey: .instantPayout)
        try container.encode(self.runAds, forKey: .runAds)
        try container.encode(self.standardPayout, forKey: .standardPayout)
        try container.encode(self.transfer, forKey: .transfer)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptBankPayments = "accept_bank_payments"
        case acceptBnplPayments = "accept_bnpl_payments"
        case acceptCardPayments = "accept_card_payments"
        case bankDeposit = "bank_deposit"
        case cardDeposit = "card_deposit"
        case cardIssuing = "card_issuing"
        case cryptoDeposit = "crypto_deposit"
        case cryptoPayout = "crypto_payout"
        case instantPayout = "instant_payout"
        case runAds = "run_ads"
        case standardPayout = "standard_payout"
        case transfer
    }
}