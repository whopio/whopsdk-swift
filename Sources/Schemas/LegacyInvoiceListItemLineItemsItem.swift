import Foundation

/// A line item on an invoice, representing a single charge with a label, quantity, and unit price.
public struct LegacyInvoiceListItemLineItemsItem: Codable, Hashable, Sendable {
    /// The label or description for this line item.
    public let label: String
    /// The display order of this line item within the invoice.
    public let position: Int
    /// The quantity of this line item.
    public let quantity: Double
    /// The computed total for this line item (quantity * unit_price).
    public let total: Double
    /// The unit price for this line item. Negative for a credit or deduction.
    public let unitPrice: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        label: String,
        position: Int,
        quantity: Double,
        total: Double,
        unitPrice: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.label = label
        self.position = position
        self.quantity = quantity
        self.total = total
        self.unitPrice = unitPrice
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(String.self, forKey: .label)
        self.position = try container.decode(Int.self, forKey: .position)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.total = try container.decode(Double.self, forKey: .total)
        self.unitPrice = try container.decode(Double.self, forKey: .unitPrice)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.unitPrice, forKey: .unitPrice)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case label
        case position
        case quantity
        case total
        case unitPrice = "unit_price"
    }
}