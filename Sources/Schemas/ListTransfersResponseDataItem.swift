import Foundation

/// A transfer of credit between two ledger accounts.
public struct ListTransfersResponseDataItem: Codable, Hashable, Sendable {
    /// Transfer amount.
    public let amount: Double
    /// When the transfer was created.
    public let createdAt: Date
    /// The user who initiated the transfer, such as the team member who sent a manual payout. Null if the creator is unavailable.
    public let createdByUser: Nullable<ListTransfersResponseDataItemCreatedByUser>
    /// Transfer currency.
    public let currency: String
    /// Destination ledger account ID.
    public let destinationLedgerAccountId: String
    /// When the transfer failed, as an ISO 8601 timestamp. Null unless the transfer has failed.
    public let failedAt: Nullable<Date>?
    /// Machine-readable code for why the transfer failed. Null unless the transfer has failed.
    public let failureCode: Nullable<String>?
    /// Human-readable explanation of why the transfer failed. Null unless the transfer has failed.
    public let failureReason: Nullable<String>?
    /// Fee charged for the transfer.
    public let feeAmount: Nullable<Double>?
    /// Transfer ID.
    public let id: String
    /// Custom metadata attached to the transfer.
    public let metadata: Nullable<[String: JSONValue]>?
    /// Transfer note.
    public let notes: Nullable<String>?
    /// The object type.
    public let object: ListTransfersResponseDataItemObject
    /// Source ledger account ID.
    public let originLedgerAccountId: String
    /// Transfer status. `processing` means the on-chain leg is still executing — poll the transfer until it resolves to `succeeded` or `failed`. A `failed` transfer may be retried under the same ID and later resolve to `succeeded`.
    public let status: ListTransfersResponseDataItemStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        createdByUser: Nullable<ListTransfersResponseDataItemCreatedByUser>,
        currency: String,
        destinationLedgerAccountId: String,
        failedAt: Nullable<Date>? = nil,
        failureCode: Nullable<String>? = nil,
        failureReason: Nullable<String>? = nil,
        feeAmount: Nullable<Double>? = nil,
        id: String,
        metadata: Nullable<[String: JSONValue]>? = nil,
        notes: Nullable<String>? = nil,
        object: ListTransfersResponseDataItemObject,
        originLedgerAccountId: String,
        status: ListTransfersResponseDataItemStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.createdByUser = createdByUser
        self.currency = currency
        self.destinationLedgerAccountId = destinationLedgerAccountId
        self.failedAt = failedAt
        self.failureCode = failureCode
        self.failureReason = failureReason
        self.feeAmount = feeAmount
        self.id = id
        self.metadata = metadata
        self.notes = notes
        self.object = object
        self.originLedgerAccountId = originLedgerAccountId
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.createdByUser = try container.decode(Nullable<ListTransfersResponseDataItemCreatedByUser>.self, forKey: .createdByUser)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.destinationLedgerAccountId = try container.decode(String.self, forKey: .destinationLedgerAccountId)
        self.failedAt = try container.decodeNullableIfPresent(Date.self, forKey: .failedAt)
        self.failureCode = try container.decodeNullableIfPresent(String.self, forKey: .failureCode)
        self.failureReason = try container.decodeNullableIfPresent(String.self, forKey: .failureReason)
        self.feeAmount = try container.decodeNullableIfPresent(Double.self, forKey: .feeAmount)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
        self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
        self.object = try container.decode(ListTransfersResponseDataItemObject.self, forKey: .object)
        self.originLedgerAccountId = try container.decode(String.self, forKey: .originLedgerAccountId)
        self.status = try container.decode(ListTransfersResponseDataItemStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.createdByUser, forKey: .createdByUser)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.destinationLedgerAccountId, forKey: .destinationLedgerAccountId)
        try container.encodeNullableIfPresent(self.failedAt, forKey: .failedAt)
        try container.encodeNullableIfPresent(self.failureCode, forKey: .failureCode)
        try container.encodeNullableIfPresent(self.failureReason, forKey: .failureReason)
        try container.encodeNullableIfPresent(self.feeAmount, forKey: .feeAmount)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        try container.encodeNullableIfPresent(self.notes, forKey: .notes)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.originLedgerAccountId, forKey: .originLedgerAccountId)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case createdByUser = "created_by_user"
        case currency
        case destinationLedgerAccountId = "destination_ledger_account_id"
        case failedAt = "failed_at"
        case failureCode = "failure_code"
        case failureReason = "failure_reason"
        case feeAmount = "fee_amount"
        case id
        case metadata
        case notes
        case object
        case originLedgerAccountId = "origin_ledger_account_id"
        case status
    }
}