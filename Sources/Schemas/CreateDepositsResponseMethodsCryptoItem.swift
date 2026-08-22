import Foundation

public struct CreateDepositsResponseMethodsCryptoItem: Codable, Hashable, Sendable {
    /// Address to send funds to on this network. Null when the provider has not issued one yet.
    public let depositAddress: Nullable<String>
    /// Network icon URL.
    public let iconUrl: Nullable<String>
    /// Network display name.
    public let name: CreateDepositsResponseMethodsCryptoItemName
    /// Tokens accepted for deposit on this network.
    public let supportedCurrencies: [CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        depositAddress: Nullable<String>,
        iconUrl: Nullable<String>,
        name: CreateDepositsResponseMethodsCryptoItemName,
        supportedCurrencies: [CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.depositAddress = depositAddress
        self.iconUrl = iconUrl
        self.name = name
        self.supportedCurrencies = supportedCurrencies
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.depositAddress = try container.decode(Nullable<String>.self, forKey: .depositAddress)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.name = try container.decode(CreateDepositsResponseMethodsCryptoItemName.self, forKey: .name)
        self.supportedCurrencies = try container.decode([CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem].self, forKey: .supportedCurrencies)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.depositAddress, forKey: .depositAddress)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.supportedCurrencies, forKey: .supportedCurrencies)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case depositAddress = "deposit_address"
        case iconUrl = "icon_url"
        case name
        case supportedCurrencies = "supported_currencies"
    }
}