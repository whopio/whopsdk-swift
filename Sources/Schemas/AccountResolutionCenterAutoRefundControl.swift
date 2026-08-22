import Foundation

public struct AccountResolutionCenterAutoRefundControl: Codable, Hashable, Sendable {
    /// Maximum card-funded resolution center case amount automatically refunded in USD. `null` when automatic refunds are disabled for cards.
    public let cardThresholdUsd: Nullable<Double>
    /// Maximum financing-funded resolution center case amount automatically refunded in USD. `null` when automatic refunds are disabled for financing.
    public let financingThresholdUsd: Nullable<Double>
    /// Whether the account owner is prevented from changing these thresholds.
    public let locked: Bool
    /// Maximum PayPal-funded resolution center case amount automatically refunded in USD. `null` when automatic refunds are disabled for PayPal.
    public let paypalThresholdUsd: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardThresholdUsd: Nullable<Double>,
        financingThresholdUsd: Nullable<Double>,
        locked: Bool,
        paypalThresholdUsd: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardThresholdUsd = cardThresholdUsd
        self.financingThresholdUsd = financingThresholdUsd
        self.locked = locked
        self.paypalThresholdUsd = paypalThresholdUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardThresholdUsd = try container.decode(Nullable<Double>.self, forKey: .cardThresholdUsd)
        self.financingThresholdUsd = try container.decode(Nullable<Double>.self, forKey: .financingThresholdUsd)
        self.locked = try container.decode(Bool.self, forKey: .locked)
        self.paypalThresholdUsd = try container.decode(Nullable<Double>.self, forKey: .paypalThresholdUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardThresholdUsd, forKey: .cardThresholdUsd)
        try container.encode(self.financingThresholdUsd, forKey: .financingThresholdUsd)
        try container.encode(self.locked, forKey: .locked)
        try container.encode(self.paypalThresholdUsd, forKey: .paypalThresholdUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardThresholdUsd = "card_threshold_usd"
        case financingThresholdUsd = "financing_threshold_usd"
        case locked
        case paypalThresholdUsd = "paypal_threshold_usd"
    }
}