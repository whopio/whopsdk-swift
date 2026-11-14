import Foundation

/// How the account pays for Whop Ads spend. Requires `primary`; `backup` is optional and covers the charge when the primary fails. Requires the `ad_campaign:create` scope on your API key. Configuring a `card` requires a user token; account API keys can configure only `platform_balance` sources.
public struct UpdatePreferencesRequestAdsPaymentMethods: Codable, Hashable, Sendable {
    /// Optional second method charged if the primary fails. Any pairing is allowed (two cards, card+balance, balance+card); omit it to run on a single method. Must differ from the primary.
    public let backup: UpdatePreferencesRequestAdsPaymentMethodsBackup?
    public let primary: UpdatePreferencesRequestAdsPaymentMethodsPrimary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        backup: UpdatePreferencesRequestAdsPaymentMethodsBackup? = nil,
        primary: UpdatePreferencesRequestAdsPaymentMethodsPrimary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.backup = backup
        self.primary = primary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backup = try container.decodeIfPresent(UpdatePreferencesRequestAdsPaymentMethodsBackup.self, forKey: .backup)
        self.primary = try container.decode(UpdatePreferencesRequestAdsPaymentMethodsPrimary.self, forKey: .primary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.backup, forKey: .backup)
        try container.encode(self.primary, forKey: .primary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case backup
        case primary
    }
}