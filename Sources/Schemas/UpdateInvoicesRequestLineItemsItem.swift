import Foundation

/// A single line item to include on the invoice, with a label, quantity, and unit price.
public struct UpdateInvoicesRequestLineItemsItem: Codable, Hashable, Sendable {
    /// The label or description for this line item.
    public let label: String
    /// The quantity of this line item. Defaults to 1.
    public let quantity: Nullable<Double>?
    /// The unit price for this line item. Provided as a number in the specified currency. Eg: 10.43 for $10.43
    public let unitPrice: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        label: String,
        quantity: Nullable<Double>? = nil,
        unitPrice: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.label = label
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(String.self, forKey: .label)
        self.quantity = try container.decodeNullableIfPresent(Double.self, forKey: .quantity)
        self.unitPrice = try container.decode(Double.self, forKey: .unitPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.label, forKey: .label)
        try container.encodeNullableIfPresent(self.quantity, forKey: .quantity)
        try container.encode(self.unitPrice, forKey: .unitPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case label
        case quantity
        case unitPrice = "unit_price"
    }
}