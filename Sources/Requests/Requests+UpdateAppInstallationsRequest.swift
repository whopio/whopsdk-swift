import Foundation

extension Requests {
    public struct UpdateAppInstallationsRequest: Codable, Hashable, Sendable {
        /// Your app's own identifier for this installation, such as the ID of the linked account in another system, or `null` when none is set. At most 255 characters and unique across your app's installations, so you can find an installation with `GET /app_installations?external_id=`; setting one another installation already has returns a `409`. Only the app and its developer see it; for the account the app is installed on it is always `null`.
        public let externalId: Nullable<String>?
        /// Metadata keys to set, as string values. A key set to `null` is removed and keys you leave out don't change; an empty object clears every key. At most 50 keys; keys are at most 100 characters and values at most 500.
        public let metadata: [String: Nullable<String>]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            externalId: Nullable<String>? = nil,
            metadata: [String: Nullable<String>]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.externalId = externalId
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
            self.metadata = try container.decodeIfPresent([String: Nullable<String>].self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case externalId = "external_id"
            case metadata
        }
    }
}