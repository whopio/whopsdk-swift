import Foundation

public struct PaymentVoucherInstructions: Codable, Hashable, Sendable {
    /// The voucher to show.
    public let voucher: PaymentVoucher
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voucher: PaymentVoucher,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voucher = voucher
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voucher = try container.decode(PaymentVoucher.self, forKey: .voucher)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voucher, forKey: .voucher)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voucher
    }
}