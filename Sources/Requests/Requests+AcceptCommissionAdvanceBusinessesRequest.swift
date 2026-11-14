import Foundation

extension Requests {
    public struct AcceptCommissionAdvanceBusinessesRequest: Codable, Hashable, Sendable {
        public let acknowledgments: [AcceptCommissionAdvanceBusinessesRequestAcknowledgmentsItem]
        /// Reviewed payment amount in USD.
        public let expectedAmountUsd: String
        /// Signed offer token returned by the partner business response. Requires partner:commission_advance:accept permission to retrieve.
        public let offerToken: String
        /// Reviewed CPA terms version.
        public let termsVersion: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            acknowledgments: [AcceptCommissionAdvanceBusinessesRequestAcknowledgmentsItem],
            expectedAmountUsd: String,
            offerToken: String,
            termsVersion: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.acknowledgments = acknowledgments
            self.expectedAmountUsd = expectedAmountUsd
            self.offerToken = offerToken
            self.termsVersion = termsVersion
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.acknowledgments = try container.decode([AcceptCommissionAdvanceBusinessesRequestAcknowledgmentsItem].self, forKey: .acknowledgments)
            self.expectedAmountUsd = try container.decode(String.self, forKey: .expectedAmountUsd)
            self.offerToken = try container.decode(String.self, forKey: .offerToken)
            self.termsVersion = try container.decode(String.self, forKey: .termsVersion)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.acknowledgments, forKey: .acknowledgments)
            try container.encode(self.expectedAmountUsd, forKey: .expectedAmountUsd)
            try container.encode(self.offerToken, forKey: .offerToken)
            try container.encode(self.termsVersion, forKey: .termsVersion)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case acknowledgments
            case expectedAmountUsd = "expected_amount_usd"
            case offerToken = "offer_token"
            case termsVersion = "terms_version"
        }
    }
}