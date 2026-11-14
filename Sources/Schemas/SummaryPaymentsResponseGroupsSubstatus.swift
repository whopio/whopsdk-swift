import Foundation

/// How many of the matching payments are in each substatus. Every substatus is present, including those with a count of zero.
public struct SummaryPaymentsResponseGroupsSubstatus: Codable, Hashable, Sendable {
    public let autoRefunded: Int
    public let blocked: Int
    public let canceled: Int
    public let disputeClosed: Int
    public let disputeLost: Int
    public let disputeNeedsResponse: Int
    public let disputeUnderReview: Int
    public let disputeWarning: Int
    public let disputeWarningClosed: Int
    public let disputeWarningNeedsResponse: Int
    public let disputeWarningUnderReview: Int
    public let disputeWon: Int
    public let drafted: Int
    public let failed: Int
    public let incomplete: Int
    public let partiallyRefunded: Int
    public let pastDue: Int
    public let pending: Int
    public let priceTooLow: Int
    public let refunded: Int
    public let requiresCapture: Int
    public let resolutionLost: Int
    public let resolutionNeedsResponse: Int
    public let resolutionUnderReview: Int
    public let resolutionWon: Int
    public let succeeded: Int
    public let uncollectible: Int
    public let unresolved: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        autoRefunded: Int,
        blocked: Int,
        canceled: Int,
        disputeClosed: Int,
        disputeLost: Int,
        disputeNeedsResponse: Int,
        disputeUnderReview: Int,
        disputeWarning: Int,
        disputeWarningClosed: Int,
        disputeWarningNeedsResponse: Int,
        disputeWarningUnderReview: Int,
        disputeWon: Int,
        drafted: Int,
        failed: Int,
        incomplete: Int,
        partiallyRefunded: Int,
        pastDue: Int,
        pending: Int,
        priceTooLow: Int,
        refunded: Int,
        requiresCapture: Int,
        resolutionLost: Int,
        resolutionNeedsResponse: Int,
        resolutionUnderReview: Int,
        resolutionWon: Int,
        succeeded: Int,
        uncollectible: Int,
        unresolved: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.autoRefunded = autoRefunded
        self.blocked = blocked
        self.canceled = canceled
        self.disputeClosed = disputeClosed
        self.disputeLost = disputeLost
        self.disputeNeedsResponse = disputeNeedsResponse
        self.disputeUnderReview = disputeUnderReview
        self.disputeWarning = disputeWarning
        self.disputeWarningClosed = disputeWarningClosed
        self.disputeWarningNeedsResponse = disputeWarningNeedsResponse
        self.disputeWarningUnderReview = disputeWarningUnderReview
        self.disputeWon = disputeWon
        self.drafted = drafted
        self.failed = failed
        self.incomplete = incomplete
        self.partiallyRefunded = partiallyRefunded
        self.pastDue = pastDue
        self.pending = pending
        self.priceTooLow = priceTooLow
        self.refunded = refunded
        self.requiresCapture = requiresCapture
        self.resolutionLost = resolutionLost
        self.resolutionNeedsResponse = resolutionNeedsResponse
        self.resolutionUnderReview = resolutionUnderReview
        self.resolutionWon = resolutionWon
        self.succeeded = succeeded
        self.uncollectible = uncollectible
        self.unresolved = unresolved
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.autoRefunded = try container.decode(Int.self, forKey: .autoRefunded)
        self.blocked = try container.decode(Int.self, forKey: .blocked)
        self.canceled = try container.decode(Int.self, forKey: .canceled)
        self.disputeClosed = try container.decode(Int.self, forKey: .disputeClosed)
        self.disputeLost = try container.decode(Int.self, forKey: .disputeLost)
        self.disputeNeedsResponse = try container.decode(Int.self, forKey: .disputeNeedsResponse)
        self.disputeUnderReview = try container.decode(Int.self, forKey: .disputeUnderReview)
        self.disputeWarning = try container.decode(Int.self, forKey: .disputeWarning)
        self.disputeWarningClosed = try container.decode(Int.self, forKey: .disputeWarningClosed)
        self.disputeWarningNeedsResponse = try container.decode(Int.self, forKey: .disputeWarningNeedsResponse)
        self.disputeWarningUnderReview = try container.decode(Int.self, forKey: .disputeWarningUnderReview)
        self.disputeWon = try container.decode(Int.self, forKey: .disputeWon)
        self.drafted = try container.decode(Int.self, forKey: .drafted)
        self.failed = try container.decode(Int.self, forKey: .failed)
        self.incomplete = try container.decode(Int.self, forKey: .incomplete)
        self.partiallyRefunded = try container.decode(Int.self, forKey: .partiallyRefunded)
        self.pastDue = try container.decode(Int.self, forKey: .pastDue)
        self.pending = try container.decode(Int.self, forKey: .pending)
        self.priceTooLow = try container.decode(Int.self, forKey: .priceTooLow)
        self.refunded = try container.decode(Int.self, forKey: .refunded)
        self.requiresCapture = try container.decode(Int.self, forKey: .requiresCapture)
        self.resolutionLost = try container.decode(Int.self, forKey: .resolutionLost)
        self.resolutionNeedsResponse = try container.decode(Int.self, forKey: .resolutionNeedsResponse)
        self.resolutionUnderReview = try container.decode(Int.self, forKey: .resolutionUnderReview)
        self.resolutionWon = try container.decode(Int.self, forKey: .resolutionWon)
        self.succeeded = try container.decode(Int.self, forKey: .succeeded)
        self.uncollectible = try container.decode(Int.self, forKey: .uncollectible)
        self.unresolved = try container.decode(Int.self, forKey: .unresolved)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.autoRefunded, forKey: .autoRefunded)
        try container.encode(self.blocked, forKey: .blocked)
        try container.encode(self.canceled, forKey: .canceled)
        try container.encode(self.disputeClosed, forKey: .disputeClosed)
        try container.encode(self.disputeLost, forKey: .disputeLost)
        try container.encode(self.disputeNeedsResponse, forKey: .disputeNeedsResponse)
        try container.encode(self.disputeUnderReview, forKey: .disputeUnderReview)
        try container.encode(self.disputeWarning, forKey: .disputeWarning)
        try container.encode(self.disputeWarningClosed, forKey: .disputeWarningClosed)
        try container.encode(self.disputeWarningNeedsResponse, forKey: .disputeWarningNeedsResponse)
        try container.encode(self.disputeWarningUnderReview, forKey: .disputeWarningUnderReview)
        try container.encode(self.disputeWon, forKey: .disputeWon)
        try container.encode(self.drafted, forKey: .drafted)
        try container.encode(self.failed, forKey: .failed)
        try container.encode(self.incomplete, forKey: .incomplete)
        try container.encode(self.partiallyRefunded, forKey: .partiallyRefunded)
        try container.encode(self.pastDue, forKey: .pastDue)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.priceTooLow, forKey: .priceTooLow)
        try container.encode(self.refunded, forKey: .refunded)
        try container.encode(self.requiresCapture, forKey: .requiresCapture)
        try container.encode(self.resolutionLost, forKey: .resolutionLost)
        try container.encode(self.resolutionNeedsResponse, forKey: .resolutionNeedsResponse)
        try container.encode(self.resolutionUnderReview, forKey: .resolutionUnderReview)
        try container.encode(self.resolutionWon, forKey: .resolutionWon)
        try container.encode(self.succeeded, forKey: .succeeded)
        try container.encode(self.uncollectible, forKey: .uncollectible)
        try container.encode(self.unresolved, forKey: .unresolved)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case autoRefunded = "auto_refunded"
        case blocked
        case canceled
        case disputeClosed = "dispute_closed"
        case disputeLost = "dispute_lost"
        case disputeNeedsResponse = "dispute_needs_response"
        case disputeUnderReview = "dispute_under_review"
        case disputeWarning = "dispute_warning"
        case disputeWarningClosed = "dispute_warning_closed"
        case disputeWarningNeedsResponse = "dispute_warning_needs_response"
        case disputeWarningUnderReview = "dispute_warning_under_review"
        case disputeWon = "dispute_won"
        case drafted
        case failed
        case incomplete
        case partiallyRefunded = "partially_refunded"
        case pastDue = "past_due"
        case pending
        case priceTooLow = "price_too_low"
        case refunded
        case requiresCapture = "requires_capture"
        case resolutionLost = "resolution_lost"
        case resolutionNeedsResponse = "resolution_needs_response"
        case resolutionUnderReview = "resolution_under_review"
        case resolutionWon = "resolution_won"
        case succeeded
        case uncollectible
        case unresolved
    }
}