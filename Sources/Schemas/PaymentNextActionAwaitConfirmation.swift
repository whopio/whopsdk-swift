import Foundation

public struct PaymentNextActionAwaitConfirmation: Codable, Hashable, Sendable {
    /// How long the wait can last.
    public let data: PaymentNextActionAwaitConfirmationData
    public let render: [PaymentNextActionAwaitConfirmationRenderItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: PaymentNextActionAwaitConfirmationData,
        render: [PaymentNextActionAwaitConfirmationRenderItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.render = render
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(PaymentNextActionAwaitConfirmationData.self, forKey: .data)
        self.render = try container.decode([PaymentNextActionAwaitConfirmationRenderItem].self, forKey: .render)
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