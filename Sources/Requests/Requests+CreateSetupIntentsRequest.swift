import Foundation

extension Requests {
    public struct CreateSetupIntentsRequest: Codable, Hashable, Sendable {
        /// The account to save the payment method for, prefixed `biz_`.
        public let accountId: String
        /// A confirmation token describing a payment method the buyer just supplied, collected by the payment elements in setup mode. Provide this or `payment_method_id`, not both. The buyer is resolved from the token's billing email, or from `email`, and may still have a step to complete — poll Retrieve setup status for what to do next.
        public let confirmationToken: Nullable<String>?
        /// The currency the saved payment method will be used with, as a lowercase ISO 4217 code. Controls which currency-specific payment methods are available. Defaults to `usd`.
        public let currency: Nullable<String>?
        /// Overrides the buyer email carried on the confirmation token, resolving or creating the user the method belongs to. Ignored unless `confirmation_token` is provided, and when the token was created by a signed-in buyer or the caller is the buyer.
        public let email: Nullable<String>?
        /// Custom metadata to attach to the setup intent. Returned on the setup intent and its webhooks.
        public let metadata: Nullable<[String: Nullable<String>]>?
        /// Who the saved payment method belongs to. Pass `account_id` to save it on the account itself, which needs `payment:charge` on the account. Pass your own user ID, prefixed `user_`, to save it on the authenticated user. Omit it to save it on the buyer: the caller when it is the buyer, otherwise the user the confirmation token names. Not available with `payment_method_id`, which keeps its current owner, or with `purpose`.
        public let ownerId: Nullable<String>?
        /// An existing payment method to re-verify and save, prefixed `payt_`. Provide this or `confirmation_token`, not both. Not available to a buyer credential.
        public let paymentMethodId: Nullable<String>?
        /// What the saved payment method will pay for. Set to `ads_billing` when saving a card to pay for Whop Ads on `account_id`: the card is verified by Whop Ads, the merchant that charges it, which helps minimize security declines on ad payments, and it requires `ad_campaign:create` on `account_id`. Omit it for any other payment method.
        public let purpose: Nullable<CreateSetupIntentsRequestPurpose>?
        /// Where the buyer continues after completing an off-site step. An absolute https URL without credentials, at most 2,048 characters.
        public let returnUrl: Nullable<String>?
        /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Applies to this setup only, and only while the buyer is present: ignored with `payment_method_id`, which re-verifies off session. Not available with `purpose: ads_billing`. Defaults to `frictionless_if_required`.
        public let threeDsLevel: Nullable<CreateSetupIntentsRequestThreeDsLevel>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            confirmationToken: Nullable<String>? = nil,
            currency: Nullable<String>? = nil,
            email: Nullable<String>? = nil,
            metadata: Nullable<[String: Nullable<String>]>? = nil,
            ownerId: Nullable<String>? = nil,
            paymentMethodId: Nullable<String>? = nil,
            purpose: Nullable<CreateSetupIntentsRequestPurpose>? = nil,
            returnUrl: Nullable<String>? = nil,
            threeDsLevel: Nullable<CreateSetupIntentsRequestThreeDsLevel>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.confirmationToken = confirmationToken
            self.currency = currency
            self.email = email
            self.metadata = metadata
            self.ownerId = ownerId
            self.paymentMethodId = paymentMethodId
            self.purpose = purpose
            self.returnUrl = returnUrl
            self.threeDsLevel = threeDsLevel
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.confirmationToken = try container.decodeNullableIfPresent(String.self, forKey: .confirmationToken)
            self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
            self.email = try container.decodeNullableIfPresent(String.self, forKey: .email)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .metadata)
            self.ownerId = try container.decodeNullableIfPresent(String.self, forKey: .ownerId)
            self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
            self.purpose = try container.decodeNullableIfPresent(CreateSetupIntentsRequestPurpose.self, forKey: .purpose)
            self.returnUrl = try container.decodeNullableIfPresent(String.self, forKey: .returnUrl)
            self.threeDsLevel = try container.decodeNullableIfPresent(CreateSetupIntentsRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.confirmationToken, forKey: .confirmationToken)
            try container.encodeNullableIfPresent(self.currency, forKey: .currency)
            try container.encodeNullableIfPresent(self.email, forKey: .email)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.ownerId, forKey: .ownerId)
            try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encodeNullableIfPresent(self.purpose, forKey: .purpose)
            try container.encodeNullableIfPresent(self.returnUrl, forKey: .returnUrl)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case confirmationToken = "confirmation_token"
            case currency
            case email
            case metadata
            case ownerId = "owner_id"
            case paymentMethodId = "payment_method_id"
            case purpose
            case returnUrl = "return_url"
            case threeDsLevel = "three_ds_level"
        }
    }
}