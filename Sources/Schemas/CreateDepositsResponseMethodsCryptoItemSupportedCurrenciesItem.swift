import Foundation

public struct CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem: Codable, Hashable, Sendable {
    /// Token icon URL. Null when no icon is available.
    public let iconUrl: Nullable<String>
    /// Token symbol.
    public let name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        iconUrl: Nullable<String>,
        name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.iconUrl = iconUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.name = try container.decode(CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case iconUrl = "icon_url"
        case name
    }
}