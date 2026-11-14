import Foundation

public struct TradingOrder: Codable, Hashable, Sendable {
    /// Client order ID, prefixed `trdcloid_`, or `null` when the order was placed without one.
    public let clientOrderId: Nullable<String>
    /// When the order was placed, as an ISO 8601 timestamp, or `null` when the provider omits it.
    public let createdAt: Nullable<String>
    /// Hyperliquid-specific order details. Present on Hyperliquid orders, otherwise `null`.
    public let hyperliquid: Nullable<TradingHyperliquidOrder>
    /// Trading order ID, prefixed `trdord_`.
    public let id: String
    /// Market symbol on the provider, such as `ETH`.
    public let market: String
    public let object: TradingOrderObject
    public let orderType: TradingOrderOrderType
    /// Size when the order was placed, as a decimal string, or `null` when the provider omits it.
    public let originalSize: Nullable<String>
    /// Limit price in USD.
    public let price: Money
    /// The provider's own order ID, as a string.
    public let providerOrderId: Nullable<String>
    public let side: TradingOrderSide
    /// Remaining order size as a decimal string.
    public let size: String
    public let status: TradingOrderStatus
    /// When the status last changed, as an ISO 8601 timestamp, or `null` when the provider omits it.
    public let statusUpdatedAt: Nullable<String>
    /// How long the order stays active. `null` when the provider omits it or reports a policy outside the supported values.
    public let timeInForce: Nullable<TradingOrderTimeInForce>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clientOrderId: Nullable<String>,
        createdAt: Nullable<String>,
        hyperliquid: Nullable<TradingHyperliquidOrder>,
        id: String,
        market: String,
        object: TradingOrderObject,
        orderType: TradingOrderOrderType,
        originalSize: Nullable<String>,
        price: Money,
        providerOrderId: Nullable<String>,
        side: TradingOrderSide,
        size: String,
        status: TradingOrderStatus,
        statusUpdatedAt: Nullable<String>,
        timeInForce: Nullable<TradingOrderTimeInForce>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clientOrderId = clientOrderId
        self.createdAt = createdAt
        self.hyperliquid = hyperliquid
        self.id = id
        self.market = market
        self.object = object
        self.orderType = orderType
        self.originalSize = originalSize
        self.price = price
        self.providerOrderId = providerOrderId
        self.side = side
        self.size = size
        self.status = status
        self.statusUpdatedAt = statusUpdatedAt
        self.timeInForce = timeInForce
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientOrderId = try container.decode(Nullable<String>.self, forKey: .clientOrderId)
        self.createdAt = try container.decode(Nullable<String>.self, forKey: .createdAt)
        self.hyperliquid = try container.decode(Nullable<TradingHyperliquidOrder>.self, forKey: .hyperliquid)
        self.id = try container.decode(String.self, forKey: .id)
        self.market = try container.decode(String.self, forKey: .market)
        self.object = try container.decode(TradingOrderObject.self, forKey: .object)
        self.orderType = try container.decode(TradingOrderOrderType.self, forKey: .orderType)
        self.originalSize = try container.decode(Nullable<String>.self, forKey: .originalSize)
        self.price = try container.decode(Money.self, forKey: .price)
        self.providerOrderId = try container.decode(Nullable<String>.self, forKey: .providerOrderId)
        self.side = try container.decode(TradingOrderSide.self, forKey: .side)
        self.size = try container.decode(String.self, forKey: .size)
        self.status = try container.decode(TradingOrderStatus.self, forKey: .status)
        self.statusUpdatedAt = try container.decode(Nullable<String>.self, forKey: .statusUpdatedAt)
        self.timeInForce = try container.decode(Nullable<TradingOrderTimeInForce>.self, forKey: .timeInForce)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.clientOrderId, forKey: .clientOrderId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.hyperliquid, forKey: .hyperliquid)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.market, forKey: .market)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.orderType, forKey: .orderType)
        try container.encode(self.originalSize, forKey: .originalSize)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.providerOrderId, forKey: .providerOrderId)
        try container.encode(self.side, forKey: .side)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusUpdatedAt, forKey: .statusUpdatedAt)
        try container.encode(self.timeInForce, forKey: .timeInForce)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clientOrderId = "client_order_id"
        case createdAt = "created_at"
        case hyperliquid
        case id
        case market
        case object
        case orderType = "order_type"
        case originalSize = "original_size"
        case price
        case providerOrderId = "provider_order_id"
        case side
        case size
        case status
        case statusUpdatedAt = "status_updated_at"
        case timeInForce = "time_in_force"
    }
}