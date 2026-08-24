import Foundation

/// What to show the buyer so they can pay. `kind` picks the shape and the details sit under the key named for it, so switching on `kind` gives you exactly that kind's payload. Every detail field is optional — the rails behind these methods publish them unevenly — but a kind that arrives with `document_url` can always fall back to sending the buyer to that hosted copy of the instructions.
public enum PaymentInstructions: Codable, Hashable, Sendable {
    case bankTransfer(PaymentBankTransferInstructions)
    case qr(PaymentQrInstructions)
    case voucher(PaymentVoucherInstructions)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .kind)
        switch discriminant {
        case "bank_transfer":
            self = .bankTransfer(try PaymentBankTransferInstructions(from: decoder))
        case "qr":
            self = .qr(try PaymentQrInstructions(from: decoder))
        case "voucher":
            self = .voucher(try PaymentVoucherInstructions(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .bankTransfer(let data):
            try container.encode("bank_transfer", forKey: .kind)
            try data.encode(to: encoder)
        case .qr(let data):
            try container.encode("qr", forKey: .kind)
            try data.encode(to: encoder)
        case .voucher(let data):
            try container.encode("voucher", forKey: .kind)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
    }
}