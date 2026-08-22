import Foundation

public struct PaymentNextActionDisplayInstructions: Codable, Hashable, Sendable {
    /// The instructions. `kind` picks the shape, and the details sit under the key named for it: `voucher`, `qr`, or `bank_transfer`.
    public let data: PaymentInstructions
    public let render: [PaymentNextActionDisplayInstructionsRenderItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: PaymentInstructions,
        render: [PaymentNextActionDisplayInstructionsRenderItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.render = render
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(PaymentInstructions.self, forKey: .data)
        self.render = try container.decode([PaymentNextActionDisplayInstructionsRenderItem].self, forKey: .render)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.render, forKey: .render)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case render
    }
}