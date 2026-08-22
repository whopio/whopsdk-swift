import Foundation

public struct CreateSwapsResponse: Codable, Hashable, Sendable {
    /// Account ID that owns the wallet used for the swap.
    public let accountId: String
    /// Fiat pairs only: amount of the source currency converted. Null while a stablecoin repayment is processing.
    public let amountIn: Nullable<Double>?
    /// Fiat pairs only: amount credited in the destination currency. Null while a stablecoin repayment is processing.
    public let amountOut: Nullable<Double>?
    /// Expected destination token amount.
    public let amountOutExpected: String?
    /// Minimum destination amount after slippage.
    public let amountOutMin: String?
    /// Fiat pairs only: the source currency.
    public let fromToken: Nullable<CreateSwapsResponseFromToken>?
    /// Swap ID. Poll `GET /swaps/:id` for status.
    public let id: String?
    public let object: CreateSwapsResponseObject
    /// Quoted exchange rate used to create the swap.
    public let rate: String?
    /// Swap status. Crypto swaps start `queued`; fiat conversions return `complete`, or `working` while a stablecoin repayment settles.
    public let status: CreateSwapsResponseStatus
    /// Destination chain for the swap.
    public let toChain: String?
    /// Fiat pairs only: the destination currency.
    public let toToken: Nullable<CreateSwapsResponseToToken>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        amountIn: Nullable<Double>? = nil,
        amountOut: Nullable<Double>? = nil,
        amountOutExpected: String? = nil,
        amountOutMin: String? = nil,
        fromToken: Nullable<CreateSwapsResponseFromToken>? = nil,
        id: String? = nil,
        object: CreateSwapsResponseObject,
        rate: String? = nil,
        status: CreateSwapsResponseStatus,
        toChain: String? = nil,
        toToken: Nullable<CreateSwapsResponseToToken>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amountIn = amountIn
        self.amountOut = amountOut
        self.amountOutExpected = amountOutExpected
        self.amountOutMin = amountOutMin
        self.fromToken = fromToken
        self.id = id
        self.object = object
        self.rate = rate
        self.status = status
        self.toChain = toChain
        self.toToken = toToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.amountIn = try container.decodeNullableIfPresent(Double.self, forKey: .amountIn)
        self.amountOut = try container.decodeNullableIfPresent(Double.self, forKey: .amountOut)
        self.amountOutExpected = try container.decodeIfPresent(String.self, forKey: .amountOutExpected)
        self.amountOutMin = try container.decodeIfPresent(String.self, forKey: .amountOutMin)
        self.fromToken = try container.decodeNullableIfPresent(CreateSwapsResponseFromToken.self, forKey: .fromToken)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.object = try container.decode(CreateSwapsResponseObject.self, forKey: .object)
        self.rate = try container.decodeIfPresent(String.self, forKey: .rate)
        self.status = try container.decode(CreateSwapsResponseStatus.self, forKey: .status)
        self.toChain = try container.decodeIfPresent(String.self, forKey: .toChain)
        self.toToken = try container.decodeNullableIfPresent(CreateSwapsResponseToToken.self, forKey: .toToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.amountIn, forKey: .amountIn)
        try container.encodeNullableIfPresent(self.amountOut, forKey: .amountOut)
        try container.encodeIfPresent(self.amountOutExpected, forKey: .amountOutExpected)
        try container.encodeIfPresent(self.amountOutMin, forKey: .amountOutMin)
        try container.encodeNullableIfPresent(self.fromToken, forKey: .fromToken)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encodeIfPresent(self.rate, forKey: .rate)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.toChain, forKey: .toChain)
        try container.encodeNullableIfPresent(self.toToken, forKey: .toToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amountIn = "amount_in"
        case amountOut = "amount_out"
        case amountOutExpected = "amount_out_expected"
        case amountOutMin = "amount_out_min"
        case fromToken = "from_token"
        case id
        case object
        case rate
        case status
        case toChain = "to_chain"
        case toToken = "to_token"
    }
}