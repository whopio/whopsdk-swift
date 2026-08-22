import Foundation

public struct LedgerActivity: Codable, Hashable, Sendable {
    /// The viewer account that owns this row's ledger. Present only when the response aggregates owned accounts (include_owned_accounts=true); omitted otherwise.
    public let account: LedgerActivityAccount?
    /// Signed amount in the currency's smallest precision units.
    public let amount: String
    /// ISO 8601 timestamp these funds became (or are scheduled to become) withdrawable: the posted time for already-settled funds, or 00:00:00 UTC on the scheduled release date for pending funds. Present only on inflows entering the balance (payments, top-ups, incoming transfers/affiliate); null on withdrawals, refunds, disputes and on-chain rows. The available_after/before filters window on its UTC settlement date.
    public let availableAt: Nullable<Date>
    /// When the activity record was created.
    public let createdAt: Nullable<Date>
    /// Currency for this ledger activity.
    public let currency: LedgerActivityCurrency
    /// Ledger activity ID.
    public let id: String
    /// The ledger account (a ldgr_ identifier) this row belongs to. Present only when the response aggregates owned accounts (include_owned_accounts=true); omitted otherwise. Pair it with `account` to scope drawers and dashboard links to the owning business.
    public let ledgerAccountId: Nullable<String>?
    /// The ledger line category this activity was posted under.
    public let lineType: LedgerActivityLineType
    public let object: LedgerActivityObject
    /// When the activity posted to the ledger.
    public let postedAt: Date
    /// Resource associated with this ledger activity.
    public let resource: Nullable<LedgerActivityResource>
    /// Source of this ledger activity.
    public let source: Nullable<LedgerActivitySource>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: LedgerActivityAccount? = nil,
        amount: String,
        availableAt: Nullable<Date>,
        createdAt: Nullable<Date>,
        currency: LedgerActivityCurrency,
        id: String,
        ledgerAccountId: Nullable<String>? = nil,
        lineType: LedgerActivityLineType,
        object: LedgerActivityObject,
        postedAt: Date,
        resource: Nullable<LedgerActivityResource>,
        source: Nullable<LedgerActivitySource>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.amount = amount
        self.availableAt = availableAt
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.ledgerAccountId = ledgerAccountId
        self.lineType = lineType
        self.object = object
        self.postedAt = postedAt
        self.resource = resource
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decodeIfPresent(LedgerActivityAccount.self, forKey: .account)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.availableAt = try container.decode(Nullable<Date>.self, forKey: .availableAt)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.currency = try container.decode(LedgerActivityCurrency.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.ledgerAccountId = try container.decodeNullableIfPresent(String.self, forKey: .ledgerAccountId)
        self.lineType = try container.decode(LedgerActivityLineType.self, forKey: .lineType)
        self.object = try container.decode(LedgerActivityObject.self, forKey: .object)
        self.postedAt = try container.decode(Date.self, forKey: .postedAt)
        self.resource = try container.decode(Nullable<LedgerActivityResource>.self, forKey: .resource)
        self.source = try container.decode(Nullable<LedgerActivitySource>.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.account, forKey: .account)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.availableAt, forKey: .availableAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.ledgerAccountId, forKey: .ledgerAccountId)
        try container.encode(self.lineType, forKey: .lineType)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.postedAt, forKey: .postedAt)
        try container.encode(self.resource, forKey: .resource)
        try container.encode(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case amount
        case availableAt = "available_at"
        case createdAt = "created_at"
        case currency
        case id
        case ledgerAccountId = "ledger_account_id"
        case lineType = "line_type"
        case object
        case postedAt = "posted_at"
        case resource
        case source
    }
}