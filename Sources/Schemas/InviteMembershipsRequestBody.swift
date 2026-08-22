import Foundation

public enum InviteMembershipsRequestBody: Codable, Hashable, Sendable {
    case inviteMembershipsRequestBodyUserId(InviteMembershipsRequestBodyUserId)
    case inviteMembershipsRequestBodyEmail(InviteMembershipsRequestBodyEmail)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(InviteMembershipsRequestBodyUserId.self) {
            self = .inviteMembershipsRequestBodyUserId(value)
        } else if let value = try? container.decode(InviteMembershipsRequestBodyEmail.self) {
            self = .inviteMembershipsRequestBodyEmail(value)
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
        case .inviteMembershipsRequestBodyUserId(let value):
            try container.encode(value)
        case .inviteMembershipsRequestBodyEmail(let value):
            try container.encode(value)
        }
    }
}