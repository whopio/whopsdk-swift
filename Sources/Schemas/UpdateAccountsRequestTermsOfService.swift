import Foundation

/// The account's terms of service document. Attached to new disputes as the cancellation policy evidence when no cancellation policy is set. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
public struct UpdateAccountsRequestTermsOfService: Codable, Hashable, Sendable {
    /// ID of a file from [Create File](/api-reference/files/create-file), prefixed `file_`.
    public let id: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
    }
}