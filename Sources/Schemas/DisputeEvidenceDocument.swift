import Foundation

public struct DisputeEvidenceDocument: Codable, Hashable, Sendable {
    /// BlurHash placeholder for an image or video. Null when unavailable or removed by moderation.
    public let blurhash: Nullable<String>
    /// The uploaded file's MIME type. Uploads are restricted to the types the processor accepts, and rejected without one — never null.
    public let contentType: Nullable<DisputeEvidenceDocumentContentType>
    /// When the file was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// What this document proves. `return_policy`, `cancellation_policy` and `terms_of_service` are the seller's policy documents. A policy document replaces the account's copy for this dispute. `return_policy`, `cancellation_policy` and `customer_communication` also replace the matching fixed evidence slot. `shipping_policy` is the seller's shipping terms. `customer_communication` is correspondence with the buyer, such as a support thread or chat log. `product_image` is a photo of the product or service the buyer received. `physical_fulfillment` is proof that a physical order shipped and arrived. `digital_fulfillment` is proof that the buyer accessed a digital product. `customer_order_history` is the buyer's past orders with this seller. `prior_transactions` is the buyer's payment history across the platform, for a fraud defense. `customer_session` is checkout data, such as IP address, device fingerprint, AVS and CVV results, and the 3D Secure result. `subscription` is membership lifecycle evidence, such as renewals, cancellation and reminders sent. `complete_evidence` is the seller's whole response as one PDF of at most 19 pages, and it must be the only document. Whop sends a `complete_evidence` document to the processor in place of every other evidence field, attachment and document.
    public let documentType: DisputeEvidenceDocumentDocumentType
    /// Audio or video duration in seconds. Null when unavailable or removed by moderation.
    public let durationSeconds: Nullable<Double>
    /// The original filename, including its extension.
    public let filename: Nullable<String>
    /// Image or video height in pixels. Null when unavailable or removed by moderation.
    public let height: Nullable<Int>
    /// The file's ID, prefixed `file_`.
    public let id: String
    /// The byte size each part (except the last) must be. Present only on create, and only for multipart uploads.
    public let multipartChunkSize: Nullable<Int>?
    /// The ID of the multipart upload, passed back to `complete`. Present only on create, and only for multipart uploads.
    public let multipartUploadId: Nullable<String>?
    public let multipartUploadUrls: Nullable<[FileMultipartUrl]>?
    /// The type of this object, always `file`.
    public let object: String
    /// Whether moderation removed the file. When `true`, `url` serves a replacement image. `filename`, `size` and `content_type` still describe the original file.
    public let removedByModeration: Bool
    /// The file size in bytes. `null` until the upload has finished.
    public let size: Nullable<Int>
    /// Headers to send with the upload PUT. Present only on create.
    public let uploadHeaders: [String: JSONValue]?
    /// Where the file is in its upload lifecycle.
    public let uploadStatus: DisputeEvidenceDocumentUploadStatus
    /// Presigned URL to PUT the file's bytes to. Present only on create, and only for single-part uploads.
    public let uploadUrl: Nullable<String>?
    /// A URL to download the file. Public files get a permanent CDN URL, and private files get a signed URL that expires. `null` until the upload has finished. When moderation removes the file, a replacement image URL.
    public let url: Nullable<String>
    /// `public` files are served from an unsigned CDN URL. `private` files are served from a signed URL that expires.
    public let visibility: DisputeEvidenceDocumentVisibility
    /// Audio waveform URL. Null when unavailable or removed by moderation.
    public let waveformUrl: Nullable<String>
    /// Image or video width in pixels. Null when unavailable or removed by moderation.
    public let width: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        blurhash: Nullable<String>,
        contentType: Nullable<DisputeEvidenceDocumentContentType>,
        createdAt: String,
        documentType: DisputeEvidenceDocumentDocumentType,
        durationSeconds: Nullable<Double>,
        filename: Nullable<String>,
        height: Nullable<Int>,
        id: String,
        multipartChunkSize: Nullable<Int>? = nil,
        multipartUploadId: Nullable<String>? = nil,
        multipartUploadUrls: Nullable<[FileMultipartUrl]>? = nil,
        object: String,
        removedByModeration: Bool,
        size: Nullable<Int>,
        uploadHeaders: [String: JSONValue]? = nil,
        uploadStatus: DisputeEvidenceDocumentUploadStatus,
        uploadUrl: Nullable<String>? = nil,
        url: Nullable<String>,
        visibility: DisputeEvidenceDocumentVisibility,
        waveformUrl: Nullable<String>,
        width: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.blurhash = blurhash
        self.contentType = contentType
        self.createdAt = createdAt
        self.documentType = documentType
        self.durationSeconds = durationSeconds
        self.filename = filename
        self.height = height
        self.id = id
        self.multipartChunkSize = multipartChunkSize
        self.multipartUploadId = multipartUploadId
        self.multipartUploadUrls = multipartUploadUrls
        self.object = object
        self.removedByModeration = removedByModeration
        self.size = size
        self.uploadHeaders = uploadHeaders
        self.uploadStatus = uploadStatus
        self.uploadUrl = uploadUrl
        self.url = url
        self.visibility = visibility
        self.waveformUrl = waveformUrl
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blurhash = try container.decode(Nullable<String>.self, forKey: .blurhash)
        self.contentType = try container.decode(Nullable<DisputeEvidenceDocumentContentType>.self, forKey: .contentType)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.documentType = try container.decode(DisputeEvidenceDocumentDocumentType.self, forKey: .documentType)
        self.durationSeconds = try container.decode(Nullable<Double>.self, forKey: .durationSeconds)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.height = try container.decode(Nullable<Int>.self, forKey: .height)
        self.id = try container.decode(String.self, forKey: .id)
        self.multipartChunkSize = try container.decodeNullableIfPresent(Int.self, forKey: .multipartChunkSize)
        self.multipartUploadId = try container.decodeNullableIfPresent(String.self, forKey: .multipartUploadId)
        self.multipartUploadUrls = try container.decodeNullableIfPresent([FileMultipartUrl].self, forKey: .multipartUploadUrls)
        self.object = try container.decode(String.self, forKey: .object)
        self.removedByModeration = try container.decode(Bool.self, forKey: .removedByModeration)
        self.size = try container.decode(Nullable<Int>.self, forKey: .size)
        self.uploadHeaders = try container.decodeIfPresent([String: JSONValue].self, forKey: .uploadHeaders)
        self.uploadStatus = try container.decode(DisputeEvidenceDocumentUploadStatus.self, forKey: .uploadStatus)
        self.uploadUrl = try container.decodeNullableIfPresent(String.self, forKey: .uploadUrl)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.visibility = try container.decode(DisputeEvidenceDocumentVisibility.self, forKey: .visibility)
        self.waveformUrl = try container.decode(Nullable<String>.self, forKey: .waveformUrl)
        self.width = try container.decode(Nullable<Int>.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.blurhash, forKey: .blurhash)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.documentType, forKey: .documentType)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.multipartChunkSize, forKey: .multipartChunkSize)
        try container.encodeNullableIfPresent(self.multipartUploadId, forKey: .multipartUploadId)
        try container.encodeNullableIfPresent(self.multipartUploadUrls, forKey: .multipartUploadUrls)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.removedByModeration, forKey: .removedByModeration)
        try container.encode(self.size, forKey: .size)
        try container.encodeIfPresent(self.uploadHeaders, forKey: .uploadHeaders)
        try container.encode(self.uploadStatus, forKey: .uploadStatus)
        try container.encodeNullableIfPresent(self.uploadUrl, forKey: .uploadUrl)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.visibility, forKey: .visibility)
        try container.encode(self.waveformUrl, forKey: .waveformUrl)
        try container.encode(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case blurhash
        case contentType = "content_type"
        case createdAt = "created_at"
        case documentType = "document_type"
        case durationSeconds = "duration_seconds"
        case filename
        case height
        case id
        case multipartChunkSize = "multipart_chunk_size"
        case multipartUploadId = "multipart_upload_id"
        case multipartUploadUrls = "multipart_upload_urls"
        case object
        case removedByModeration = "removed_by_moderation"
        case size
        case uploadHeaders = "upload_headers"
        case uploadStatus = "upload_status"
        case uploadUrl = "upload_url"
        case url
        case visibility
        case waveformUrl = "waveform_url"
        case width
    }
}