import Foundation

public struct CashbackPayout: Codable, Hashable, Sendable {
    /// Subaccount filter from the request, prefixed `biz_`. Omitted when not supplied.
    public let accountId: Nullable<String>?
    /// Cashback rule filter from the request, prefixed `cicbr_`. Omitted when not supplied.
    public let cashbackRuleId: Nullable<String>?
    /// Request status. `processing` means background processing was queued, not that payment completed. `failed`, returned with HTTP `200`, means the queue rejected the request. Subsequent transaction failures retry automatically.
    public let status: CashbackPayoutStatus
    /// Card transaction filter from the request, prefixed `citx_`. Omitted when not supplied.
    public let transactionId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>? = nil,
        cashbackRuleId: Nullable<String>? = nil,
        status: CashbackPayoutStatus,
        transactionId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.cashbackRuleId = cashbackRuleId
        self.status = status
        self.transactionId = transactionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
        self.cashbackRuleId = try container.decodeNullableIfPresent(String.self, forKey: .cashbackRuleId)
        self.status = try container.decode(CashbackPayoutStatus.self, forKey: .status)
        self.transactionId = try container.decodeNullableIfPresent(String.self, forKey: .transactionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.cashbackRuleId, forKey: .cashbackRuleId)
        try container.encode(self.status, forKey: .status)
        try container.encodeNullableIfPresent(self.transactionId, forKey: .transactionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case cashbackRuleId = "cashback_rule_id"
        case status
        case transactionId = "transaction_id"
    }
}