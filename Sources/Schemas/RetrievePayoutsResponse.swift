import Foundation

public struct RetrievePayoutsResponse: Codable, Hashable, Sendable {
    /// The payout amount in whole currency units, as a decimal string. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let amount: String?
    /// Whether `POST /payouts/{id}/cancel` would act on this payout right now: `true` while it is `in_review`, while it is `processing` with nothing yet submitted to the payout provider, or while a submitted payout can still be asked to cancel at the provider. `false` once the money has arrived or the payout has already ended. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let cancelable: Bool?
    /// When the payout was created.
    public let createdAt: Date
    /// Payout currency.
    public let currency: String
    /// Whether an in-transit withdrawal is past its settlement window.
    public let delayed: Bool?
    /// The amount delivered in the destination currency, as a decimal string. Assigned when the payout is processed, so it is `null` before then and on payouts without a recorded conversion.
    public let destinationAmount: Nullable<String>
    /// Currency the funds are delivered in, taken from the payout method when the payout is created. On a payout funded by a conversion request it follows the settlement payout minted alongside it — the `GET /payouts` row carrying this payout's id as `payout_request_id` — and is `null` only when no settlement payout exists.
    public let destinationCurrency: Nullable<String>
    /// Estimated time the funds become available in the destination account.
    public let estimatedArrival: Nullable<Date>
    /// End of the expected bank settlement window.
    public let estimatedArrivalEnd: Nullable<Date>?
    /// Exchange rate from the payout currency to the destination currency. Assigned when the payout is processed, so it is `null` before then and on payouts without a recorded rate.
    public let exchangeRate: Nullable<Float>
    /// Why the payout ended without paying, or why it reversed after settlement. Present on failed, canceled, denied, and reversed payouts; `null` otherwise.
    public let failure: Nullable<RetrievePayoutsResponseFailure>
    /// The fee charged for the payout, in the payout currency, as a decimal string. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let feeAmount: String?
    /// Who bore the payout fee: the account itself, or its parent platform. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let feePaidBy: RetrievePayoutsResponseFeePaidBy?
    /// Payout ID, prefixed `wdrl_` for a payout returned by `GET /payouts`, `cofr_` for a payout request returned by `POST /payouts`, or `pay_` for a payout funded by a card payment that has not been submitted yet.
    public let id: String
    /// Whop's markup on the provider fee, in the payout currency, as a decimal string. `"0.0"` when none applies. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let markupFee: String?
    /// Key-value data attached at creation and echoed on every read. At most 50 keys, key names up to 40 characters, string values up to 500 characters. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let metadata: [String: String]?
    /// The planned net for the destination, in the payout currency: amount minus fee_amount minus markup_fee when fee_paid_by is `self`; equal to amount when the platform covers the fees. A payout that ends denied, canceled, or failed delivered nothing — most keep the planned figure and `failure` says where the funds are, but a canceled payout funded by a conversion request can report the settled outcome instead: `amount` carries what stayed in the balance, fees are zero because none were charged, and `net_amount` is 0 because nothing was delivered.
    public let netAmount: String
    /// Free-form notes attached by the payout creator, or `null` when none were provided. Maximum 255 characters.
    public let notes: Nullable<String>
    public let object: RetrievePayoutsResponseObject
    /// Name of the entity processing the payout.
    public let payerName: Nullable<String>
    /// Payout method display details. The nickname requires payout:destination:read on the owning ledger; otherwise it is null.
    public let payoutMethod: Nullable<RetrievePayoutsResponsePayoutMethod>
    /// Payout request ID, prefixed `cofr_`, returned by `POST /payouts`. For a request retrieved by its own `cofr_` ID, this equals `id`. Returns `null` for payouts not created by `POST /payouts`.
    public let payoutRequestId: Nullable<String>
    /// The recipient's first name and last initial, or null when no recipient name is available.
    public let recipientName: Nullable<String>?
    /// The sending business's display name, or a personal sender's first name and last initial.
    public let senderName: Nullable<String>?
    /// How the payout was created. `automatic` means a scheduled auto-payout. `null` when the payout has no recorded source. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let source: Nullable<RetrievePayoutsResponseSource>?
    /// Payout delivery speed.
    public let speed: RetrievePayoutsResponseSpeed
    /// The payment description sent with the payout, or `null` if no descriptor was set. When set, 5-80 printable ASCII characters. Only returned to callers with payout:withdrawal:read on the owning ledger.
    public let statementDescriptor: Nullable<String>?
    /// Current payout status.
    public let status: RetrievePayoutsResponseStatus
    /// The finest machine phase under `status` — for example `awaiting_provider_acceptance` vs `in_transit` under `processing`, or the conversion phase under `requested`. Informational vocabulary: values can be added without a version bump; `status` is the versioned contract.
    public let statusDetail: String
    /// Completed lifecycle events in chronological order. Present once the payout has a withdrawal record.
    public let timeline: [RetrievePayoutsResponseTimelineItem]?
    /// Payment network reference for this payout, such as an ACH trace number, an RTP or FedNow end-to-end ID, a wire IMAD, or a SWIFT UETR. `null` until the reference is available, and on payouts that have none.
    public let traceCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String? = nil,
        cancelable: Bool? = nil,
        createdAt: Date,
        currency: String,
        delayed: Bool? = nil,
        destinationAmount: Nullable<String>,
        destinationCurrency: Nullable<String>,
        estimatedArrival: Nullable<Date>,
        estimatedArrivalEnd: Nullable<Date>? = nil,
        exchangeRate: Nullable<Float>,
        failure: Nullable<RetrievePayoutsResponseFailure>,
        feeAmount: String? = nil,
        feePaidBy: RetrievePayoutsResponseFeePaidBy? = nil,
        id: String,
        markupFee: String? = nil,
        metadata: [String: String]? = nil,
        netAmount: String,
        notes: Nullable<String>,
        object: RetrievePayoutsResponseObject,
        payerName: Nullable<String>,
        payoutMethod: Nullable<RetrievePayoutsResponsePayoutMethod>,
        payoutRequestId: Nullable<String>,
        recipientName: Nullable<String>? = nil,
        senderName: Nullable<String>? = nil,
        source: Nullable<RetrievePayoutsResponseSource>? = nil,
        speed: RetrievePayoutsResponseSpeed,
        statementDescriptor: Nullable<String>? = nil,
        status: RetrievePayoutsResponseStatus,
        statusDetail: String,
        timeline: [RetrievePayoutsResponseTimelineItem]? = nil,
        traceCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.cancelable = cancelable
        self.createdAt = createdAt
        self.currency = currency
        self.delayed = delayed
        self.destinationAmount = destinationAmount
        self.destinationCurrency = destinationCurrency
        self.estimatedArrival = estimatedArrival
        self.estimatedArrivalEnd = estimatedArrivalEnd
        self.exchangeRate = exchangeRate
        self.failure = failure
        self.feeAmount = feeAmount
        self.feePaidBy = feePaidBy
        self.id = id
        self.markupFee = markupFee
        self.metadata = metadata
        self.netAmount = netAmount
        self.notes = notes
        self.object = object
        self.payerName = payerName
        self.payoutMethod = payoutMethod
        self.payoutRequestId = payoutRequestId
        self.recipientName = recipientName
        self.senderName = senderName
        self.source = source
        self.speed = speed
        self.statementDescriptor = statementDescriptor
        self.status = status
        self.statusDetail = statusDetail
        self.timeline = timeline
        self.traceCode = traceCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decodeIfPresent(String.self, forKey: .amount)
        self.cancelable = try container.decodeIfPresent(Bool.self, forKey: .cancelable)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.delayed = try container.decodeIfPresent(Bool.self, forKey: .delayed)
        self.destinationAmount = try container.decode(Nullable<String>.self, forKey: .destinationAmount)
        self.destinationCurrency = try container.decode(Nullable<String>.self, forKey: .destinationCurrency)
        self.estimatedArrival = try container.decode(Nullable<Date>.self, forKey: .estimatedArrival)
        self.estimatedArrivalEnd = try container.decodeNullableIfPresent(Date.self, forKey: .estimatedArrivalEnd)
        self.exchangeRate = try container.decode(Nullable<Float>.self, forKey: .exchangeRate)
        self.failure = try container.decode(Nullable<RetrievePayoutsResponseFailure>.self, forKey: .failure)
        self.feeAmount = try container.decodeIfPresent(String.self, forKey: .feeAmount)
        self.feePaidBy = try container.decodeIfPresent(RetrievePayoutsResponseFeePaidBy.self, forKey: .feePaidBy)
        self.id = try container.decode(String.self, forKey: .id)
        self.markupFee = try container.decodeIfPresent(String.self, forKey: .markupFee)
        self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
        self.netAmount = try container.decode(String.self, forKey: .netAmount)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.object = try container.decode(RetrievePayoutsResponseObject.self, forKey: .object)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.payoutMethod = try container.decode(Nullable<RetrievePayoutsResponsePayoutMethod>.self, forKey: .payoutMethod)
        self.payoutRequestId = try container.decode(Nullable<String>.self, forKey: .payoutRequestId)
        self.recipientName = try container.decodeNullableIfPresent(String.self, forKey: .recipientName)
        self.senderName = try container.decodeNullableIfPresent(String.self, forKey: .senderName)
        self.source = try container.decodeNullableIfPresent(RetrievePayoutsResponseSource.self, forKey: .source)
        self.speed = try container.decode(RetrievePayoutsResponseSpeed.self, forKey: .speed)
        self.statementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .statementDescriptor)
        self.status = try container.decode(RetrievePayoutsResponseStatus.self, forKey: .status)
        self.statusDetail = try container.decode(String.self, forKey: .statusDetail)
        self.timeline = try container.decodeIfPresent([RetrievePayoutsResponseTimelineItem].self, forKey: .timeline)
        self.traceCode = try container.decode(Nullable<String>.self, forKey: .traceCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.cancelable, forKey: .cancelable)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.delayed, forKey: .delayed)
        try container.encode(self.destinationAmount, forKey: .destinationAmount)
        try container.encode(self.destinationCurrency, forKey: .destinationCurrency)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encodeNullableIfPresent(self.estimatedArrivalEnd, forKey: .estimatedArrivalEnd)
        try container.encode(self.exchangeRate, forKey: .exchangeRate)
        try container.encode(self.failure, forKey: .failure)
        try container.encodeIfPresent(self.feeAmount, forKey: .feeAmount)
        try container.encodeIfPresent(self.feePaidBy, forKey: .feePaidBy)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.markupFee, forKey: .markupFee)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encode(self.netAmount, forKey: .netAmount)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.payerName, forKey: .payerName)
        try container.encode(self.payoutMethod, forKey: .payoutMethod)
        try container.encode(self.payoutRequestId, forKey: .payoutRequestId)
        try container.encodeNullableIfPresent(self.recipientName, forKey: .recipientName)
        try container.encodeNullableIfPresent(self.senderName, forKey: .senderName)
        try container.encodeNullableIfPresent(self.source, forKey: .source)
        try container.encode(self.speed, forKey: .speed)
        try container.encodeNullableIfPresent(self.statementDescriptor, forKey: .statementDescriptor)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusDetail, forKey: .statusDetail)
        try container.encodeIfPresent(self.timeline, forKey: .timeline)
        try container.encode(self.traceCode, forKey: .traceCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case cancelable
        case createdAt = "created_at"
        case currency
        case delayed
        case destinationAmount = "destination_amount"
        case destinationCurrency = "destination_currency"
        case estimatedArrival = "estimated_arrival"
        case estimatedArrivalEnd = "estimated_arrival_end"
        case exchangeRate = "exchange_rate"
        case failure
        case feeAmount = "fee_amount"
        case feePaidBy = "fee_paid_by"
        case id
        case markupFee = "markup_fee"
        case metadata
        case netAmount = "net_amount"
        case notes
        case object
        case payerName = "payer_name"
        case payoutMethod = "payout_method"
        case payoutRequestId = "payout_request_id"
        case recipientName = "recipient_name"
        case senderName = "sender_name"
        case source
        case speed
        case statementDescriptor = "statement_descriptor"
        case status
        case statusDetail = "status_detail"
        case timeline
        case traceCode = "trace_code"
    }
}