import Foundation

extension Requests {
    public struct CreateQuoteSwapsRequest: Codable, Hashable, Sendable {
        /// Fiat pairs only: business account to quote the swap for, prefixed `biz_`. Requires a credential with `payout:transfer_funds` on that account. Provide this, `user_id`, or neither for a public quote.
        public let accountId: String?
        /// Source token amount.
        public let amount: String
        /// Source wallet address used for the quote.
        public let fromAddress: Nullable<String>?
        /// Source chain name or chain ID. Defaults to the source token's chain when omitted.
        public let fromChain: Nullable<CreateQuoteSwapsRequestFromChain>?
        /// Source token contract address or ticker symbol, such as "USDT".
        public let fromToken: String
        /// Metadata to include with the quote response.
        public let metadata: [String: JSONValue]?
        /// Maximum slippage tolerance in basis points.
        public let slippageBps: Nullable<Int>?
        /// Destination wallet address used for the quote.
        public let toAddress: Nullable<String>?
        /// Destination chain name or chain ID. Defaults to the destination token's chain when omitted.
        public let toChain: Nullable<CreateQuoteSwapsRequestToChain>?
        /// Destination token contract address or ticker symbol, such as "XAUT".
        public let toToken: String
        /// Fiat pairs only: the caller's own user ID, prefixed `user_`, to quote the swap for their personal account. Provide this or `account_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            amount: String,
            fromAddress: Nullable<String>? = nil,
            fromChain: Nullable<CreateQuoteSwapsRequestFromChain>? = nil,
            fromToken: String,
            metadata: [String: JSONValue]? = nil,
            slippageBps: Nullable<Int>? = nil,
            toAddress: Nullable<String>? = nil,
            toChain: Nullable<CreateQuoteSwapsRequestToChain>? = nil,
            toToken: String,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.amount = amount
            self.fromAddress = fromAddress
            self.fromChain = fromChain
            self.fromToken = fromToken
            self.metadata = metadata
            self.slippageBps = slippageBps
            self.toAddress = toAddress
            self.toChain = toChain
            self.toToken = toToken
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.amount = try container.decode(String.self, forKey: .amount)
            self.fromAddress = try container.decodeNullableIfPresent(String.self, forKey: .fromAddress)
            self.fromChain = try container.decodeNullableIfPresent(CreateQuoteSwapsRequestFromChain.self, forKey: .fromChain)
            self.fromToken = try container.decode(String.self, forKey: .fromToken)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.slippageBps = try container.decodeNullableIfPresent(Int.self, forKey: .slippageBps)
            self.toAddress = try container.decodeNullableIfPresent(String.self, forKey: .toAddress)
            self.toChain = try container.decodeNullableIfPresent(CreateQuoteSwapsRequestToChain.self, forKey: .toChain)
            self.toToken = try container.decode(String.self, forKey: .toToken)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.amount, forKey: .amount)
            try container.encodeNullableIfPresent(self.fromAddress, forKey: .fromAddress)
            try container.encodeNullableIfPresent(self.fromChain, forKey: .fromChain)
            try container.encode(self.fromToken, forKey: .fromToken)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.slippageBps, forKey: .slippageBps)
            try container.encodeNullableIfPresent(self.toAddress, forKey: .toAddress)
            try container.encodeNullableIfPresent(self.toChain, forKey: .toChain)
            try container.encode(self.toToken, forKey: .toToken)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case amount
            case fromAddress = "from_address"
            case fromChain = "from_chain"
            case fromToken = "from_token"
            case metadata
            case slippageBps = "slippage_bps"
            case toAddress = "to_address"
            case toChain = "to_chain"
            case toToken = "to_token"
            case userId = "user_id"
        }
    }
}