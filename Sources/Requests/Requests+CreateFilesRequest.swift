import Foundation

extension Requests {
    public struct CreateFilesRequest: Codable, Hashable, Sendable {
        /// The file's size in bytes. Required when `multipart` is `true`. Multipart uploads support at most 10,000 parts of 5MB each (about 50 GB).
        public let byteSize: Int?
        /// The name of the file including its extension, e.g. `terms.pdf`.
        public let filename: String
        /// Upload the file in 5MB parts. Required for files larger than 5GB; useful above ~100MB. The file must be larger than 5MB.
        public let multipart: Bool?
        /// `public` files are served via an unsigned CDN URL — use for assets anyone may see. `private` files are served via a signed, expiring URL — use for sensitive documents. Defaults to `private`.
        public let visibility: CreateFilesRequestVisibility?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            byteSize: Int? = nil,
            filename: String,
            multipart: Bool? = nil,
            visibility: CreateFilesRequestVisibility? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.byteSize = byteSize
            self.filename = filename
            self.multipart = multipart
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.byteSize = try container.decodeIfPresent(Int.self, forKey: .byteSize)
            self.filename = try container.decode(String.self, forKey: .filename)
            self.multipart = try container.decodeIfPresent(Bool.self, forKey: .multipart)
            self.visibility = try container.decodeIfPresent(CreateFilesRequestVisibility.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.byteSize, forKey: .byteSize)
            try container.encode(self.filename, forKey: .filename)
            try container.encodeIfPresent(self.multipart, forKey: .multipart)
            try container.encodeIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case byteSize = "byte_size"
            case filename
            case multipart
            case visibility
        }
    }
}