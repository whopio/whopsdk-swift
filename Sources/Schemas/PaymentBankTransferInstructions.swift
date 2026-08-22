import Foundation

public struct PaymentBankTransferInstructions: Codable, Hashable, Sendable {
    /// The account details to show.
    public let bankTransfer: PaymentBankTransfer
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bankTransfer: PaymentBankTransfer,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bankTransfer = bankTransfer
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bankTransfer = try container.decode(PaymentBankTransfer.self, forKey: .bankTransfer)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bankTransfer, forKey: .bankTransfer)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bankTransfer = "bank_transfer"
    }
}