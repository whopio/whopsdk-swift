import Foundation

public struct CreateMethodsResponse: Codable, Hashable, Sendable {
    /// Masked identifier for the destination.
    public let accountReference: Nullable<String>
    /// Lifecycle trust state: `checking` (verification still running), `verified` (bank confirmed ownership or a payout already completed to it), `no_data` (verification unavailable or bank returned no ownership data), `warning` (bank could not confirm the destination's owner), `broken` (payouts failed with a permanent account error), `null` (never checked).
    public let bankVerificationState: Nullable<CreateMethodsResponseBankVerificationState>?
    public let createdAt: Date
    public let destinationCurrency: String
    /// Null on create. List payout methods to retrieve arrival estimates.
    public let estimatedArrival: Nullable<[String: JSONValue]>
    /// Null on create. List payout methods to retrieve the configured fee terms.
    public let feeStructure: Nullable<[String: JSONValue]>
    /// Payout method ID, usable as payout_method_id on POST /payouts.
    public let id: String
    public let institutionName: Nullable<String>
    /// Whether this method is a copy of one saved on another of the payer's accounts.
    public let isClone: Bool?
    public let isDefault: Bool
    /// When the most recent completed payout was delivered to this method, as an ISO 8601 timestamp. `null` when nothing has been paid out to it yet.
    public let lastPaidOutAt: Nullable<Date>
    /// Whether the payer added this method by signing in to their bank rather than typing account details.
    public let linkedViaPlaid: Bool?
    /// Whether the bank sign-in behind this method has expired and must be redone before it counts as linked.
    public let needsPlaidReconnect: Bool?
    /// User-defined label for the payout method.
    public let nickname: Nullable<String>
    public let object: CreateMethodsResponseObject
    public let payerName: Nullable<String>
    /// Always null on create.
    public let quote: Nullable<[String: JSONValue]>
    /// The recipient of a third-party payout method. Present only for recipient payout methods.
    public let recipient: CreateMethodsResponseRecipient?
    /// Always `created` on create — no payout has used the method yet.
    public let status: CreateMethodsResponseStatus
    /// Always `null` on create.
    public let statusReason: Nullable<String>
    public let supportedPayoutMethod: Nullable<CreateMethodsResponseSupportedPayoutMethod>
    /// The kind of payout method. `external` sends funds out of Whop. `whop_card` moves funds onto the account's own Whop Card. A `whop_card` method takes standard-speed payouts only, and cannot be updated, reconnected, or deleted.
    public let type: CreateMethodsResponseType?
    /// Why this method is unavailable: `destination_retired` means the payout provider stopped offering the destination. Whop may automatically remap an eligible method that was not linked through Plaid to a compatible replacement; otherwise, the account owner must re-add it. `null` means no unavailability reason is known.
    public let unavailableReason: Nullable<CreateMethodsResponseUnavailableReason>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountReference: Nullable<String>,
        bankVerificationState: Nullable<CreateMethodsResponseBankVerificationState>? = nil,
        createdAt: Date,
        destinationCurrency: String,
        estimatedArrival: Nullable<[String: JSONValue]>,
        feeStructure: Nullable<[String: JSONValue]>,
        id: String,
        institutionName: Nullable<String>,
        isClone: Bool? = nil,
        isDefault: Bool,
        lastPaidOutAt: Nullable<Date>,
        linkedViaPlaid: Bool? = nil,
        needsPlaidReconnect: Bool? = nil,
        nickname: Nullable<String>,
        object: CreateMethodsResponseObject,
        payerName: Nullable<String>,
        quote: Nullable<[String: JSONValue]>,
        recipient: CreateMethodsResponseRecipient? = nil,
        status: CreateMethodsResponseStatus,
        statusReason: Nullable<String>,
        supportedPayoutMethod: Nullable<CreateMethodsResponseSupportedPayoutMethod>,
        type: CreateMethodsResponseType? = nil,
        unavailableReason: Nullable<CreateMethodsResponseUnavailableReason>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountReference = accountReference
        self.bankVerificationState = bankVerificationState
        self.createdAt = createdAt
        self.destinationCurrency = destinationCurrency
        self.estimatedArrival = estimatedArrival
        self.feeStructure = feeStructure
        self.id = id
        self.institutionName = institutionName
        self.isClone = isClone
        self.isDefault = isDefault
        self.lastPaidOutAt = lastPaidOutAt
        self.linkedViaPlaid = linkedViaPlaid
        self.needsPlaidReconnect = needsPlaidReconnect
        self.nickname = nickname
        self.object = object
        self.payerName = payerName
        self.quote = quote
        self.recipient = recipient
        self.status = status
        self.statusReason = statusReason
        self.supportedPayoutMethod = supportedPayoutMethod
        self.type = type
        self.unavailableReason = unavailableReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountReference = try container.decode(Nullable<String>.self, forKey: .accountReference)
        self.bankVerificationState = try container.decodeNullableIfPresent(CreateMethodsResponseBankVerificationState.self, forKey: .bankVerificationState)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.destinationCurrency = try container.decode(String.self, forKey: .destinationCurrency)
        self.estimatedArrival = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .estimatedArrival)
        self.feeStructure = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .feeStructure)
        self.id = try container.decode(String.self, forKey: .id)
        self.institutionName = try container.decode(Nullable<String>.self, forKey: .institutionName)
        self.isClone = try container.decodeIfPresent(Bool.self, forKey: .isClone)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.lastPaidOutAt = try container.decode(Nullable<Date>.self, forKey: .lastPaidOutAt)
        self.linkedViaPlaid = try container.decodeIfPresent(Bool.self, forKey: .linkedViaPlaid)
        self.needsPlaidReconnect = try container.decodeIfPresent(Bool.self, forKey: .needsPlaidReconnect)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.object = try container.decode(CreateMethodsResponseObject.self, forKey: .object)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.quote = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .quote)
        self.recipient = try container.decodeIfPresent(CreateMethodsResponseRecipient.self, forKey: .recipient)
        self.status = try container.decode(CreateMethodsResponseStatus.self, forKey: .status)
        self.statusReason = try container.decode(Nullable<String>.self, forKey: .statusReason)
        self.supportedPayoutMethod = try container.decode(Nullable<CreateMethodsResponseSupportedPayoutMethod>.self, forKey: .supportedPayoutMethod)
        self.type = try container.decodeIfPresent(CreateMethodsResponseType.self, forKey: .type)
        self.unavailableReason = try container.decode(Nullable<CreateMethodsResponseUnavailableReason>.self, forKey: .unavailableReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountReference, forKey: .accountReference)
        try container.encodeNullableIfPresent(self.bankVerificationState, forKey: .bankVerificationState)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.destinationCurrency, forKey: .destinationCurrency)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.feeStructure, forKey: .feeStructure)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.institutionName, forKey: .institutionName)
        try container.encodeIfPresent(self.isClone, forKey: .isClone)
        try container.encode(self.isDefault, forKey: .isDefault)
        try container.encode(self.lastPaidOutAt, forKey: .lastPaidOutAt)
        try container.encodeIfPresent(self.linkedViaPlaid, forKey: .linkedViaPlaid)
        try container.encodeIfPresent(self.needsPlaidReconnect, forKey: .needsPlaidReconnect)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.payerName, forKey: .payerName)
        try container.encode(self.quote, forKey: .quote)
        try container.encodeIfPresent(self.recipient, forKey: .recipient)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusReason, forKey: .statusReason)
        try container.encode(self.supportedPayoutMethod, forKey: .supportedPayoutMethod)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(self.unavailableReason, forKey: .unavailableReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountReference = "account_reference"
        case bankVerificationState = "bank_verification_state"
        case createdAt = "created_at"
        case destinationCurrency = "destination_currency"
        case estimatedArrival = "estimated_arrival"
        case feeStructure = "fee_structure"
        case id
        case institutionName = "institution_name"
        case isClone = "is_clone"
        case isDefault = "is_default"
        case lastPaidOutAt = "last_paid_out_at"
        case linkedViaPlaid = "linked_via_plaid"
        case needsPlaidReconnect = "needs_plaid_reconnect"
        case nickname
        case object
        case payerName = "payer_name"
        case quote
        case recipient
        case status
        case statusReason = "status_reason"
        case supportedPayoutMethod = "supported_payout_method"
        case type
        case unavailableReason = "unavailable_reason"
    }
}