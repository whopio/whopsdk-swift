import Foundation

extension Requests {
    public struct CreateFilesRequest: Codable, Hashable, Sendable {
        /// The name of the file including its extension (e.g., "photo.png" or "document.pdf").
        public let filename: String
        /// Controls whether the file is publicly accessible via CDN or requires authentication. Defaults to private.
        public let visibility: Nullable<FileVisibility>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            filename: String,
            visibility: Nullable<FileVisibility>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.filename = filename
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.filename = try container.decode(String.self, forKey: .filename)
            self.visibility = try container.decodeNullableIfPresent(FileVisibility.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.filename, forKey: .filename)
            try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case filename
            case visibility
        }
    }
}