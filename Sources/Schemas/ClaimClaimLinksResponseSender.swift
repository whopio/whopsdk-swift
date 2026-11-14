import Foundation

/// The public account or user funding the claim link.
public enum ClaimClaimLinksResponseSender: Codable, Hashable, Sendable {
    case account(ClaimClaimLinksResponseSenderAccount)
    case user(ClaimClaimLinksResponseSenderUser)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "account":
            self = .account(try ClaimClaimLinksResponseSenderAccount(from: decoder))
        case "user":
            self = .user(try ClaimClaimLinksResponseSenderUser(from: decoder))
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
        case .account(let data):
            try container.encode("account", forKey: .object)
            try data.encode(to: encoder)
        case .user(let data):
            try container.encode("user", forKey: .object)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
    }
}