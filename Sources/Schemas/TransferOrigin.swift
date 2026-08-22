import Foundation

public enum TransferOrigin: Codable, Hashable, Sendable {
    case company(TransferOriginCompany)
    case user(TransferOriginUser)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .typename)
        switch discriminant {
        case "Company":
            self = .company(try TransferOriginCompany(from: decoder))
        case "User":
            self = .user(try TransferOriginUser(from: decoder))
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
        case .company(let data):
            try container.encode("Company", forKey: .typename)
            try data.encode(to: encoder)
        case .user(let data):
            try container.encode("User", forKey: .typename)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case typename
    }
}