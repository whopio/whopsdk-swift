import Foundation

public struct MediaAsset: Codable, Hashable, Sendable {
    /// USD amount charged to the account's balance for this generation. `null` if the generation wasn't billed.
    public let amountCharged: Nullable<Double>
    /// ISO 8601 timestamp when the asset reached a terminal state. `null` while `processing`.
    public let completedAt: Nullable<String>
    /// ISO 8601 timestamp when the generation was requested.
    public let createdAt: String
    /// Currency of `amount_charged`. Always `usd`.
    public let currency: String
    /// Why generation failed. `null` unless status is `failed`.
    public let errorMessage: Nullable<String>
    /// The produced file, usable anywhere attachments are accepted. `null` until the asset is `ready`.
    public let file: Nullable<MediaAssetFile>
    /// The inputs the asset was generated from.
    public let generation: MediaAssetGeneration
    /// Media asset ID, prefixed `media_`.
    public let id: String
    /// The kind of media this asset holds.
    public let mediaType: MediaAssetMediaType
    /// How the asset was created. Always `generated`.
    public let source: MediaAssetSource
    /// Lifecycle state: `processing` while generation runs, `ready` when the file is available, `failed` when generation failed and the charge was refunded.
    public let status: MediaAssetStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountCharged: Nullable<Double>,
        completedAt: Nullable<String>,
        createdAt: String,
        currency: String,
        errorMessage: Nullable<String>,
        file: Nullable<MediaAssetFile>,
        generation: MediaAssetGeneration,
        id: String,
        mediaType: MediaAssetMediaType,
        source: MediaAssetSource,
        status: MediaAssetStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountCharged = amountCharged
        self.completedAt = completedAt
        self.createdAt = createdAt
        self.currency = currency
        self.errorMessage = errorMessage
        self.file = file
        self.generation = generation
        self.id = id
        self.mediaType = mediaType
        self.source = source
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountCharged = try container.decode(Nullable<Double>.self, forKey: .amountCharged)
        self.completedAt = try container.decode(Nullable<String>.self, forKey: .completedAt)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.file = try container.decode(Nullable<MediaAssetFile>.self, forKey: .file)
        self.generation = try container.decode(MediaAssetGeneration.self, forKey: .generation)
        self.id = try container.decode(String.self, forKey: .id)
        self.mediaType = try container.decode(MediaAssetMediaType.self, forKey: .mediaType)
        self.source = try container.decode(MediaAssetSource.self, forKey: .source)
        self.status = try container.decode(MediaAssetStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amountCharged, forKey: .amountCharged)
        try container.encode(self.completedAt, forKey: .completedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.file, forKey: .file)
        try container.encode(self.generation, forKey: .generation)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.mediaType, forKey: .mediaType)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountCharged = "amount_charged"
        case completedAt = "completed_at"
        case createdAt = "created_at"
        case currency
        case errorMessage = "error_message"
        case file
        case generation
        case id
        case mediaType = "media_type"
        case source
        case status
    }
}