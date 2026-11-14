import Foundation

extension Requests {
    public struct UpdateEconomicIntelligenceRequest: Codable, Hashable, Sendable {
        /// No longer read: recommendations are written for the business as it changes. Up to 1000 characters.
        public let input: String?
        /// With `status: executed`, the ID of what the run produced or changed, and the recommendation's `result_url` becomes where to view it: an ad (`ad_`), ad group (`adgrp_`) or ad campaign (`adcamp_`), a website (`app_`), a product (`prod_`), a plan (`plan_`), a checkout link (`ch_`), a promo code (`promo_`), or an experience (`exp_`). Without `result_id` or `result_page`, `result_url` links to the resource the recommendation was about, when it names one. Send only one of `result_id`, `result_page` and `result_url`.
        public let resultId: String?
        /// With `status: executed`, the page where the run's result can be seen when it is not one resource, such as the checkout links list. The recommendation's `result_url` becomes that page on the account's dashboard.
        public let resultPage: UpdateEconomicIntelligenceRequestResultPage?
        /// With `status: executed`, where to view what was produced when it is outside Whop. An http or https URL. Prefer `result_id` for anything on Whop.
        public let resultUrl: String?
        /// A signed-in user can rate a recommendation as `positive` or `negative`. Can be sent alone or together with status.
        public let sentiment: UpdateEconomicIntelligenceRequestSentiment?
        /// Use `running` to start a run of a ready recommendation, `executed` to record that it was carried out, `incomplete` to record that a running recommendation's run ended without carrying it out, `superseded` to reject a ready recommendation, or `acknowledged` to mark an executed run as seen; the recommendation stays `executed` and records `acknowledged_at`.
        public let status: UpdateEconomicIntelligenceRequestStatus?
        /// An optional explanation of the rating or rejection.
        public let userFeedback: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            input: String? = nil,
            resultId: String? = nil,
            resultPage: UpdateEconomicIntelligenceRequestResultPage? = nil,
            resultUrl: String? = nil,
            sentiment: UpdateEconomicIntelligenceRequestSentiment? = nil,
            status: UpdateEconomicIntelligenceRequestStatus? = nil,
            userFeedback: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.input = input
            self.resultId = resultId
            self.resultPage = resultPage
            self.resultUrl = resultUrl
            self.sentiment = sentiment
            self.status = status
            self.userFeedback = userFeedback
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.input = try container.decodeIfPresent(String.self, forKey: .input)
            self.resultId = try container.decodeIfPresent(String.self, forKey: .resultId)
            self.resultPage = try container.decodeIfPresent(UpdateEconomicIntelligenceRequestResultPage.self, forKey: .resultPage)
            self.resultUrl = try container.decodeIfPresent(String.self, forKey: .resultUrl)
            self.sentiment = try container.decodeIfPresent(UpdateEconomicIntelligenceRequestSentiment.self, forKey: .sentiment)
            self.status = try container.decodeIfPresent(UpdateEconomicIntelligenceRequestStatus.self, forKey: .status)
            self.userFeedback = try container.decodeIfPresent(String.self, forKey: .userFeedback)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.input, forKey: .input)
            try container.encodeIfPresent(self.resultId, forKey: .resultId)
            try container.encodeIfPresent(self.resultPage, forKey: .resultPage)
            try container.encodeIfPresent(self.resultUrl, forKey: .resultUrl)
            try container.encodeIfPresent(self.sentiment, forKey: .sentiment)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.userFeedback, forKey: .userFeedback)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case input
            case resultId = "result_id"
            case resultPage = "result_page"
            case resultUrl = "result_url"
            case sentiment
            case status
            case userFeedback = "user_feedback"
        }
    }
}