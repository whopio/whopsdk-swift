import Foundation

public struct PaymentNextActionRedirect: Codable, Hashable, Sendable {
    /// Where to send the buyer.
    public let data: PaymentNextActionRedirectData
    public let render: [PaymentNextActionRedirectRenderItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: PaymentNextActionRedirectData,
        render: [PaymentNextActionRedirectRenderItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.render = render
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(PaymentNextActionRedirectData.self, forKey: .data)
        self.render = try container.decode([PaymentNextActionRedirectRenderItem].self, forKey: .render)
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