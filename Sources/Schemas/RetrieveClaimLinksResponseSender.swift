import Foundation

/// The public account or user funding the claim link.
public enum RetrieveClaimLinksResponseSender: Codable, Hashable, Sendable {
    case account(RetrieveClaimLinksResponseSenderAccount)
    case user(RetrieveClaimLinksResponseSenderUser)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "account":
            self = .account(try RetrieveClaimLinksResponseSenderAccount(from: decoder))
        case "user":
            self = .user(try RetrieveClaimLinksResponseSenderUser(from: decoder))
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