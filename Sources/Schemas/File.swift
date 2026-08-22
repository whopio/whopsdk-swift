import Foundation

/// A file that has been uploaded or is pending upload.
public struct File: Codable, Hashable, Sendable {
    /// The MIME type of the uploaded file (e.g., image/jpeg, video/mp4, audio/mpeg).
    public let contentType: Nullable<String>
    /// The original filename of the uploaded file, including its file extension.
    public let filename: Nullable<String>
    /// The unique identifier for the file.
    public let id: String
    /// The file size in bytes. Null if the file has not finished uploading.
    public let size: Nullable<String>
    /// The current upload status of the file (e.g., pending, ready).
    public let uploadStatus: UploadStatuses
    /// The URL for accessing the file. For public files, this is a permanent CDN URL. For private files, this is a signed URL that expires. Null if the file has not finished uploading.
    public let url: Nullable<String>
    /// Whether the file is publicly accessible or requires authentication.
    public let visibility: FileVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<String>,
        filename: Nullable<String>,
        id: String,
        size: Nullable<String>,
        uploadStatus: UploadStatuses,
        url: Nullable<String>,
        visibility: FileVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.filename = filename
        self.id = id
        self.size = size
        self.uploadStatus = uploadStatus
        self.url = url
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.id = try container.decode(String.self, forKey: .id)
        self.size = try container.decode(Nullable<String>.self, forKey: .size)
        self.uploadStatus = try container.decode(UploadStatuses.self, forKey: .uploadStatus)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.visibility = try container.decode(FileVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.uploadStatus, forKey: .uploadStatus)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case filename
        case id
        case size
        case uploadStatus = "upload_status"
        case url
        case visibility
    }
}