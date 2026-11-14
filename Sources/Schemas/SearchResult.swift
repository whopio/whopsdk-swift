import Foundation

public struct SearchResult: Codable, Hashable, Sendable {
    /// Why the row matched, or `null` for a ranked row whose whole ID or whole title isn't the query. `id`: its ID, or a related one such as its user's, its dispute's, or a plan or payout ID for an account. `link`: a whop.com store or product link. `name`: its whole title. `email`: the email of the user it belongs to. `owner_email`, `team_member_email` or `customer_email`: the email of a subaccount's owner, a member of its team, or one of its customers. `card`: its card's first 6 or 8 and last 4 digits, or the last 4 alone. `phone`: the phone number of the user it belongs to. `payment_number`: the number of the invoice a payment collects, so an invoice from `GET /invoices` comes back as its `payment`.
    public let matchReason: Nullable<SearchResultMatchReason>
    /// The matched record. Get the full record from its own endpoint by `id`.
    public let record: SearchRecord
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        matchReason: Nullable<SearchResultMatchReason>,
        record: SearchRecord,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.matchReason = matchReason
        self.record = record
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.matchReason = try container.decode(Nullable<SearchResultMatchReason>.self, forKey: .matchReason)
        self.record = try container.decode(SearchRecord.self, forKey: .record)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.matchReason, forKey: .matchReason)
        try container.encode(self.record, forKey: .record)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case matchReason = "match_reason"
        case record
    }
}