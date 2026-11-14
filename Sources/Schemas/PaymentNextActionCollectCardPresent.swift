import Foundation

public struct PaymentNextActionCollectCardPresent: Codable, Hashable, Sendable {
    /// What the Terminal SDK needs to collect this payment.
    public let data: PaymentNextActionCollectCardPresentData
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: PaymentNextActionCollectCardPresentData,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(PaymentNextActionCollectCardPresentData.self, forKey: .data)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
    }
}