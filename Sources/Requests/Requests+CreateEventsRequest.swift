import Foundation

extension Requests {
    public struct CreateEventsRequest: Codable, Hashable, Sendable {
        /// The account to associate with this event.
        public let accountId: String
        /// Where the event originated.
        public let actionSource: Nullable<CreateEventsRequestActionSource>?
        /// The build of the hosted app that served the page where the event occurred.
        public let appBuildId: Nullable<String>?
        /// The hosted app that served the page where the event occurred.
        public let appId: Nullable<String>?
        /// Tracking and attribution context.
        public let context: Nullable<CreateEventsRequestContext>?
        /// ISO 4217 currency code.
        public let currency: Nullable<CreateEventsRequestCurrency>?
        /// Custom event name when event_name is 'custom'. Maximum 35 chars for this value.
        public let customName: Nullable<String>?
        /// For 'leave' events: milliseconds the visitor spent on the page.
        public let duration: Nullable<Int>?
        /// Client-provided identifier for deduplication. Generated if omitted.
        public let eventId: Nullable<String>?
        /// The type of event.
        ///
        /// Use a standard event (lead, submit_application, contact, complete_registration, schedule, view_content, add_to_cart, initiate_checkout) or pass your own name directly for a custom event.
        public let eventName: String
        /// When the event occurred. Defaults to now.
        public let eventTime: Nullable<Date>?
        /// The product associated with the event.
        public let productId: Nullable<String>?
        /// The referring URL.
        public let referrerUrl: Nullable<String>?
        /// For 'page' events: true when the page was restored from the back/forward cache.
        public let resumed: Nullable<Bool>?
        /// For 'identify' events: where the identity was captured (url, form, manual, iframe).
        public let source: Nullable<String>?
        /// For 'page' events: the document title.
        public let title: Nullable<String>?
        /// The URL where the event occurred.
        public let url: Nullable<String>?
        /// User identity and profile data.
        public let user: Nullable<CreateEventsRequestUser>?
        /// Monetary value associated with the event.
        public let value: Nullable<Double>?
        /// The variant associated with the event.
        public let variantId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            actionSource: Nullable<CreateEventsRequestActionSource>? = nil,
            appBuildId: Nullable<String>? = nil,
            appId: Nullable<String>? = nil,
            context: Nullable<CreateEventsRequestContext>? = nil,
            currency: Nullable<CreateEventsRequestCurrency>? = nil,
            customName: Nullable<String>? = nil,
            duration: Nullable<Int>? = nil,
            eventId: Nullable<String>? = nil,
            eventName: String,
            eventTime: Nullable<Date>? = nil,
            productId: Nullable<String>? = nil,
            referrerUrl: Nullable<String>? = nil,
            resumed: Nullable<Bool>? = nil,
            source: Nullable<String>? = nil,
            title: Nullable<String>? = nil,
            url: Nullable<String>? = nil,
            user: Nullable<CreateEventsRequestUser>? = nil,
            value: Nullable<Double>? = nil,
            variantId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.actionSource = actionSource
            self.appBuildId = appBuildId
            self.appId = appId
            self.context = context
            self.currency = currency
            self.customName = customName
            self.duration = duration
            self.eventId = eventId
            self.eventName = eventName
            self.eventTime = eventTime
            self.productId = productId
            self.referrerUrl = referrerUrl
            self.resumed = resumed
            self.source = source
            self.title = title
            self.url = url
            self.user = user
            self.value = value
            self.variantId = variantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.actionSource = try container.decodeNullableIfPresent(CreateEventsRequestActionSource.self, forKey: .actionSource)
            self.appBuildId = try container.decodeNullableIfPresent(String.self, forKey: .appBuildId)
            self.appId = try container.decodeNullableIfPresent(String.self, forKey: .appId)
            self.context = try container.decodeNullableIfPresent(CreateEventsRequestContext.self, forKey: .context)
            self.currency = try container.decodeNullableIfPresent(CreateEventsRequestCurrency.self, forKey: .currency)
            self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
            self.duration = try container.decodeNullableIfPresent(Int.self, forKey: .duration)
            self.eventId = try container.decodeNullableIfPresent(String.self, forKey: .eventId)
            self.eventName = try container.decode(String.self, forKey: .eventName)
            self.eventTime = try container.decodeNullableIfPresent(Date.self, forKey: .eventTime)
            self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
            self.referrerUrl = try container.decodeNullableIfPresent(String.self, forKey: .referrerUrl)
            self.resumed = try container.decodeNullableIfPresent(Bool.self, forKey: .resumed)
            self.source = try container.decodeNullableIfPresent(String.self, forKey: .source)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
            self.user = try container.decodeNullableIfPresent(CreateEventsRequestUser.self, forKey: .user)
            self.value = try container.decodeNullableIfPresent(Double.self, forKey: .value)
            self.variantId = try container.decodeNullableIfPresent(String.self, forKey: .variantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.actionSource, forKey: .actionSource)
            try container.encodeNullableIfPresent(self.appBuildId, forKey: .appBuildId)
            try container.encodeNullableIfPresent(self.appId, forKey: .appId)
            try container.encodeNullableIfPresent(self.context, forKey: .context)
            try container.encodeNullableIfPresent(self.currency, forKey: .currency)
            try container.encodeNullableIfPresent(self.customName, forKey: .customName)
            try container.encodeNullableIfPresent(self.duration, forKey: .duration)
            try container.encodeNullableIfPresent(self.eventId, forKey: .eventId)
            try container.encode(self.eventName, forKey: .eventName)
            try container.encodeNullableIfPresent(self.eventTime, forKey: .eventTime)
            try container.encodeNullableIfPresent(self.productId, forKey: .productId)
            try container.encodeNullableIfPresent(self.referrerUrl, forKey: .referrerUrl)
            try container.encodeNullableIfPresent(self.resumed, forKey: .resumed)
            try container.encodeNullableIfPresent(self.source, forKey: .source)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.url, forKey: .url)
            try container.encodeNullableIfPresent(self.user, forKey: .user)
            try container.encodeNullableIfPresent(self.value, forKey: .value)
            try container.encodeNullableIfPresent(self.variantId, forKey: .variantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case actionSource = "action_source"
            case appBuildId = "app_build_id"
            case appId = "app_id"
            case context
            case currency
            case customName = "custom_name"
            case duration
            case eventId = "event_id"
            case eventName = "event_name"
            case eventTime = "event_time"
            case productId = "product_id"
            case referrerUrl = "referrer_url"
            case resumed
            case source
            case title
            case url
            case user
            case value
            case variantId = "variant_id"
        }
    }
}