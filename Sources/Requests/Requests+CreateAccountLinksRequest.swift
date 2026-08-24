import Foundation

extension Requests {
    public struct CreateAccountLinksRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to generate the link for, starting with 'biz_'. Must be a sub-merchant of the API key's company.
        public let companyId: String
        /// The URL to redirect the user to if the session expires and needs to be re-authenticated, such as 'https://example.com/refresh'.
        public let refreshUrl: String
        /// The URL to redirect the user to when they want to return to your site, such as 'https://example.com/return'.
        public let returnUrl: String
        /// The purpose of the account link, such as hosted payouts portal or hosted KYC onboarding.
        public let useCase: AccountLinkUseCases
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: String,
            refreshUrl: String,
            returnUrl: String,
            useCase: AccountLinkUseCases,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.refreshUrl = refreshUrl
            self.returnUrl = returnUrl
            self.useCase = useCase
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.refreshUrl = try container.decode(String.self, forKey: .refreshUrl)
            self.returnUrl = try container.decode(String.self, forKey: .returnUrl)
            self.useCase = try container.decode(AccountLinkUseCases.self, forKey: .useCase)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encode(self.refreshUrl, forKey: .refreshUrl)
            try container.encode(self.returnUrl, forKey: .returnUrl)
            try container.encode(self.useCase, forKey: .useCase)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case refreshUrl = "refresh_url"
            case returnUrl = "return_url"
            case useCase = "use_case"
        }
    }
}