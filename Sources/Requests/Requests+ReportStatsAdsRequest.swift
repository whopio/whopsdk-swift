import Foundation

extension Requests {
    public struct ReportStatsAdsRequest: Codable, Hashable, Sendable {
        /// The ad's ID, prefixed `ad_`: the campaign's ad or the runner's copy of it.
        public let adId: String
        /// Start of the hour, on the hour, for an hour that has already started.
        public let hourStartedAt: Date
        /// The ad's impressions in the hour so far. Zero when left out.
        public let impressions: ReportStatsAdsRequestImpressions?
        /// The USD to be paid for the ad's hour so far, to the cent: what the ad spent plus any markup, such as 105.00 for 100.00 spent with a 5% markup.
        public let spend: ReportStatsAdsRequestSpend
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adId: String,
            hourStartedAt: Date,
            impressions: ReportStatsAdsRequestImpressions? = nil,
            spend: ReportStatsAdsRequestSpend,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.adId = adId
            self.hourStartedAt = hourStartedAt
            self.impressions = impressions
            self.spend = spend
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.adId = try container.decode(String.self, forKey: .adId)
            self.hourStartedAt = try container.decode(Date.self, forKey: .hourStartedAt)
            self.impressions = try container.decodeIfPresent(ReportStatsAdsRequestImpressions.self, forKey: .impressions)
            self.spend = try container.decode(ReportStatsAdsRequestSpend.self, forKey: .spend)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.adId, forKey: .adId)
            try container.encode(self.hourStartedAt, forKey: .hourStartedAt)
            try container.encodeIfPresent(self.impressions, forKey: .impressions)
            try container.encode(self.spend, forKey: .spend)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adId = "ad_id"
            case hourStartedAt = "hour_started_at"
            case impressions
            case spend
        }
    }
}