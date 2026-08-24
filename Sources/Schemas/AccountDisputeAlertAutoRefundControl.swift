import Foundation

public struct AccountDisputeAlertAutoRefundControl: Codable, Hashable, Sendable {
    /// Whether the account owner is prevented from changing this threshold.
    public let locked: Bool
    /// Maximum dispute alert amount automatically refunded in USD. `null` when automatic refunds are disabled.
    public let thresholdUsd: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        locked: Bool,
        thresholdUsd: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.locked = locked
        self.thresholdUsd = thresholdUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.locked = try container.decode(Bool.self, forKey: .locked)
        self.thresholdUsd = try container.decode(Nullable<Double>.self, forKey: .thresholdUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.locked, forKey: .locked)
        try container.encode(self.thresholdUsd, forKey: .thresholdUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case locked
        case thresholdUsd = "threshold_usd"
    }
}