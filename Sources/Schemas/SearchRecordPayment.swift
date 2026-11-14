import Foundation

public struct SearchRecordPayment: Codable, Hashable, Sendable {
    /// Account that took the payment, prefixed `biz_`.
    public let accountId: String
    /// When the payment was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Short text about the record, such as an account's headline or a case's reason. Display text in your locale that can change without a version change. `null` when there's none.
    public let description: Nullable<String>
    /// Payment ID, prefixed `pay_`.
    public let id: String
    /// Logo or avatar. `null` when there's none.
    public let imageUrl: Nullable<String>
    /// When the money was collected, as an ISO 8601 timestamp. `null` while it has not been.
    public let paidAt: Nullable<String>
    /// The account-facing total in the currency presented to the buyer, before conversion into the settlement currency. Excludes buyer fees. `null` when the payment has none.
    public let presentmentTotal: Nullable<Money>
    /// Lifecycle state of the charge, as on the payment resource.
    public let status: ReceiptStatus
    /// The dashboard's finer-grained reading of the payment, folding in refunds, disputes and Resolution Center cases.
    public let substatus: FriendlyReceiptStatus
    /// Line shown under the title, such as the account or product the record belongs to. Display text in your locale that can change without a version change. `null` when there's none.
    public let subtitle: Nullable<String>
    /// Record name, such as a customer's name or a promo code. Display text in your locale that can change without a version change, so show it rather than parse it. `null` when the record has no name.
    public let title: Nullable<String>
    /// The account-facing total: the price after discounts, plus any tax added on top. Excludes buyer fees, which the buyer pays above this amount — so this is not necessarily what the buyer's statement shows.
    public let total: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        createdAt: String,
        description: Nullable<String>,
        id: String,
        imageUrl: Nullable<String>,
        paidAt: Nullable<String>,
        presentmentTotal: Nullable<Money>,
        status: ReceiptStatus,
        substatus: FriendlyReceiptStatus,
        subtitle: Nullable<String>,
        title: Nullable<String>,
        total: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.imageUrl = imageUrl
        self.paidAt = paidAt
        self.presentmentTotal = presentmentTotal
        self.status = status
        self.substatus = substatus
        self.subtitle = subtitle
        self.title = title
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.paidAt = try container.decode(Nullable<String>.self, forKey: .paidAt)
        self.presentmentTotal = try container.decode(Nullable<Money>.self, forKey: .presentmentTotal)
        self.status = try container.decode(ReceiptStatus.self, forKey: .status)
        self.substatus = try container.decode(FriendlyReceiptStatus.self, forKey: .substatus)
        self.subtitle = try container.decode(Nullable<String>.self, forKey: .subtitle)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.total = try container.decode(Nullable<Money>.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.presentmentTotal, forKey: .presentmentTotal)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.substatus, forKey: .substatus)
        try container.encode(self.subtitle, forKey: .subtitle)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case description
        case id
        case imageUrl = "image_url"
        case paidAt = "paid_at"
        case presentmentTotal = "presentment_total"
        case status
        case substatus
        case subtitle
        case title
        case total
    }
}