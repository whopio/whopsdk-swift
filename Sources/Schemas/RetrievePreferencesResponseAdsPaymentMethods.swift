import Foundation

/// How the account pays for Whop Ads spend. `primary` is charged first; `backup` covers the charge when the primary fails. `null` until ads billing has been configured.
public struct RetrievePreferencesResponseAdsPaymentMethods: Codable, Hashable, Sendable {
    public let backup: Nullable<RetrievePreferencesResponseAdsPaymentMethodsBackup>
    public let primary: Nullable<RetrievePreferencesResponseAdsPaymentMethodsPrimary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        backup: Nullable<RetrievePreferencesResponseAdsPaymentMethodsBackup>,
        primary: Nullable<RetrievePreferencesResponseAdsPaymentMethodsPrimary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.backup = backup
        self.primary = primary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backup = try container.decode(Nullable<RetrievePreferencesResponseAdsPaymentMethodsBackup>.self, forKey: .backup)
        self.primary = try container.decode(Nullable<RetrievePreferencesResponseAdsPaymentMethodsPrimary>.self, forKey: .primary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.backup, forKey: .backup)
        try container.encode(self.primary, forKey: .primary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case backup
        case primary
    }
}