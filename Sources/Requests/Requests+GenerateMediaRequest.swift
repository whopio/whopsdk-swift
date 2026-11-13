import Foundation

extension Requests {
    public struct GenerateMediaRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed `biz_`. Defaults to the account the API key belongs to.
        public let accountId: String?
        /// Video length in seconds. Video only; defaults to 5.
        public let durationSeconds: Int?
        /// What to generate. Up to 2,000 characters.
        public let prompt: String
        /// Optional reference file IDs (`file_` prefixed), up to 4. Images guide the output: for video, a single image seeds the opening frame; multiple images guide subject and style instead. Include one video to remake it: its motion and scene are kept and the images are swapped in. Video only; needs an image and can't be combined with `duration_seconds`. The output matches the video's length, up to 30 seconds, and is billed on it.
        public let referenceMedia: [String]?
        /// Video resolution. Video only; defaults to `1080p`. `1080p` is not supported by Seedance 2.0 Fast or Mini; `4k` is only supported by Seedance 2.0.
        public let resolution: GenerateMediaRequestResolution?
        /// The kind of media to generate.
        public let type: GenerateMediaRequestType
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            durationSeconds: Int? = nil,
            prompt: String,
            referenceMedia: [String]? = nil,
            resolution: GenerateMediaRequestResolution? = nil,
            type: GenerateMediaRequestType,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.durationSeconds = durationSeconds
            self.prompt = prompt
            self.referenceMedia = referenceMedia
            self.resolution = resolution
            self.type = type
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.durationSeconds = try container.decodeIfPresent(Int.self, forKey: .durationSeconds)
            self.prompt = try container.decode(String.self, forKey: .prompt)
            self.referenceMedia = try container.decodeIfPresent([String].self, forKey: .referenceMedia)
            self.resolution = try container.decodeIfPresent(GenerateMediaRequestResolution.self, forKey: .resolution)
            self.type = try container.decode(GenerateMediaRequestType.self, forKey: .type)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.durationSeconds, forKey: .durationSeconds)
            try container.encode(self.prompt, forKey: .prompt)
            try container.encodeIfPresent(self.referenceMedia, forKey: .referenceMedia)
            try container.encodeIfPresent(self.resolution, forKey: .resolution)
            try container.encode(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case durationSeconds = "duration_seconds"
            case prompt
            case referenceMedia = "reference_media"
            case resolution
            case type
        }
    }
}