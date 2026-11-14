import Foundation

public struct ShipmentLookup: Codable, Hashable, Sendable {
    /// The matching payment, prefixed `pay_`.
    public let paymentId: String
    /// The payment's latest shipment, or `null` when a paid physical purchase has no tracking yet.
    public let shipment: Nullable<Shipment>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        paymentId: String,
        shipment: Nullable<Shipment>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.paymentId = paymentId
        self.shipment = shipment
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.paymentId = try container.decode(String.self, forKey: .paymentId)
        self.shipment = try container.decode(Nullable<Shipment>.self, forKey: .shipment)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.shipment, forKey: .shipment)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case paymentId = "payment_id"
        case shipment
    }
}