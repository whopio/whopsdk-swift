import Foundation

extension Requests {
    public struct CreateAccountsRequest: Codable, Hashable, Sendable {
        /// A saved partner referral link code for this new business account. An existing primary user referral takes priority. Used with user tokens creating top-level accounts.
        public let affiliateCode: Nullable<String>?
        /// The blueprint App ID, prefixed `app_`. Creates a hosted website for the account and queues its deployment asynchronously; the Account response does not report deployment completion.
        public let blueprintId: Nullable<String>?
        /// The ISO 3166-1 alpha-2 country code where the account's business is located (e.g. `US`). Defaults to the parent account's country for subaccounts.
        public let country: String?
        /// Whether Whop assembles and files dispute evidence for this account. Enabling it opts into the success fee charged on disputes it wins. Requires payment:dispute. Omit to preserve the existing setting or creation default.
        public let disputeFighterEnabled: Bool?
        /// The email address of the account owner. Required when creating a subaccount.
        public let email: String?
        /// Your platform's own identifier for this subaccount, such as your user or store ID. Unique among your subaccounts: creating a second account with the same `external_id` and a different `email` returns a 409, unless `reassign_external_id` is `true`. Retrying with the same `email` and `external_id` returns the existing account. Subaccounts only.
        public let externalId: Nullable<String>?
        /// Arbitrary key/value metadata to store on the account. When `external_id` is not sent, an `external_id` key here sets `external_id` and follows its rules. It must be unique among your subaccounts unless `reassign_external_id` is `true`. It stays in `metadata` as sent. Changing it later does not change `external_id`.
        public let metadata: [String: JSONValue]?
        /// Whether payment orchestration is enabled for this account. Requires payout:account:update. Omit to preserve the existing setting or creation default.
        public let orchestrationEnabled: Bool?
        /// Pass `true` to move `external_id` to the new subaccount when another of your subaccounts already has it. Without it, that request returns a 409. The subaccount that had it is not deleted. It stays active with `external_id` set to `null`, and its `metadata` is unchanged. Requires `external_id`. Also requires the `company:update` permission on your platform account, in addition to `company:create_child`. Ignored when the same `email` already has the `external_id`, which returns that account.
        public let reassignExternalId: Bool?
        /// Whether Whop sends transactional emails to customers on behalf of the subaccount.
        public let sendCustomerEmails: Bool?
        /// The display name of the account. Defaults to `external_id` or the owner's email when omitted.
        public let title: String?
        /// The account's business website, as an `http` or `https` URL of at most 255 characters. Also added to the account's `social_links` as a `website` entry.
        public let website: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateCode: Nullable<String>? = nil,
            blueprintId: Nullable<String>? = nil,
            country: String? = nil,
            disputeFighterEnabled: Bool? = nil,
            email: String? = nil,
            externalId: Nullable<String>? = nil,
            metadata: [String: JSONValue]? = nil,
            orchestrationEnabled: Bool? = nil,
            reassignExternalId: Bool? = nil,
            sendCustomerEmails: Bool? = nil,
            title: String? = nil,
            website: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateCode = affiliateCode
            self.blueprintId = blueprintId
            self.country = country
            self.disputeFighterEnabled = disputeFighterEnabled
            self.email = email
            self.externalId = externalId
            self.metadata = metadata
            self.orchestrationEnabled = orchestrationEnabled
            self.reassignExternalId = reassignExternalId
            self.sendCustomerEmails = sendCustomerEmails
            self.title = title
            self.website = website
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
            self.blueprintId = try container.decodeNullableIfPresent(String.self, forKey: .blueprintId)
            self.country = try container.decodeIfPresent(String.self, forKey: .country)
            self.disputeFighterEnabled = try container.decodeIfPresent(Bool.self, forKey: .disputeFighterEnabled)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.orchestrationEnabled = try container.decodeIfPresent(Bool.self, forKey: .orchestrationEnabled)
            self.reassignExternalId = try container.decodeIfPresent(Bool.self, forKey: .reassignExternalId)
            self.sendCustomerEmails = try container.decodeIfPresent(Bool.self, forKey: .sendCustomerEmails)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.website = try container.decodeNullableIfPresent(String.self, forKey: .website)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
            try container.encodeNullableIfPresent(self.blueprintId, forKey: .blueprintId)
            try container.encodeIfPresent(self.country, forKey: .country)
            try container.encodeIfPresent(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.orchestrationEnabled, forKey: .orchestrationEnabled)
            try container.encodeIfPresent(self.reassignExternalId, forKey: .reassignExternalId)
            try container.encodeIfPresent(self.sendCustomerEmails, forKey: .sendCustomerEmails)
            try container.encodeIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.website, forKey: .website)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateCode = "affiliate_code"
            case blueprintId = "blueprint_id"
            case country
            case disputeFighterEnabled = "dispute_fighter_enabled"
            case email
            case externalId = "external_id"
            case metadata
            case orchestrationEnabled = "orchestration_enabled"
            case reassignExternalId = "reassign_external_id"
            case sendCustomerEmails = "send_customer_emails"
            case title
            case website
        }
    }
}