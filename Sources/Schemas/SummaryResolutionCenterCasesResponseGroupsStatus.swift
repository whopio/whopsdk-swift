import Foundation

/// How many of the matching cases are in each status. Every status is present, including those with a count of zero.
public struct SummaryResolutionCenterCasesResponseGroupsStatus: Codable, Hashable, Sendable {
    public let awaitingCustomer: Int
    public let awaitingMerchant: Int
    public let closed: Int
    public let underReview: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        awaitingCustomer: Int,
        awaitingMerchant: Int,
        closed: Int,
        underReview: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.awaitingCustomer = awaitingCustomer
        self.awaitingMerchant = awaitingMerchant
        self.closed = closed
        self.underReview = underReview
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.awaitingCustomer = try container.decode(Int.self, forKey: .awaitingCustomer)
        self.awaitingMerchant = try container.decode(Int.self, forKey: .awaitingMerchant)
        self.closed = try container.decode(Int.self, forKey: .closed)
        self.underReview = try container.decode(Int.self, forKey: .underReview)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.awaitingCustomer, forKey: .awaitingCustomer)
        try container.encode(self.awaitingMerchant, forKey: .awaitingMerchant)
        try container.encode(self.closed, forKey: .closed)
        try container.encode(self.underReview, forKey: .underReview)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case awaitingCustomer = "awaiting_customer"
        case awaitingMerchant = "awaiting_merchant"
        case closed
        case underReview = "under_review"
    }
}