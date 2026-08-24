import Foundation

public struct RetrieveSwapsResponse: Codable, Hashable, Sendable {
    /// Account ID that owns the wallet used for the swap.
    public let accountId: String
    /// Latest error returned for a failed swap.
    public let error: Nullable<String>?
    /// Swap ID.
    public let id: String
    public let object: RetrieveSwapsResponseObject
    /// Current swap status. `complete` and `failed` are terminal.
    public let status: RetrieveSwapsResponseStatus
    /// On-chain transaction hashes produced by the swap.
    public let txHashes: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        error: Nullable<String>? = nil,
        id: String,
        object: RetrieveSwapsResponseObject,
        status: RetrieveSwapsResponseStatus,
        txHashes: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.error = error
        self.id = id
        self.object = object
        self.status = status
        self.txHashes = txHashes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.error = try container.decodeNullableIfPresent(String.self, forKey: .error)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(RetrieveSwapsResponseObject.self, forKey: .object)
        self.status = try container.decode(RetrieveSwapsResponseStatus.self, forKey: .status)
        self.txHashes = try container.decode([String].self, forKey: .txHashes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.error, forKey: .error)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.txHashes, forKey: .txHashes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case error
        case id
        case object
        case status
        case txHashes = "tx_hashes"
    }
}