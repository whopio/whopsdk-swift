import Foundation

public struct PostWithdrawalUpdatedPayloadData: Codable, Hashable, Sendable {
    /// The payout amount in whole currency units, as a decimal string.
    public let amount: String
    /// When the payout was created.
    public let createdAt: Date
    /// Payout currency.
    public let currency: String
    /// The amount delivered in the destination currency, as a decimal string. Assigned when the payout is processed, so it is `null` before then and on payouts without a recorded conversion.
    public let destinationAmount: Nullable<String>
    /// Currency the funds are delivered in, taken from the payout method when the payout is created. On a stablecoin payout it follows the settlement payout minted alongside it — the `GET /payouts` row carrying this payout's id as `payout_request_id` — and is `null` only when no settlement payout exists.
    public let destinationCurrency: Nullable<String>
    /// Estimated time the funds become available in the destination account.
    public let estimatedArrival: Nullable<Date>
    /// Exchange rate from the payout currency to the destination currency. Assigned when the payout is processed, so it is `null` before then and on payouts without a recorded rate.
    public let exchangeRate: Nullable<Float>
    /// Why the payout ended without paying, or why it reversed after settlement. Present on failed, canceled, denied, and reversed payouts; `null` otherwise.
    public let failure: Nullable<PostWithdrawalUpdatedPayloadDataFailure>
    /// The fee charged for the payout, in the payout currency, as a decimal string.
    public let feeAmount: String
    /// Who bore the payout fee: the account itself, or its parent platform.
    public let feePaidBy: PostWithdrawalUpdatedPayloadDataFeePaidBy
    /// Payout ID, prefixed `wdrl_`.
    public let id: String
    /// Whop's markup on the provider fee, in the payout currency, as a decimal string. `"0.0"` when none applies.
    public let markupFee: String
    /// Key-value data attached at creation and echoed on every read. At most 50 keys, key names up to 40 characters, string values up to 500 characters.
    public let metadata: [String: String]
    /// The planned net for the destination, in the payout currency: amount minus fee_amount minus markup_fee when fee_paid_by is `self`; equal to amount when the platform covers the fees. A payout that ends denied, canceled, or failed delivered nothing — most keep the planned figure and `failure` says where the funds are, but a canceled stablecoin payout can report the settled outcome instead: `amount` carries what stayed in the balance, fees are zero because none were charged, and `net_amount` is 0 because nothing was delivered.
    public let netAmount: String
    /// Free-form notes attached by the payout creator, or `null` when none were provided. Maximum 255 characters.
    public let notes: Nullable<String>
    public let object: PostWithdrawalUpdatedPayloadDataObject
    /// Name of the entity processing the payout.
    public let payerName: Nullable<String>
    /// The saved payout method used. Requires payout:destination:read; null without it.
    public let payoutMethod: Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethod>
    /// Payout request ID, prefixed `cofr_`, returned by `POST /payouts`. Match it to the settled payout in `GET /payouts`. Returns `null` for payouts not created by `POST /payouts`.
    public let payoutRequestId: Nullable<String>
    /// How the payout was created. `automatic` means a scheduled auto-payout; `null` on payouts created before source tracking or through internal tooling.
    public let source: Nullable<PostWithdrawalUpdatedPayloadDataSource>
    /// Payout delivery speed.
    public let speed: PostWithdrawalUpdatedPayloadDataSpeed
    /// Current payout status.
    public let status: PostWithdrawalUpdatedPayloadDataStatus
    /// The finest machine phase under `status` — for example `awaiting_provider_acceptance` vs `in_transit` under `processing`, or the stablecoin conversion phase under `requested`. Informational vocabulary: values can be added without a version bump; `status` is the versioned contract.
    public let statusDetail: String
    /// ACH trace number the recipient's bank can use to locate this payout. Assigned when the payout is submitted to the bank, so it is `null` before then and on payouts not sent over ACH.
    public let traceCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        createdAt: Date,
        currency: String,
        destinationAmount: Nullable<String>,
        destinationCurrency: Nullable<String>,
        estimatedArrival: Nullable<Date>,
        exchangeRate: Nullable<Float>,
        failure: Nullable<PostWithdrawalUpdatedPayloadDataFailure>,
        feeAmount: String,
        feePaidBy: PostWithdrawalUpdatedPayloadDataFeePaidBy,
        id: String,
        markupFee: String,
        metadata: [String: String],
        netAmount: String,
        notes: Nullable<String>,
        object: PostWithdrawalUpdatedPayloadDataObject,
        payerName: Nullable<String>,
        payoutMethod: Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethod>,
        payoutRequestId: Nullable<String>,
        source: Nullable<PostWithdrawalUpdatedPayloadDataSource>,
        speed: PostWithdrawalUpdatedPayloadDataSpeed,
        status: PostWithdrawalUpdatedPayloadDataStatus,
        statusDetail: String,
        traceCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.destinationAmount = destinationAmount
        self.destinationCurrency = destinationCurrency
        self.estimatedArrival = estimatedArrival
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
        self.source = source
        self.speed = speed
        self.status = status
        self.statusDetail = statusDetail
        self.traceCode = traceCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.destinationAmount = try container.decode(Nullable<String>.self, forKey: .destinationAmount)
        self.destinationCurrency = try container.decode(Nullable<String>.self, forKey: .destinationCurrency)
        self.estimatedArrival = try container.decode(Nullable<Date>.self, forKey: .estimatedArrival)
        self.exchangeRate = try container.decode(Nullable<Float>.self, forKey: .exchangeRate)
        self.failure = try container.decode(Nullable<PostWithdrawalUpdatedPayloadDataFailure>.self, forKey: .failure)
        self.feeAmount = try container.decode(String.self, forKey: .feeAmount)
        self.feePaidBy = try container.decode(PostWithdrawalUpdatedPayloadDataFeePaidBy.self, forKey: .feePaidBy)
        self.id = try container.decode(String.self, forKey: .id)
        self.markupFee = try container.decode(String.self, forKey: .markupFee)
        self.metadata = try container.decode([String: String].self, forKey: .metadata)
        self.netAmount = try container.decode(String.self, forKey: .netAmount)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.object = try container.decode(PostWithdrawalUpdatedPayloadDataObject.self, forKey: .object)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.payoutMethod = try container.decode(Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethod>.self, forKey: .payoutMethod)
        self.payoutRequestId = try container.decode(Nullable<String>.self, forKey: .payoutRequestId)
        self.source = try container.decode(Nullable<PostWithdrawalUpdatedPayloadDataSource>.self, forKey: .source)
        self.speed = try container.decode(PostWithdrawalUpdatedPayloadDataSpeed.self, forKey: .speed)
        self.status = try container.decode(PostWithdrawalUpdatedPayloadDataStatus.self, forKey: .status)
        self.statusDetail = try container.decode(String.self, forKey: .statusDetail)
        self.traceCode = try container.decode(Nullable<String>.self, forKey: .traceCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.destinationAmount, forKey: .destinationAmount)
        try container.encode(self.destinationCurrency, forKey: .destinationCurrency)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.exchangeRate, forKey: .exchangeRate)
        try container.encode(self.failure, forKey: .failure)
        try container.encode(self.feeAmount, forKey: .feeAmount)
        try container.encode(self.feePaidBy, forKey: .feePaidBy)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.markupFee, forKey: .markupFee)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.netAmount, forKey: .netAmount)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.payerName, forKey: .payerName)
        try container.encode(self.payoutMethod, forKey: .payoutMethod)
        try container.encode(self.payoutRequestId, forKey: .payoutRequestId)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusDetail, forKey: .statusDetail)
        try container.encode(self.traceCode, forKey: .traceCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case destinationAmount = "destination_amount"
        case destinationCurrency = "destination_currency"
        case estimatedArrival = "estimated_arrival"
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
        case source
        case speed
        case status
        case statusDetail = "status_detail"
        case traceCode = "trace_code"
    }
}