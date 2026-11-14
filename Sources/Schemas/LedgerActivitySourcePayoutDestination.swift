import Foundation

/// Payout destination display info (payout sources only).
public struct LedgerActivitySourcePayoutDestination: Codable, Hashable, Sendable {
    public let iconUrl: Nullable<String>?
    public let payerName: Nullable<String>?
    /// The security answer the merchant set when adding this payout method (for example an Interac e-Transfer), needed to claim the payout. null when the destination has no custom answer. Requires payout:destination:read.
    public let securityAnswer: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        iconUrl: Nullable<String>? = nil,
        payerName: Nullable<String>? = nil,
        securityAnswer: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.iconUrl = iconUrl
        self.payerName = payerName
        self.securityAnswer = securityAnswer
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iconUrl = try container.decodeNullableIfPresent(String.self, forKey: .iconUrl)
        self.payerName = try container.decodeNullableIfPresent(String.self, forKey: .payerName)
        self.securityAnswer = try container.decodeNullableIfPresent(String.self, forKey: .securityAnswer)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.iconUrl, forKey: .iconUrl)
        try container.encodeNullableIfPresent(self.payerName, forKey: .payerName)
        try container.encodeNullableIfPresent(self.securityAnswer, forKey: .securityAnswer)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case iconUrl = "icon_url"
        case payerName = "payer_name"
        case securityAnswer = "security_answer"
    }
}