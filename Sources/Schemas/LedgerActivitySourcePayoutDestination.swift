import Foundation

/// Payout destination display info (withdrawal sources only).
public struct LedgerActivitySourcePayoutDestination: Codable, Hashable, Sendable {
    public let iconUrl: Nullable<String>?
    public let payerName: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        iconUrl: Nullable<String>? = nil,
        payerName: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.iconUrl = iconUrl
        self.payerName = payerName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iconUrl = try container.decodeNullableIfPresent(String.self, forKey: .iconUrl)
        self.payerName = try container.decodeNullableIfPresent(String.self, forKey: .payerName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.iconUrl, forKey: .iconUrl)
        try container.encodeNullableIfPresent(self.payerName, forKey: .payerName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case iconUrl = "icon_url"
        case payerName = "payer_name"
    }
}