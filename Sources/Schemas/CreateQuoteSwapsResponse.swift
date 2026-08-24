import Foundation

public struct CreateQuoteSwapsResponse: Codable, Hashable, Sendable {
    /// Source token amount used for the quote.
    public let amountIn: String
    /// Estimated destination token amount.
    public let amountOut: String
    /// Minimum destination amount after slippage.
    public let amountOutMin: String?
    /// Estimated bridge fee for cross-chain swaps.
    public let bridgeFee: Nullable<String>?
    /// Estimated time for the swap to complete.
    public let estimatedDurationSeconds: Nullable<Int>?
    /// Whop fee in basis points.
    public let feeBps: Int
    /// Source wallet address used for the quote.
    public let fromAddress: Nullable<String>?
    /// Resolved source token details.
    public let fromToken: [String: JSONValue]
    /// Metadata from the request.
    public let metadata: [String: JSONValue]
    public let object: CreateQuoteSwapsResponseObject
    /// Quoted exchange rate.
    public let rate: String
    /// Whether the source token needs approval before swapping.
    public let requiresTokenApproval: Nullable<Bool>?
    /// Destination wallet address used for the quote.
    public let toAddress: Nullable<String>?
    /// Resolved destination token details.
    public let toToken: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountIn: String,
        amountOut: String,
        amountOutMin: String? = nil,
        bridgeFee: Nullable<String>? = nil,
        estimatedDurationSeconds: Nullable<Int>? = nil,
        feeBps: Int,
        fromAddress: Nullable<String>? = nil,
        fromToken: [String: JSONValue],
        metadata: [String: JSONValue],
        object: CreateQuoteSwapsResponseObject,
        rate: String,
        requiresTokenApproval: Nullable<Bool>? = nil,
        toAddress: Nullable<String>? = nil,
        toToken: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountIn = amountIn
        self.amountOut = amountOut
        self.amountOutMin = amountOutMin
        self.bridgeFee = bridgeFee
        self.estimatedDurationSeconds = estimatedDurationSeconds
        self.feeBps = feeBps
        self.fromAddress = fromAddress
        self.fromToken = fromToken
        self.metadata = metadata
        self.object = object
        self.rate = rate
        self.requiresTokenApproval = requiresTokenApproval
        self.toAddress = toAddress
        self.toToken = toToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountIn = try container.decode(String.self, forKey: .amountIn)
        self.amountOut = try container.decode(String.self, forKey: .amountOut)
        self.amountOutMin = try container.decodeIfPresent(String.self, forKey: .amountOutMin)
        self.bridgeFee = try container.decodeNullableIfPresent(String.self, forKey: .bridgeFee)
        self.estimatedDurationSeconds = try container.decodeNullableIfPresent(Int.self, forKey: .estimatedDurationSeconds)
        self.feeBps = try container.decode(Int.self, forKey: .feeBps)
        self.fromAddress = try container.decodeNullableIfPresent(String.self, forKey: .fromAddress)
        self.fromToken = try container.decode([String: JSONValue].self, forKey: .fromToken)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.object = try container.decode(CreateQuoteSwapsResponseObject.self, forKey: .object)
        self.rate = try container.decode(String.self, forKey: .rate)
        self.requiresTokenApproval = try container.decodeNullableIfPresent(Bool.self, forKey: .requiresTokenApproval)
        self.toAddress = try container.decodeNullableIfPresent(String.self, forKey: .toAddress)
        self.toToken = try container.decode([String: JSONValue].self, forKey: .toToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amountIn, forKey: .amountIn)
        try container.encode(self.amountOut, forKey: .amountOut)
        try container.encodeIfPresent(self.amountOutMin, forKey: .amountOutMin)
        try container.encodeNullableIfPresent(self.bridgeFee, forKey: .bridgeFee)
        try container.encodeNullableIfPresent(self.estimatedDurationSeconds, forKey: .estimatedDurationSeconds)
        try container.encode(self.feeBps, forKey: .feeBps)
        try container.encodeNullableIfPresent(self.fromAddress, forKey: .fromAddress)
        try container.encode(self.fromToken, forKey: .fromToken)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.rate, forKey: .rate)
        try container.encodeNullableIfPresent(self.requiresTokenApproval, forKey: .requiresTokenApproval)
        try container.encodeNullableIfPresent(self.toAddress, forKey: .toAddress)
        try container.encode(self.toToken, forKey: .toToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountIn = "amount_in"
        case amountOut = "amount_out"
        case amountOutMin = "amount_out_min"
        case bridgeFee = "bridge_fee"
        case estimatedDurationSeconds = "estimated_duration_seconds"
        case feeBps = "fee_bps"
        case fromAddress = "from_address"
        case fromToken = "from_token"
        case metadata
        case object
        case rate
        case requiresTokenApproval = "requires_token_approval"
        case toAddress = "to_address"
        case toToken = "to_token"
    }
}