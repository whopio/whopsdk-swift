import Foundation

extension Requests {
    public struct CreateSwapsRequest: Codable, Hashable, Sendable {
        /// Business account that makes the swap, prefixed `biz_`. Provide this or `user_id`.
        public let accountId: String?
        /// Source token amount. Required for a crypto pair: a decimal amount, or `all` to swap the whole from_token balance in the account's wallet, read from the chain when the swap is created (any token but USDT). An amount above that balance is rejected when the balance can be read. For fiat pairs: the amount of from_token to convert; omit (along with to_amount) to repay the full negative to_token balance instead.
        public let amount: Nullable<String>?
        /// Source chain name or chain ID. Defaults to the source token's chain when omitted.
        public let fromChain: Nullable<CreateSwapsRequestFromChain>?
        /// Source token contract address or ticker symbol, such as "USDT".
        public let fromToken: String
        /// Maximum slippage tolerance in basis points.
        public let slippageBps: Nullable<Int>?
        /// Fiat pairs only: sizes a partial repayment of the negative to_token balance, denominated in to_token. Must not exceed the debt. Mutually exclusive with amount.
        public let toAmount: Nullable<String>?
        /// Destination chain name or chain ID. Defaults to the destination token's chain when omitted.
        public let toChain: Nullable<CreateSwapsRequestToChain>?
        /// Destination token contract address or ticker symbol, such as "XAUT".
        public let toToken: String
        /// The caller's own user ID, prefixed `user_`, to swap in their personal account. Provide this or `account_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            amount: Nullable<String>? = nil,
            fromChain: Nullable<CreateSwapsRequestFromChain>? = nil,
            fromToken: String,
            slippageBps: Nullable<Int>? = nil,
            toAmount: Nullable<String>? = nil,
            toChain: Nullable<CreateSwapsRequestToChain>? = nil,
            toToken: String,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.amount = amount
            self.fromChain = fromChain
            self.fromToken = fromToken
            self.slippageBps = slippageBps
            self.toAmount = toAmount
            self.toChain = toChain
            self.toToken = toToken
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.amount = try container.decodeNullableIfPresent(String.self, forKey: .amount)
            self.fromChain = try container.decodeNullableIfPresent(CreateSwapsRequestFromChain.self, forKey: .fromChain)
            self.fromToken = try container.decode(String.self, forKey: .fromToken)
            self.slippageBps = try container.decodeNullableIfPresent(Int.self, forKey: .slippageBps)
            self.toAmount = try container.decodeNullableIfPresent(String.self, forKey: .toAmount)
            self.toChain = try container.decodeNullableIfPresent(CreateSwapsRequestToChain.self, forKey: .toChain)
            self.toToken = try container.decode(String.self, forKey: .toToken)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.amount, forKey: .amount)
            try container.encodeNullableIfPresent(self.fromChain, forKey: .fromChain)
            try container.encode(self.fromToken, forKey: .fromToken)
            try container.encodeNullableIfPresent(self.slippageBps, forKey: .slippageBps)
            try container.encodeNullableIfPresent(self.toAmount, forKey: .toAmount)
            try container.encodeNullableIfPresent(self.toChain, forKey: .toChain)
            try container.encode(self.toToken, forKey: .toToken)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case amount
            case fromChain = "from_chain"
            case fromToken = "from_token"
            case slippageBps = "slippage_bps"
            case toAmount = "to_amount"
            case toChain = "to_chain"
            case toToken = "to_token"
            case userId = "user_id"
        }
    }
}