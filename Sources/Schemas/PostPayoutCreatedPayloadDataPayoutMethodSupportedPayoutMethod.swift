import Foundation

/// Supported payout method display details.
public struct PostPayoutCreatedPayloadDataPayoutMethodSupportedPayoutMethod: Codable, Hashable, Sendable {
    /// How the funds are delivered to the recipient.
    public let deliveryType: PostPayoutCreatedPayloadDataPayoutMethodSupportedPayoutMethodDeliveryType
    /// Supported payout method icon URL.
    public let iconUrl: Nullable<String>
    /// Supported payout method display name.
    public let payerName: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deliveryType: PostPayoutCreatedPayloadDataPayoutMethodSupportedPayoutMethodDeliveryType,
        iconUrl: Nullable<String>,
        payerName: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deliveryType = deliveryType
        self.iconUrl = iconUrl
        self.payerName = payerName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deliveryType = try container.decode(PostPayoutCreatedPayloadDataPayoutMethodSupportedPayoutMethodDeliveryType.self, forKey: .deliveryType)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deliveryType, forKey: .deliveryType)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.payerName, forKey: .payerName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deliveryType = "delivery_type"
        case iconUrl = "icon_url"
        case payerName = "payer_name"
    }
}