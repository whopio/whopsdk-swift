import Foundation

/// Who to enroll: up to 1,000 member IDs, or an object of `GET /members` filters. An empty object enrolls every member.
public enum TriggerAutomationsRequestMembers: Codable, Hashable, Sendable {
    /// Member IDs, prefixed `mber_`.
    case stringArray([String])
    /// Filters with the names and meaning of `GET /members` query parameters: `access_level`, `status`, `most_recent_actions`, `membership_status`, `product_ids`, `variant_ids`, `promo_code_ids`, `user_ids`, `query`, `created_before`, and `created_after`.
    case stringToJsonValueDictionary([String: JSONValue])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([String].self) {
            self = .stringArray(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .stringToJsonValueDictionary(value)
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
        case .stringArray(let value):
            try container.encode(value)
        case .stringToJsonValueDictionary(let value):
            try container.encode(value)
        }
    }
}