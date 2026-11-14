import Foundation

extension Requests {
    public struct SubmitFinancingApplicationsRequest: Codable, Hashable, Sendable {
        public let merchantAcceptance: SubmitFinancingApplicationsRequestMerchantAcceptance
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            merchantAcceptance: SubmitFinancingApplicationsRequestMerchantAcceptance,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.merchantAcceptance = merchantAcceptance
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.merchantAcceptance = try container.decode(SubmitFinancingApplicationsRequestMerchantAcceptance.self, forKey: .merchantAcceptance)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.merchantAcceptance, forKey: .merchantAcceptance)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case merchantAcceptance = "merchant_acceptance"
        }
    }
}