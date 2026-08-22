import Foundation

public struct PaymentQrInstructions: Codable, Hashable, Sendable {
    /// The code to show.
    public let qr: PaymentQr
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        qr: PaymentQr,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.qr = qr
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.qr = try container.decode(PaymentQr.self, forKey: .qr)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.qr, forKey: .qr)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case qr
    }
}