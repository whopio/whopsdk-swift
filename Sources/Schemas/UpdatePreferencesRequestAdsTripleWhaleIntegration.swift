import Foundation

/// Connects or disconnects the Triple Whale integration. Requires a connected Shopify store, since Triple Whale keys spend records by Shopify shop.
public struct UpdatePreferencesRequestAdsTripleWhaleIntegration: Codable, Hashable, Sendable {
    /// A Triple Whale Data-In API key with the `Data-In Write: Ads` scope, validated against Triple Whale before it is stored. Pass `null` to disconnect. Connecting for the first time backfills the account's existing ad spend.
    public let apiKey: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(Nullable<String>.self, forKey: .apiKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiKey, forKey: .apiKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey = "api_key"
    }
}