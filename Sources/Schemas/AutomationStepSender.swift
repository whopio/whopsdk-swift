import Foundation

/// Who a step's message comes from. `object` picks the shape: an `email_address` for an `email` step, a `user` on the team for a `message` step.
public enum AutomationStepSender: Codable, Hashable, Sendable {
    case emailAddress(AutomationStepEmailAddressSender)
    case user(AutomationStepUserSender)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "email_address":
            self = .emailAddress(try AutomationStepEmailAddressSender(from: decoder))
        case "user":
            self = .user(try AutomationStepUserSender(from: decoder))
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
        case .emailAddress(let data):
            try container.encode("email_address", forKey: .object)
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