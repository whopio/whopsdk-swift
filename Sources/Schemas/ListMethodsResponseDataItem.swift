import Foundation

public struct ListMethodsResponseDataItem: Codable, Hashable, Sendable {
    /// Masked identifier for the destination, such as the last four digits of a bank account.
    public let accountReference: Nullable<String>
    /// Lifecycle trust state: `checking` (verification still running), `verified` (bank confirmed ownership or a payout already completed to it), `no_data` (verification unavailable or bank returned no ownership data), `warning` (bank could not confirm the destination's owner), `broken` (payouts failed with a permanent account error), `null` (never checked).
    public let bankVerificationState: Nullable<ListMethodsResponseDataItemBankVerificationState>
    /// When the payout method was added.
    public let createdAt: Date
    /// Currency payouts are delivered in for this method.
    public let destinationCurrency: String
    /// Estimated arrival times before an amount-specific quote is requested. Null when the method is not currently eligible.
    public let estimatedArrival: Nullable<ListMethodsResponseDataItemEstimatedArrival>
    /// Configured fee terms for this payout method. Null when the method is not currently eligible. An amount-specific quote remains authoritative.
    public let feeStructure: Nullable<ListMethodsResponseDataItemFeeStructure>
    /// Payout method ID.
    public let id: String
    /// Name of the bank or institution receiving payouts.
    public let institutionName: Nullable<String>
    /// Whether this method is a copy of one saved on another of the payer's accounts.
    public let isClone: Bool
    /// Whether this is the default payout method for the account.
    public let isDefault: Bool
    /// When the most recent completed payout was delivered to this method, as an ISO 8601 timestamp. `null` when nothing has been paid out to it yet.
    public let lastPaidOutAt: Nullable<Date>
    /// Whether the payer added this method by signing in to their bank rather than typing account details.
    public let linkedViaPlaid: Bool
    /// Whether the bank sign-in behind this method has expired and must be redone before it counts as linked.
    public let needsPlaidReconnect: Bool
    /// User-defined label for the payout method.
    public let nickname: Nullable<String>
    public let object: ListMethodsResponseDataItemObject
    /// Display name of the payout rail, such as `ACH Bank Deposit`.
    public let payerName: Nullable<String>
    /// Fee and delivery estimate for withdrawing the requested amount through this method. Null unless an amount was provided, or when the estimate is unavailable.
    public let quote: Nullable<ListMethodsResponseDataItemQuote>
    /// Lifecycle status: `created` means saved but unused, `active` means a payout succeeded through it, `broken` means a payout failure disabled it; a later successful payout returns it to `active`.
    public let status: ListMethodsResponseDataItemStatus
    /// Machine-readable code for why the method is `broken` — the newest disabling failure recorded through it, whether a payout error or a pre-payout rejection. `null` unless the method is broken, or when it was disabled without a recorded failure.
    public let statusReason: Nullable<String>
    /// The supported payout method this saved method was created from.
    public let supportedPayoutMethod: Nullable<ListMethodsResponseDataItemSupportedPayoutMethod>
    /// Why this method is unavailable: `destination_retired` means the payout provider stopped offering the destination. Whop may automatically remap an eligible method that was not linked through Plaid to a compatible replacement; otherwise, the account owner must re-add it. `null` means no unavailability reason is known.
    public let unavailableReason: Nullable<ListMethodsResponseDataItemUnavailableReason>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountReference: Nullable<String>,
        bankVerificationState: Nullable<ListMethodsResponseDataItemBankVerificationState>,
        createdAt: Date,
        destinationCurrency: String,
        estimatedArrival: Nullable<ListMethodsResponseDataItemEstimatedArrival>,
        feeStructure: Nullable<ListMethodsResponseDataItemFeeStructure>,
        id: String,
        institutionName: Nullable<String>,
        isClone: Bool,
        isDefault: Bool,
        lastPaidOutAt: Nullable<Date>,
        linkedViaPlaid: Bool,
        needsPlaidReconnect: Bool,
        nickname: Nullable<String>,
        object: ListMethodsResponseDataItemObject,
        payerName: Nullable<String>,
        quote: Nullable<ListMethodsResponseDataItemQuote>,
        status: ListMethodsResponseDataItemStatus,
        statusReason: Nullable<String>,
        supportedPayoutMethod: Nullable<ListMethodsResponseDataItemSupportedPayoutMethod>,
        unavailableReason: Nullable<ListMethodsResponseDataItemUnavailableReason>,
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
        self.status = status
        self.statusReason = statusReason
        self.supportedPayoutMethod = supportedPayoutMethod
        self.unavailableReason = unavailableReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountReference = try container.decode(Nullable<String>.self, forKey: .accountReference)
        self.bankVerificationState = try container.decode(Nullable<ListMethodsResponseDataItemBankVerificationState>.self, forKey: .bankVerificationState)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.destinationCurrency = try container.decode(String.self, forKey: .destinationCurrency)
        self.estimatedArrival = try container.decode(Nullable<ListMethodsResponseDataItemEstimatedArrival>.self, forKey: .estimatedArrival)
        self.feeStructure = try container.decode(Nullable<ListMethodsResponseDataItemFeeStructure>.self, forKey: .feeStructure)
        self.id = try container.decode(String.self, forKey: .id)
        self.institutionName = try container.decode(Nullable<String>.self, forKey: .institutionName)
        self.isClone = try container.decode(Bool.self, forKey: .isClone)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.lastPaidOutAt = try container.decode(Nullable<Date>.self, forKey: .lastPaidOutAt)
        self.linkedViaPlaid = try container.decode(Bool.self, forKey: .linkedViaPlaid)
        self.needsPlaidReconnect = try container.decode(Bool.self, forKey: .needsPlaidReconnect)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.object = try container.decode(ListMethodsResponseDataItemObject.self, forKey: .object)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.quote = try container.decode(Nullable<ListMethodsResponseDataItemQuote>.self, forKey: .quote)
        self.status = try container.decode(ListMethodsResponseDataItemStatus.self, forKey: .status)
        self.statusReason = try container.decode(Nullable<String>.self, forKey: .statusReason)
        self.supportedPayoutMethod = try container.decode(Nullable<ListMethodsResponseDataItemSupportedPayoutMethod>.self, forKey: .supportedPayoutMethod)
        self.unavailableReason = try container.decode(Nullable<ListMethodsResponseDataItemUnavailableReason>.self, forKey: .unavailableReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountReference, forKey: .accountReference)
        try container.encode(self.bankVerificationState, forKey: .bankVerificationState)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.destinationCurrency, forKey: .destinationCurrency)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.feeStructure, forKey: .feeStructure)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.institutionName, forKey: .institutionName)
        try container.encode(self.isClone, forKey: .isClone)
        try container.encode(self.isDefault, forKey: .isDefault)
        try container.encode(self.lastPaidOutAt, forKey: .lastPaidOutAt)
        try container.encode(self.linkedViaPlaid, forKey: .linkedViaPlaid)
        try container.encode(self.needsPlaidReconnect, forKey: .needsPlaidReconnect)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.payerName, forKey: .payerName)
        try container.encode(self.quote, forKey: .quote)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusReason, forKey: .statusReason)
        try container.encode(self.supportedPayoutMethod, forKey: .supportedPayoutMethod)
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
        case status
        case statusReason = "status_reason"
        case supportedPayoutMethod = "supported_payout_method"
        case unavailableReason = "unavailable_reason"
    }
}