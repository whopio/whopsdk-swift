import Foundation

public enum CreateTransfersResponse: Codable, Hashable, Sendable {
    /// Returned for a claim_link: a shareable URL anyone can open to claim the funds.
    case claimLink(CreateTransfersResponseClaimLink)
    /// Returned for a wallet_send: an onchain USDT send to a recipient.
    case send(CreateTransfersResponseSend)
    /// A transfer of credit between two ledger accounts.
    case transfer(CreateTransfersResponseTransfer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "claim_link":
            self = .claimLink(try CreateTransfersResponseClaimLink(from: decoder))
        case "send":
            self = .send(try CreateTransfersResponseSend(from: decoder))
        case "transfer":
            self = .transfer(try CreateTransfersResponseTransfer(from: decoder))
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
        case .claimLink(let data):
            try container.encode("claim_link", forKey: .object)
            try data.encode(to: encoder)
        case .send(let data):
            try container.encode("send", forKey: .object)
            try data.encode(to: encoder)
        case .transfer(let data):
            try container.encode("transfer", forKey: .object)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
    }
}