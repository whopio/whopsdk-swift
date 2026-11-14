import Foundation

public enum CreateTransfersRequestBody: Codable, Hashable, Sendable {
    /// Moves credit between two Whop balances and returns a `transfer`. The transfer can come back `processing` and reach `succeeded` or `failed` asynchronously, usually within seconds.
    case balance(CreateTransfersRequestBodyBalance)
    /// Funds a shareable link anyone with the URL can redeem and returns a `claim_link`.
    case claimLink(CreateTransfersRequestBodyClaimLink)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "balance":
            self = .balance(try CreateTransfersRequestBodyBalance(from: decoder))
        case "claim_link":
            self = .claimLink(try CreateTransfersRequestBodyClaimLink(from: decoder))
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
        case .balance(let data):
            try container.encode("balance", forKey: .type)
            try data.encode(to: encoder)
        case .claimLink(let data):
            try container.encode("claim_link", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}