import Foundation

/// Changes to the payout fees this account covers for subaccounts. Send either all or individual category keys. Omitted categories stay unchanged; category changes have no effect while all is true.
public struct UpdateFeesRequestCoveredPayoutFees: Codable, Hashable, Sendable {
    public let all: Bool?
    public let bankWire: Bool?
    public let crypto: Bool?
    public let digitalWallet: Bool?
    public let nextDayBank: Bool?
    public let rtp: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        all: Bool? = nil,
        bankWire: Bool? = nil,
        crypto: Bool? = nil,
        digitalWallet: Bool? = nil,
        nextDayBank: Bool? = nil,
        rtp: Bool? = nil,
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
        self.all = try container.decodeIfPresent(Bool.self, forKey: .all)
        self.bankWire = try container.decodeIfPresent(Bool.self, forKey: .bankWire)
        self.crypto = try container.decodeIfPresent(Bool.self, forKey: .crypto)
        self.digitalWallet = try container.decodeIfPresent(Bool.self, forKey: .digitalWallet)
        self.nextDayBank = try container.decodeIfPresent(Bool.self, forKey: .nextDayBank)
        self.rtp = try container.decodeIfPresent(Bool.self, forKey: .rtp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.all, forKey: .all)
        try container.encodeIfPresent(self.bankWire, forKey: .bankWire)
        try container.encodeIfPresent(self.crypto, forKey: .crypto)
        try container.encodeIfPresent(self.digitalWallet, forKey: .digitalWallet)
        try container.encodeIfPresent(self.nextDayBank, forKey: .nextDayBank)
        try container.encodeIfPresent(self.rtp, forKey: .rtp)
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