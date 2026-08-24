import Foundation

extension Requests {
    public struct CreateWithdrawalsRequest: Codable, Hashable, Sendable {
        /// Set to true to continue when the bank could not confirm the account holder's name, or false to be refused in that case so the creator can fix the account or link their bank first. Omitting the argument skips the warning gate — a client that cannot show the warning keeps its pre-gate behavior.
        public let acknowledgeBankWarning: Nullable<Bool>?
        /// The amount to withdraw in the specified currency
        public let amount: Double
        /// The ID of the company to withdraw from.
        public let companyId: String
        /// The currency that is being withdrawn.
        public let currency: Currencies
        /// A client-generated key that makes retries safe. Retrying with the same key returns the original withdrawal instead of creating a second one.
        public let idempotencyKey: Nullable<String>?
        /// The ID of the payout method to use for the withdrawal.
        public let payoutMethodId: Nullable<String>?
        /// Whether the platform covers the payout fees.
        public let platformCoversFees: Nullable<Bool>?
        /// The processing speed for the withdrawal. Either standard or instant.
        public let speed: Nullable<WithdrawalSpeeds>?
        /// Custom statement descriptor for the withdrawal. Must be between 5 and 22 characters and contain only alphanumeric characters.
        public let statementDescriptor: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            acknowledgeBankWarning: Nullable<Bool>? = nil,
            amount: Double,
            companyId: String,
            currency: Currencies,
            idempotencyKey: Nullable<String>? = nil,
            payoutMethodId: Nullable<String>? = nil,
            platformCoversFees: Nullable<Bool>? = nil,
            speed: Nullable<WithdrawalSpeeds>? = nil,
            statementDescriptor: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.acknowledgeBankWarning = acknowledgeBankWarning
            self.amount = amount
            self.companyId = companyId
            self.currency = currency
            self.idempotencyKey = idempotencyKey
            self.payoutMethodId = payoutMethodId
            self.platformCoversFees = platformCoversFees
            self.speed = speed
            self.statementDescriptor = statementDescriptor
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.acknowledgeBankWarning = try container.decodeNullableIfPresent(Bool.self, forKey: .acknowledgeBankWarning)
            self.amount = try container.decode(Double.self, forKey: .amount)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.currency = try container.decode(Currencies.self, forKey: .currency)
            self.idempotencyKey = try container.decodeNullableIfPresent(String.self, forKey: .idempotencyKey)
            self.payoutMethodId = try container.decodeNullableIfPresent(String.self, forKey: .payoutMethodId)
            self.platformCoversFees = try container.decodeNullableIfPresent(Bool.self, forKey: .platformCoversFees)
            self.speed = try container.decodeNullableIfPresent(WithdrawalSpeeds.self, forKey: .speed)
            self.statementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .statementDescriptor)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.acknowledgeBankWarning, forKey: .acknowledgeBankWarning)
            try container.encode(self.amount, forKey: .amount)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encode(self.currency, forKey: .currency)
            try container.encodeNullableIfPresent(self.idempotencyKey, forKey: .idempotencyKey)
            try container.encodeNullableIfPresent(self.payoutMethodId, forKey: .payoutMethodId)
            try container.encodeNullableIfPresent(self.platformCoversFees, forKey: .platformCoversFees)
            try container.encodeNullableIfPresent(self.speed, forKey: .speed)
            try container.encodeNullableIfPresent(self.statementDescriptor, forKey: .statementDescriptor)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case acknowledgeBankWarning = "acknowledge_bank_warning"
            case amount
            case companyId = "company_id"
            case currency
            case idempotencyKey = "idempotency_key"
            case payoutMethodId = "payout_method_id"
            case platformCoversFees = "platform_covers_fees"
            case speed
            case statementDescriptor = "statement_descriptor"
        }
    }
}