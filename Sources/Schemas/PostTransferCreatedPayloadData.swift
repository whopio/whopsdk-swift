import Foundation

/// A transfer between Whop accounts or users.
public struct PostTransferCreatedPayloadData: Codable, Hashable, Sendable {
    /// Amount credited to the recipient. Null while the transfer has not succeeded.
    public let amount: Nullable<Money>
    /// When the transfer was created.
    public let createdAt: Date
    /// Business account or user receiving the transfer.
    public let destination: Nullable<PostTransferCreatedPayloadDataDestination>
    /// Recorded failure time. Null unless the transfer has failed.
    public let failedAt: Nullable<Date>
    /// Machine-readable failure code. Null unless the transfer has failed.
    public let failureCode: Nullable<String>
    /// Failure explanation. Null unless the transfer has failed.
    public let failureReason: Nullable<String>
    /// All applicable transfer fees, including platform markup. Null when the authoritative total is unavailable.
    public let fee: Nullable<Money>
    /// Transfer ID.
    public let id: String
    /// Custom metadata attached to the transfer.
    public let metadata: [String: JSONValue]
    /// Transfer note.
    public let notes: Nullable<String>
    /// The object type.
    public let object: PostTransferCreatedPayloadDataObject
    /// Business account or user sending the transfer.
    public let origin: Nullable<PostTransferCreatedPayloadDataOrigin>
    /// Current transfer status. A transfer can be created `processing` and settle a few seconds later; poll Retrieve Transfer or listen for the `transfer.completed` and `transfer.failed` webhooks instead of treating the create response as final. `succeeded` and `failed` are final.
    public let status: PostTransferCreatedPayloadDataStatus
    /// Recorded time of the current transition. Null when the historical transition time is unknown.
    public let statusChangedAt: Nullable<Date>
    /// Recorded success time. Null when unknown.
    public let succeededAt: Nullable<Date>
    /// Tracking page for the transfer. Viewing it requires sign-in and access to the transfer.
    public let trackingUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Nullable<Money>,
        createdAt: Date,
        destination: Nullable<PostTransferCreatedPayloadDataDestination>,
        failedAt: Nullable<Date>,
        failureCode: Nullable<String>,
        failureReason: Nullable<String>,
        fee: Nullable<Money>,
        id: String,
        metadata: [String: JSONValue],
        notes: Nullable<String>,
        object: PostTransferCreatedPayloadDataObject,
        origin: Nullable<PostTransferCreatedPayloadDataOrigin>,
        status: PostTransferCreatedPayloadDataStatus,
        statusChangedAt: Nullable<Date>,
        succeededAt: Nullable<Date>,
        trackingUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.destination = destination
        self.failedAt = failedAt
        self.failureCode = failureCode
        self.failureReason = failureReason
        self.fee = fee
        self.id = id
        self.metadata = metadata
        self.notes = notes
        self.object = object
        self.origin = origin
        self.status = status
        self.statusChangedAt = statusChangedAt
        self.succeededAt = succeededAt
        self.trackingUrl = trackingUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Nullable<Money>.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.destination = try container.decode(Nullable<PostTransferCreatedPayloadDataDestination>.self, forKey: .destination)
        self.failedAt = try container.decode(Nullable<Date>.self, forKey: .failedAt)
        self.failureCode = try container.decode(Nullable<String>.self, forKey: .failureCode)
        self.failureReason = try container.decode(Nullable<String>.self, forKey: .failureReason)
        self.fee = try container.decode(Nullable<Money>.self, forKey: .fee)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.object = try container.decode(PostTransferCreatedPayloadDataObject.self, forKey: .object)
        self.origin = try container.decode(Nullable<PostTransferCreatedPayloadDataOrigin>.self, forKey: .origin)
        self.status = try container.decode(PostTransferCreatedPayloadDataStatus.self, forKey: .status)
        self.statusChangedAt = try container.decode(Nullable<Date>.self, forKey: .statusChangedAt)
        self.succeededAt = try container.decode(Nullable<Date>.self, forKey: .succeededAt)
        self.trackingUrl = try container.decode(String.self, forKey: .trackingUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.destination, forKey: .destination)
        try container.encode(self.failedAt, forKey: .failedAt)
        try container.encode(self.failureCode, forKey: .failureCode)
        try container.encode(self.failureReason, forKey: .failureReason)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusChangedAt, forKey: .statusChangedAt)
        try container.encode(self.succeededAt, forKey: .succeededAt)
        try container.encode(self.trackingUrl, forKey: .trackingUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case destination
        case failedAt = "failed_at"
        case failureCode = "failure_code"
        case failureReason = "failure_reason"
        case fee
        case id
        case metadata
        case notes
        case object
        case origin
        case status
        case statusChangedAt = "status_changed_at"
        case succeededAt = "succeeded_at"
        case trackingUrl = "tracking_url"
    }
}