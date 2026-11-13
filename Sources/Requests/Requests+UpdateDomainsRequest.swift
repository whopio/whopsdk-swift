import Foundation

extension Requests {
    public struct UpdateDomainsRequest: Codable, Hashable, Sendable {
        /// Accept Apple Pay at checkout on the domain. It needs no other capability. Whop registers the domain with Apple: it stays `pending` until Apple answers, then turns `ready`, or `action_required` when Apple couldn't fetch the domain association file. Serve the file, then check the domain to register it again. Pass `null` to turn Apple Pay off: Whop removes the domain from Apple, and the domain stays, like releasing any other capability.
        public let applePay: Nullable<UpdateDomainsRequestApplePay>?
        /// Send and receive email on the domain. It needs `registration` or `subdomain`, so only a domain bought through Whop, or a subdomain of one in the same account, can have it. Whop publishes the DNS records and stays `pending` until its email provider verifies them, then turns `ready`. Pass `null` to remove email.
        public let email: Nullable<UpdateDomainsRequestEmail>?
        /// Replacement custom string keys and values.
        public let metadata: [String: String]?
        /// Track page views on the domain with the Whop pixel. It needs no other capability: it stays `pending` until the pixel records a page view, and turns `action_required` if it goes 7 days without one. Pass `null` to stop tracking.
        public let pixel: Nullable<UpdateDomainsRequestPixel>?
        /// Buy the domain through Whop, or transfer in a domain you own elsewhere with `auth_code`, then renew it every year and let Whop run its DNS. Pass `null` to release an unpaid or failed purchase, or to cancel a transfer while its current registrar can still stop it.
        public let registration: Nullable<UpdateDomainsRequestRegistration>?
        /// Use a subdomain of a domain this account bought through Whop, such as shop.example.com under example.com. It's the default when you add such a subdomain without a capability. Whop publishes its DNS records in the root domain's zone, so it needs nothing from you: it stays `pending` until the root domain is set up, then turns `ready`. Whop releases it, and its website, when the account no longer holds the root domain, and deletes it when the root domain leaves the account. Pass `null` to release it. Can't be combined with `verification` or `registration`.
        public let subdomain: Nullable<UpdateDomainsRequestSubdomain>?
        /// Move a domain registered through Whop to another Whop account. Turning it on returns a code in `transfer.code`; the receiving account enters it as `registration.auth_code` on its own copy of the domain. Whop then removes the domain's email, email addresses and Apple Pay from this account, moves the registration with its expiry, stops charging this account to renew it, and removes the domain from this account. Pass `null` to turn it off and invalidate the code, until another account has entered it.
        public let transfer: Nullable<UpdateDomainsRequestTransfer>?
        /// Prove you control the domain's DNS: Whop returns a TXT record to publish in `issues`, and whoever publishes it owns the domain on Whop. Pass `null` to release it. Can't be combined with `registration`.
        public let verification: Nullable<UpdateDomainsRequestVerification>?
        /// Serve a Whop website on the domain. Pass `null` to stop serving it; the domain keeps its other capabilities.
        public let website: Nullable<UpdateDomainsRequestWebsite>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            applePay: Nullable<UpdateDomainsRequestApplePay>? = nil,
            email: Nullable<UpdateDomainsRequestEmail>? = nil,
            metadata: [String: String]? = nil,
            pixel: Nullable<UpdateDomainsRequestPixel>? = nil,
            registration: Nullable<UpdateDomainsRequestRegistration>? = nil,
            subdomain: Nullable<UpdateDomainsRequestSubdomain>? = nil,
            transfer: Nullable<UpdateDomainsRequestTransfer>? = nil,
            verification: Nullable<UpdateDomainsRequestVerification>? = nil,
            website: Nullable<UpdateDomainsRequestWebsite>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.applePay = applePay
            self.email = email
            self.metadata = metadata
            self.pixel = pixel
            self.registration = registration
            self.subdomain = subdomain
            self.transfer = transfer
            self.verification = verification
            self.website = website
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.applePay = try container.decodeNullableIfPresent(UpdateDomainsRequestApplePay.self, forKey: .applePay)
            self.email = try container.decodeNullableIfPresent(UpdateDomainsRequestEmail.self, forKey: .email)
            self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
            self.pixel = try container.decodeNullableIfPresent(UpdateDomainsRequestPixel.self, forKey: .pixel)
            self.registration = try container.decodeNullableIfPresent(UpdateDomainsRequestRegistration.self, forKey: .registration)
            self.subdomain = try container.decodeNullableIfPresent(UpdateDomainsRequestSubdomain.self, forKey: .subdomain)
            self.transfer = try container.decodeNullableIfPresent(UpdateDomainsRequestTransfer.self, forKey: .transfer)
            self.verification = try container.decodeNullableIfPresent(UpdateDomainsRequestVerification.self, forKey: .verification)
            self.website = try container.decodeNullableIfPresent(UpdateDomainsRequestWebsite.self, forKey: .website)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.applePay, forKey: .applePay)
            try container.encodeNullableIfPresent(self.email, forKey: .email)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.pixel, forKey: .pixel)
            try container.encodeNullableIfPresent(self.registration, forKey: .registration)
            try container.encodeNullableIfPresent(self.subdomain, forKey: .subdomain)
            try container.encodeNullableIfPresent(self.transfer, forKey: .transfer)
            try container.encodeNullableIfPresent(self.verification, forKey: .verification)
            try container.encodeNullableIfPresent(self.website, forKey: .website)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case applePay = "apple_pay"
            case email
            case metadata
            case pixel
            case registration
            case subdomain
            case transfer
            case verification
            case website
        }
    }
}