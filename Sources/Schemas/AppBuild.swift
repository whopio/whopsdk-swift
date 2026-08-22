import Foundation

public struct AppBuild: Codable, Hashable, Sendable {
    /// Client-generated checksum of the build file, used to verify file integrity.
    public let checksum: String
    /// When the build was uploaded, as an ISO 8601 timestamp.
    public let createdAt: String
    /// URL to download the uploaded build artifact.
    public let fileUrl: Nullable<String>
    /// App build ID, prefixed `abld_`.
    public let id: String
    /// Whether this build is the currently active production build for its platform.
    public let isProduction: Bool
    /// The target platform for this build.
    public let platform: AppBuildPlatform
    /// Feedback from the reviewer explaining a rejection, or `null` if the build has not been reviewed or was approved.
    public let reviewMessage: Nullable<String>
    /// URL to download the compressed source code archive that produced this build, or `null` when the build was uploaded without a source archive.
    public let sourceUrl: Nullable<String>
    /// The build's review status.
    public let status: AppBuildStatus
    public let supportedAppViewTypes: [AppBuildSupportedAppViewTypesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checksum: String,
        createdAt: String,
        fileUrl: Nullable<String>,
        id: String,
        isProduction: Bool,
        platform: AppBuildPlatform,
        reviewMessage: Nullable<String>,
        sourceUrl: Nullable<String>,
        status: AppBuildStatus,
        supportedAppViewTypes: [AppBuildSupportedAppViewTypesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.checksum = checksum
        self.createdAt = createdAt
        self.fileUrl = fileUrl
        self.id = id
        self.isProduction = isProduction
        self.platform = platform
        self.reviewMessage = reviewMessage
        self.sourceUrl = sourceUrl
        self.status = status
        self.supportedAppViewTypes = supportedAppViewTypes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checksum = try container.decode(String.self, forKey: .checksum)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.fileUrl = try container.decode(Nullable<String>.self, forKey: .fileUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.isProduction = try container.decode(Bool.self, forKey: .isProduction)
        self.platform = try container.decode(AppBuildPlatform.self, forKey: .platform)
        self.reviewMessage = try container.decode(Nullable<String>.self, forKey: .reviewMessage)
        self.sourceUrl = try container.decode(Nullable<String>.self, forKey: .sourceUrl)
        self.status = try container.decode(AppBuildStatus.self, forKey: .status)
        self.supportedAppViewTypes = try container.decode([AppBuildSupportedAppViewTypesItem].self, forKey: .supportedAppViewTypes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.checksum, forKey: .checksum)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.fileUrl, forKey: .fileUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isProduction, forKey: .isProduction)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.reviewMessage, forKey: .reviewMessage)
        try container.encode(self.sourceUrl, forKey: .sourceUrl)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.supportedAppViewTypes, forKey: .supportedAppViewTypes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checksum
        case createdAt = "created_at"
        case fileUrl = "file_url"
        case id
        case isProduction = "is_production"
        case platform
        case reviewMessage = "review_message"
        case sourceUrl = "source_url"
        case status
        case supportedAppViewTypes = "supported_app_view_types"
    }
}