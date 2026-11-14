import Foundation

public struct Trade: Codable, Hashable, Sendable {
    /// The account that owns the trading wallet, prefixed `biz_`. `null` when a user owns it.
    public let accountId: Nullable<String>
    /// The USDT0 that a deposit, a spot buy, or a perpetual order short of trading balance, sends from the wallet, or the USDC that a withdraw sends back, in native units, as a decimal string. A withdraw of `all` shows what it sent once it finishes. `null` otherwise.
    public let amount: Nullable<String>
    /// The average fill price of the order, in USD, as a decimal string. For spot, the price the swap was quoted at. `null` when it is not known.
    public let averagePrice: Nullable<String>
    /// The caller's own ID for the trade, unique for the account. `null` when none was sent.
    public let clientOrderId: Nullable<String>
    /// When the trade ended as completed or failed, as an ISO 8601 timestamp. `null` before that.
    public let completedAt: Nullable<String>
    /// When the trade was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// ID Whop sends to the exchange with this trade's order, so the exchange's order updates can be matched to the trade. On Hyperliquid, the order's `cloid` reported in `orderUpdates`, a `0x`-prefixed 32-character hex string. Not the caller's `client_order_id`. `null` for a deposit or withdraw.
    public let externalOrderId: Nullable<String>
    /// Why the trade failed, or `null`.
    public let failureCode: Nullable<TradeFailureCode>
    /// The size the order filled, in units of the market, as a decimal string. For a spot buy, the amount the swap was quoted to deliver. `null` until it fills.
    public let filledSize: Nullable<String>
    /// Where the money is when the trade did not complete as asked: `wallet`, `trading_account`, or `unknown` while a person checks it. `null` otherwise.
    public let fundsLocation: Nullable<TradeFundsLocation>
    /// Trade ID, prefixed `tint_`.
    public let id: String
    /// `perpetual` or `spot` for an order, `perpetual` for a close. `null` for a deposit or withdraw.
    public let instrumentType: Nullable<TradeInstrumentType>
    /// The cross leverage set before an opening perpetual order. `null` for a spot order, close, deposit, withdraw or reduce-only order.
    public let leverage: Nullable<Int>
    /// The market, for example `BTC` for a perpetual or `XAUT` for spot. `null` for a deposit or withdraw.
    public let market: Nullable<String>
    /// Free-form string-to-string annotations stored on the trade.
    public let metadata: [String: JSONValue]
    public let object: TradeObject
    /// `market`, `limit`, `take_profit` or `stop_loss` for an order. `null` otherwise.
    public let orderType: Nullable<TradeOrderType>
    /// For a take-profit or stop-loss sent with an order, that order's trade, prefixed `tint_`. `null` otherwise.
    public let parentId: Nullable<String>
    /// The limit price of the order in USD. A market order's price is the mid price moved by `slippage_bps`; a take-profit or stop-loss's is the worst price its market order may fill at once triggered. `null` for other types.
    public let price: Nullable<Money>
    /// Whether the order can only reduce a position. `null` for other types.
    public let reduceOnly: Nullable<Bool>
    /// `buy` or `sell` for an order. `null` otherwise.
    public let side: Nullable<TradeSide>
    /// The order size in units of the market, as a decimal string. `null` for other types.
    public let size: Nullable<String>
    /// `pending` until the trade starts. `processing` while it runs, also while an order that did not fill sends the money it bridged in back to the wallet. `completed` when it did what was asked. `failed` when it did not; `funds_location` says where the money is. `in_review` when the outcome is unknown and a person checks it.
    public let status: TradeStatus
    /// `partial_fill` when the order filled only part of its size. `null` otherwise.
    public let statusDetail: Nullable<TradeStatusDetail>
    /// What a live trade is doing now: `depositing` while the wallet's USDT0 is being sent to the bridge, `landing` once sent and until it reaches the trading balance, `placing` while the order or close is with the venue, `withdrawing` while USDC heads back to the wallet, `returning` while money an unfilled order bridged in goes back. A spot order is `quoting` while the swap is priced, `swapping` while it runs onchain, and `crediting` until the new balance shows in the wallet. `null` once the trade is no longer pending or processing.
    public let step: Nullable<TradeStep>
    /// The price in USD at which a take-profit or stop-loss sends its market order. `null` for other orders and types.
    public let triggerPrice: Nullable<Money>
    /// `order` places one order: a perpetual order trades from the trading balance, a spot order swaps between USDT0 and the asset in the wallet. `deposit` bridges USDT0 from the wallet to the trading balance. `withdraw` sends USDC from the trading balance back to the wallet. `close` closes the whole position in one market with a market reduce-only order; when the account is then flat, a `withdraw` trade sends the trading balance back to the wallet.
    public let type: TradeType
    /// When the trade last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The user who owns the trading wallet, prefixed `user_`. `null` when an account owns it.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amount: Nullable<String>,
        averagePrice: Nullable<String>,
        clientOrderId: Nullable<String>,
        completedAt: Nullable<String>,
        createdAt: String,
        externalOrderId: Nullable<String>,
        failureCode: Nullable<TradeFailureCode>,
        filledSize: Nullable<String>,
        fundsLocation: Nullable<TradeFundsLocation>,
        id: String,
        instrumentType: Nullable<TradeInstrumentType>,
        leverage: Nullable<Int>,
        market: Nullable<String>,
        metadata: [String: JSONValue],
        object: TradeObject,
        orderType: Nullable<TradeOrderType>,
        parentId: Nullable<String>,
        price: Nullable<Money>,
        reduceOnly: Nullable<Bool>,
        side: Nullable<TradeSide>,
        size: Nullable<String>,
        status: TradeStatus,
        statusDetail: Nullable<TradeStatusDetail>,
        step: Nullable<TradeStep>,
        triggerPrice: Nullable<Money>,
        type: TradeType,
        updatedAt: String,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amount = amount
        self.averagePrice = averagePrice
        self.clientOrderId = clientOrderId
        self.completedAt = completedAt
        self.createdAt = createdAt
        self.externalOrderId = externalOrderId
        self.failureCode = failureCode
        self.filledSize = filledSize
        self.fundsLocation = fundsLocation
        self.id = id
        self.instrumentType = instrumentType
        self.leverage = leverage
        self.market = market
        self.metadata = metadata
        self.object = object
        self.orderType = orderType
        self.parentId = parentId
        self.price = price
        self.reduceOnly = reduceOnly
        self.side = side
        self.size = size
        self.status = status
        self.statusDetail = statusDetail
        self.step = step
        self.triggerPrice = triggerPrice
        self.type = type
        self.updatedAt = updatedAt
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decode(Nullable<String>.self, forKey: .amount)
        self.averagePrice = try container.decode(Nullable<String>.self, forKey: .averagePrice)
        self.clientOrderId = try container.decode(Nullable<String>.self, forKey: .clientOrderId)
        self.completedAt = try container.decode(Nullable<String>.self, forKey: .completedAt)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.externalOrderId = try container.decode(Nullable<String>.self, forKey: .externalOrderId)
        self.failureCode = try container.decode(Nullable<TradeFailureCode>.self, forKey: .failureCode)
        self.filledSize = try container.decode(Nullable<String>.self, forKey: .filledSize)
        self.fundsLocation = try container.decode(Nullable<TradeFundsLocation>.self, forKey: .fundsLocation)
        self.id = try container.decode(String.self, forKey: .id)
        self.instrumentType = try container.decode(Nullable<TradeInstrumentType>.self, forKey: .instrumentType)
        self.leverage = try container.decode(Nullable<Int>.self, forKey: .leverage)
        self.market = try container.decode(Nullable<String>.self, forKey: .market)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.object = try container.decode(TradeObject.self, forKey: .object)
        self.orderType = try container.decode(Nullable<TradeOrderType>.self, forKey: .orderType)
        self.parentId = try container.decode(Nullable<String>.self, forKey: .parentId)
        self.price = try container.decode(Nullable<Money>.self, forKey: .price)
        self.reduceOnly = try container.decode(Nullable<Bool>.self, forKey: .reduceOnly)
        self.side = try container.decode(Nullable<TradeSide>.self, forKey: .side)
        self.size = try container.decode(Nullable<String>.self, forKey: .size)
        self.status = try container.decode(TradeStatus.self, forKey: .status)
        self.statusDetail = try container.decode(Nullable<TradeStatusDetail>.self, forKey: .statusDetail)
        self.step = try container.decode(Nullable<TradeStep>.self, forKey: .step)
        self.triggerPrice = try container.decode(Nullable<Money>.self, forKey: .triggerPrice)
        self.type = try container.decode(TradeType.self, forKey: .type)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.averagePrice, forKey: .averagePrice)
        try container.encode(self.clientOrderId, forKey: .clientOrderId)
        try container.encode(self.completedAt, forKey: .completedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.externalOrderId, forKey: .externalOrderId)
        try container.encode(self.failureCode, forKey: .failureCode)
        try container.encode(self.filledSize, forKey: .filledSize)
        try container.encode(self.fundsLocation, forKey: .fundsLocation)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.instrumentType, forKey: .instrumentType)
        try container.encode(self.leverage, forKey: .leverage)
        try container.encode(self.market, forKey: .market)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.orderType, forKey: .orderType)
        try container.encode(self.parentId, forKey: .parentId)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.reduceOnly, forKey: .reduceOnly)
        try container.encode(self.side, forKey: .side)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusDetail, forKey: .statusDetail)
        try container.encode(self.step, forKey: .step)
        try container.encode(self.triggerPrice, forKey: .triggerPrice)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amount
        case averagePrice = "average_price"
        case clientOrderId = "client_order_id"
        case completedAt = "completed_at"
        case createdAt = "created_at"
        case externalOrderId = "external_order_id"
        case failureCode = "failure_code"
        case filledSize = "filled_size"
        case fundsLocation = "funds_location"
        case id
        case instrumentType = "instrument_type"
        case leverage
        case market
        case metadata
        case object
        case orderType = "order_type"
        case parentId = "parent_id"
        case price
        case reduceOnly = "reduce_only"
        case side
        case size
        case status
        case statusDetail = "status_detail"
        case step
        case triggerPrice = "trigger_price"
        case type
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}