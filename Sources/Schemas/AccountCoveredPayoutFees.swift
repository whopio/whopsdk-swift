import Foundation

public struct AccountCoveredPayoutFees: Codable, Hashable, Sendable {
    /// Whether this account pays payout fees for all of its subaccounts' payout methods. Turning this off clears category coverage.
    public let all: Bool
    /// Whether this account covers its subaccounts' bank wire payout fees. Individual changes have no effect while `all` is true.
    public let bankWire: Bool
    /// Whether this account covers its subaccounts' crypto payout fees. Individual changes have no effect while `all` is true.
    public let crypto: Bool
    /// Whether this account covers its subaccounts' digital wallet payout fees. Individual changes have no effect while `all` is true.
    public let digitalWallet: Bool
    /// Whether this account covers its subaccounts' next day bank payout fees. Individual changes have no effect while `all` is true.
    public let nextDayBank: Bool
    /// Whether this account covers its subaccounts' real-time payment payout fees. Individual changes have no effect while `all` is true.
    public let rtp: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        all: Bool,
        bankWire: Bool,
        crypto: Bool,
        digitalWallet: Bool,
        nextDayBank: Bool,
        rtp: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.all = all
        self.bankWire = bankWire
        self.crypto = crypto
        self.digitalWallet = digitalWallet
        self.nextDayBank = nextDayBank
        self.rtp = rtp
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.all = try container.decode(Bool.self, forKey: .all)
        self.bankWire = try container.decode(Bool.self, forKey: .bankWire)
        self.crypto = try container.decode(Bool.self, forKey: .crypto)
        self.digitalWallet = try container.decode(Bool.self, forKey: .digitalWallet)
        self.nextDayBank = try container.decode(Bool.self, forKey: .nextDayBank)
        self.rtp = try container.decode(Bool.self, forKey: .rtp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.all, forKey: .all)
        try container.encode(self.bankWire, forKey: .bankWire)
        try container.encode(self.crypto, forKey: .crypto)
        try container.encode(self.digitalWallet, forKey: .digitalWallet)
        try container.encode(self.nextDayBank, forKey: .nextDayBank)
        try container.encode(self.rtp, forKey: .rtp)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case all
        case bankWire = "bank_wire"
        case crypto
        case digitalWallet = "digital_wallet"
        case nextDayBank = "next_day_bank"
        case rtp
    }
}