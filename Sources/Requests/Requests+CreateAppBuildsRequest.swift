import Foundation

extension Requests {
    public struct CreateAppBuildsRequest: Codable, Hashable, Sendable {
        /// The AI prompt that generated this build, if applicable.
        public let aiPromptId: String?
        /// The app to create the build for, prefixed `app_`. Defaults to the app behind the presented credential.
        public let appId: String?
        /// The uploaded build file: `{ id }` for an existing file or `{ direct_upload_id }` for a completed direct upload.
        public let attachment: CreateAppBuildsRequestAttachment
        /// A client-generated checksum of the build file, used to verify file integrity when unpacked.
        public let checksum: String
        /// The target platform for the build.
        public let platform: CreateAppBuildsRequestPlatform
        /// An optional compressed archive (.zip or .gz) of the source code that produced this build, stored alongside the build so it can be downloaded later. Referenced like `attachment`, and must be a different file.
        public let sourceAttachment: CreateAppBuildsRequestSourceAttachment?
        /// The view types this build supports. Only list the ones its code implements.
        public let supportedAppViewTypes: [CreateAppBuildsRequestSupportedAppViewTypesItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            aiPromptId: String? = nil,
            appId: String? = nil,
            attachment: CreateAppBuildsRequestAttachment,
            checksum: String,
            platform: CreateAppBuildsRequestPlatform,
            sourceAttachment: CreateAppBuildsRequestSourceAttachment? = nil,
            supportedAppViewTypes: [CreateAppBuildsRequestSupportedAppViewTypesItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.aiPromptId = aiPromptId
            self.appId = appId
            self.attachment = attachment
            self.checksum = checksum
            self.platform = platform
            self.sourceAttachment = sourceAttachment
            self.supportedAppViewTypes = supportedAppViewTypes
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.aiPromptId = try container.decodeIfPresent(String.self, forKey: .aiPromptId)
            self.appId = try container.decodeIfPresent(String.self, forKey: .appId)
            self.attachment = try container.decode(CreateAppBuildsRequestAttachment.self, forKey: .attachment)
            self.checksum = try container.decode(String.self, forKey: .checksum)
            self.platform = try container.decode(CreateAppBuildsRequestPlatform.self, forKey: .platform)
            self.sourceAttachment = try container.decodeIfPresent(CreateAppBuildsRequestSourceAttachment.self, forKey: .sourceAttachment)
            self.supportedAppViewTypes = try container.decodeIfPresent([CreateAppBuildsRequestSupportedAppViewTypesItem].self, forKey: .supportedAppViewTypes)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.aiPromptId, forKey: .aiPromptId)
            try container.encodeIfPresent(self.appId, forKey: .appId)
            try container.encode(self.attachment, forKey: .attachment)
            try container.encode(self.checksum, forKey: .checksum)
            try container.encode(self.platform, forKey: .platform)
            try container.encodeIfPresent(self.sourceAttachment, forKey: .sourceAttachment)
            try container.encodeIfPresent(self.supportedAppViewTypes, forKey: .supportedAppViewTypes)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case aiPromptId = "ai_prompt_id"
            case appId = "app_id"
            case attachment
            case checksum
            case platform
            case sourceAttachment = "source_attachment"
            case supportedAppViewTypes = "supported_app_view_types"
        }
    }
}