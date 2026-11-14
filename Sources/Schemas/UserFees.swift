import Foundation

public struct UserFees: Codable, Hashable, Sendable {
    /// Charged on bank deposits into the user's balance.
    public let bankDeposit: AccountFee
    /// Fees on withdrawals, keyed by payout method: `bank_wire`, `same_day_bank`, `next_day_bank`, `rtp`, `crypto`, and `digital_wallet`.
    public let payouts: [String: AccountFee]
    /// Charged when pending, not-yet-settled balance is advanced to fund the user's cards balance.
    public let pendingAutoTopup: AccountFee
    /// Charged on transfers from the user's balance to another Whop balance.
    public let transfers: AccountFee
    /// The user these fees are charged to, prefixed `user_`.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bankDeposit: AccountFee,
        payouts: [String: AccountFee],
        pendingAutoTopup: AccountFee,
        transfers: AccountFee,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bankDeposit = bankDeposit
        self.payouts = payouts
        self.pendingAutoTopup = pendingAutoTopup
        self.transfers = transfers
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bankDeposit = try container.decode(AccountFee.self, forKey: .bankDeposit)
        self.payouts = try container.decode([String: AccountFee].self, forKey: .payouts)
        self.pendingAutoTopup = try container.decode(AccountFee.self, forKey: .pendingAutoTopup)
        self.transfers = try container.decode(AccountFee.self, forKey: .transfers)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bankDeposit, forKey: .bankDeposit)
        try container.encode(self.payouts, forKey: .payouts)
        try container.encode(self.pendingAutoTopup, forKey: .pendingAutoTopup)
        try container.encode(self.transfers, forKey: .transfers)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bankDeposit = "bank_deposit"
        case payouts
        case pendingAutoTopup = "pending_auto_topup"
        case transfers
        case userId = "user_id"
    }
}