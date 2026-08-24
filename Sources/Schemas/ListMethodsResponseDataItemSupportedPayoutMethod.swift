import Foundation

/// The supported payout method this saved method was created from.
public struct ListMethodsResponseDataItemSupportedPayoutMethod: Codable, Hashable, Sendable {
    /// ISO 3166-1 alpha-3 country the destination pays out to.
    public let countryCode: Nullable<String>
    /// How funds are delivered.
    public let deliveryType: ListMethodsResponseDataItemSupportedPayoutMethodDeliveryType
    /// Supported payout method icon URL.
    public let iconUrl: Nullable<String>
    /// Supported payout method display name.
    public let name: Nullable<String>
    public let supportsInstantDelivery: Bool
    /// Whether the payer can link this method by signing in to their bank instead of typing account details.
    public let supportsPlaid: Bool
    public let supportsStandardDelivery: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        countryCode: Nullable<String>,
        deliveryType: ListMethodsResponseDataItemSupportedPayoutMethodDeliveryType,
        iconUrl: Nullable<String>,
        name: Nullable<String>,
        supportsInstantDelivery: Bool,
        supportsPlaid: Bool,
        supportsStandardDelivery: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.countryCode = countryCode
        self.deliveryType = deliveryType
        self.iconUrl = iconUrl
        self.name = name
        self.supportsInstantDelivery = supportsInstantDelivery
        self.supportsPlaid = supportsPlaid
        self.supportsStandardDelivery = supportsStandardDelivery
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countryCode = try container.decode(Nullable<String>.self, forKey: .countryCode)
        self.deliveryType = try container.decode(ListMethodsResponseDataItemSupportedPayoutMethodDeliveryType.self, forKey: .deliveryType)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.supportsInstantDelivery = try container.decode(Bool.self, forKey: .supportsInstantDelivery)
        self.supportsPlaid = try container.decode(Bool.self, forKey: .supportsPlaid)
        self.supportsStandardDelivery = try container.decode(Bool.self, forKey: .supportsStandardDelivery)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.deliveryType, forKey: .deliveryType)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.supportsInstantDelivery, forKey: .supportsInstantDelivery)
        try container.encode(self.supportsPlaid, forKey: .supportsPlaid)
        try container.encode(self.supportsStandardDelivery, forKey: .supportsStandardDelivery)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case countryCode = "country_code"
        case deliveryType = "delivery_type"
        case iconUrl = "icon_url"
        case name
        case supportsInstantDelivery = "supports_instant_delivery"
        case supportsPlaid = "supports_plaid"
        case supportsStandardDelivery = "supports_standard_delivery"
    }
}