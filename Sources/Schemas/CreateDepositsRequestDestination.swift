import Foundation

/// Destination account ID or wallet address. Object form is supported for compatibility. Any business resolves by its account ID without authentication; a user account resolves only for that same authenticated user.
public enum CreateDepositsRequestDestination: Codable, Hashable, Sendable {
    case string(String)
    case createDepositsRequestDestinationAccountId(CreateDepositsRequestDestinationAccountId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(CreateDepositsRequestDestinationAccountId.self) {
            self = .createDepositsRequestDestinationAccountId(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .createDepositsRequestDestinationAccountId(let value):
            try container.encode(value)
        }
    }
}