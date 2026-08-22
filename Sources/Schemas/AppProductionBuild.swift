import Foundation

public struct AppProductionBuild: Codable, Hashable, Sendable {
    /// Client-generated checksum of the build file, used to verify file integrity.
    public let checksum: Nullable<String>
    /// URL to download the uploaded build artifact.
    public let fileUrl: Nullable<String>
    /// App build ID, prefixed `abld_`.
    public let id: String
    /// URL to download the compressed source code archive that produced this build, or `null` when the build was uploaded without a source archive.
    public let sourceUrl: Nullable<String>
    /// The build's review status.
    public let status: AppProductionBuildStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checksum: Nullable<String>,
        fileUrl: Nullable<String>,
        id: String,
        sourceUrl: Nullable<String>,
        status: AppProductionBuildStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.checksum = checksum
        self.fileUrl = fileUrl
        self.id = id
        self.sourceUrl = sourceUrl
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checksum = try container.decode(Nullable<String>.self, forKey: .checksum)
        self.fileUrl = try container.decode(Nullable<String>.self, forKey: .fileUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.sourceUrl = try container.decode(Nullable<String>.self, forKey: .sourceUrl)
        self.status = try container.decode(AppProductionBuildStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.checksum, forKey: .checksum)
        try container.encode(self.fileUrl, forKey: .fileUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.sourceUrl, forKey: .sourceUrl)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checksum
        case fileUrl = "file_url"
        case id
        case sourceUrl = "source_url"
        case status
    }
}