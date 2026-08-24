import Foundation

extension Requests {
    public struct CreateFeeMarkupsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to create or update the fee markup for.
        public let companyId: String
        /// The type of fee this markup applies to, such as processing or platform fees.
        public let feeType: FeeMarkupTypes
        /// The fixed fee amount in USD to charge per transaction. Must be between 0 and 50.
        public let fixedFeeUsd: Nullable<Double>?
        /// Custom key-value metadata to attach to this fee markup.
        public let metadata: Nullable<[String: JSONValue]>?
        /// Internal notes about this fee markup for record-keeping purposes.
        public let notes: Nullable<String>?
        /// The percentage fee to charge per transaction. Must be between 0 and 25.
        public let percentageFee: Nullable<Double>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: String,
            feeType: FeeMarkupTypes,
            fixedFeeUsd: Nullable<Double>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            notes: Nullable<String>? = nil,
            percentageFee: Nullable<Double>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.feeType = feeType
            self.fixedFeeUsd = fixedFeeUsd
            self.metadata = metadata
            self.notes = notes
            self.percentageFee = percentageFee
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.feeType = try container.decode(FeeMarkupTypes.self, forKey: .feeType)
            self.fixedFeeUsd = try container.decodeNullableIfPresent(Double.self, forKey: .fixedFeeUsd)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
            self.percentageFee = try container.decodeNullableIfPresent(Double.self, forKey: .percentageFee)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encode(self.feeType, forKey: .feeType)
            try container.encodeNullableIfPresent(self.fixedFeeUsd, forKey: .fixedFeeUsd)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.notes, forKey: .notes)
            try container.encodeNullableIfPresent(self.percentageFee, forKey: .percentageFee)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case feeType = "fee_type"
            case fixedFeeUsd = "fixed_fee_usd"
            case metadata
            case notes
            case percentageFee = "percentage_fee"
        }
    }
}