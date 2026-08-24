import Foundation

extension Requests {
    public struct CreateCompaniesRequest: Codable, Hashable, Sendable {
        /// The country the company is located in. Defaults to the parent company's country for connected accounts, or the owner's IP-derived country.
        public let country: Nullable<Countries>?
        /// A promotional pitch displayed to potential customers on the company's store page.
        public let description: Nullable<String>?
        /// The email address of the user who will own the connected account. Required when parent_company_id is provided.
        public let email: Nullable<String>?
        /// The company's logo image. Accepts PNG, JPEG, or GIF format.
        public let logo: Nullable<CreateCompaniesRequestLogo>?
        /// A key-value JSON object of custom metadata to store on the company.
        public let metadata: Nullable<[String: JSONValue]>?
        /// The unique identifier of the parent platform company. When provided, creates a connected account under that platform. Omit to create a company for the current user.
        public let parentCompanyId: Nullable<String>?
        /// Whether Whop sends transactional emails to customers on behalf of this company. Only applies when creating a connected account.
        public let sendCustomerEmails: Nullable<Bool>?
        /// The display name of the company shown to customers.
        public let title: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            country: Nullable<Countries>? = nil,
            description: Nullable<String>? = nil,
            email: Nullable<String>? = nil,
            logo: Nullable<CreateCompaniesRequestLogo>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            parentCompanyId: Nullable<String>? = nil,
            sendCustomerEmails: Nullable<Bool>? = nil,
            title: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.country = country
            self.description = description
            self.email = email
            self.logo = logo
            self.metadata = metadata
            self.parentCompanyId = parentCompanyId
            self.sendCustomerEmails = sendCustomerEmails
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.country = try container.decodeNullableIfPresent(Countries.self, forKey: .country)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
            self.logo = try container.decodeNullableIfPresent(CreateCompaniesRequestLogo.self, forKey: .logo)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.parentCompanyId = try container.decodeNullableIfPresent(String.self, forKey: .parentCompanyId)
            self.sendCustomerEmails = try container.decodeNullableIfPresent(Bool.self, forKey: .sendCustomerEmails)
            self.title = try container.decode(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.country, forKey: .country)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.email, forKey: .email)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.parentCompanyId, forKey: .parentCompanyId)
            try container.encodeNullableIfPresent(self.sendCustomerEmails, forKey: .sendCustomerEmails)
            try container.encode(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case country
            case description
            case email
            case logo
            case metadata
            case parentCompanyId = "parent_company_id"
            case sendCustomerEmails = "send_customer_emails"
            case title
        }
    }
}