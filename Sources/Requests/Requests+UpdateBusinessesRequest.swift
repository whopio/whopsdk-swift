import Foundation

extension Requests {
    public struct UpdateBusinessesRequest: Codable, Hashable, Sendable {
        /// Annual projected card and BNPL processing combined, in USD.
        public let annualProcessingUsd: String?
        /// How the partner closed this business. Send it on its own to save it; the response is then the business ID and the saved reason.
        public let dealClosedReason: Nullable<String>?
        /// Remove unaccepted projections and invalidate the offer. The original CPA term is retained if projections are later added again.
        public let withdrawProjections: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            annualProcessingUsd: String? = nil,
            dealClosedReason: Nullable<String>? = nil,
            withdrawProjections: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.annualProcessingUsd = annualProcessingUsd
            self.dealClosedReason = dealClosedReason
            self.withdrawProjections = withdrawProjections
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.annualProcessingUsd = try container.decodeIfPresent(String.self, forKey: .annualProcessingUsd)
            self.dealClosedReason = try container.decodeNullableIfPresent(String.self, forKey: .dealClosedReason)
            self.withdrawProjections = try container.decodeIfPresent(Bool.self, forKey: .withdrawProjections)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.annualProcessingUsd, forKey: .annualProcessingUsd)
            try container.encodeNullableIfPresent(self.dealClosedReason, forKey: .dealClosedReason)
            try container.encodeIfPresent(self.withdrawProjections, forKey: .withdrawProjections)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case annualProcessingUsd = "annual_processing_usd"
            case dealClosedReason = "deal_closed_reason"
            case withdrawProjections = "withdraw_projections"
        }
    }
}