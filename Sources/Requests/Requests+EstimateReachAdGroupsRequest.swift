import Foundation

extension Requests {
    public struct EstimateReachAdGroupsRequest: Codable, Hashable, Sendable {
        /// Account to estimate on behalf of. Defaults to the authenticated account.
        public let accountId: String?
        /// Saved audiences to deliver to or exclude. Can't be combined with demographics.automatic.
        public let audiences: AdGroupAudiencesBody?
        /// Age, gender, and automatic-audience targeting.
        public let demographics: AdGroupDemographicsBody?
        /// Interest, behavior, and demographic targeting, using categories from the ad platform's targeting taxonomy. At most 100 entries per section.
        public let detailedTargeting: AdGroupDetailedTargetingBody?
        /// Device platforms and operating systems to target.
        public let devices: AdGroupDevicesBody?
        /// Languages to target, as ISO 639 codes such as `en` or `es`. Empty or omitted targets all languages.
        public let languages: [String]?
        /// The ad network the estimate runs on.
        public let platform: EstimateReachAdGroupsRequestPlatform
        /// Locations to target and exclude.
        public let regions: AdGroupRegionsBody?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            audiences: AdGroupAudiencesBody? = nil,
            demographics: AdGroupDemographicsBody? = nil,
            detailedTargeting: AdGroupDetailedTargetingBody? = nil,
            devices: AdGroupDevicesBody? = nil,
            languages: [String]? = nil,
            platform: EstimateReachAdGroupsRequestPlatform,
            regions: AdGroupRegionsBody? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.audiences = audiences
            self.demographics = demographics
            self.detailedTargeting = detailedTargeting
            self.devices = devices
            self.languages = languages
            self.platform = platform
            self.regions = regions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.audiences = try container.decodeIfPresent(AdGroupAudiencesBody.self, forKey: .audiences)
            self.demographics = try container.decodeIfPresent(AdGroupDemographicsBody.self, forKey: .demographics)
            self.detailedTargeting = try container.decodeIfPresent(AdGroupDetailedTargetingBody.self, forKey: .detailedTargeting)
            self.devices = try container.decodeIfPresent(AdGroupDevicesBody.self, forKey: .devices)
            self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
            self.platform = try container.decode(EstimateReachAdGroupsRequestPlatform.self, forKey: .platform)
            self.regions = try container.decodeIfPresent(AdGroupRegionsBody.self, forKey: .regions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.audiences, forKey: .audiences)
            try container.encodeIfPresent(self.demographics, forKey: .demographics)
            try container.encodeIfPresent(self.detailedTargeting, forKey: .detailedTargeting)
            try container.encodeIfPresent(self.devices, forKey: .devices)
            try container.encodeIfPresent(self.languages, forKey: .languages)
            try container.encode(self.platform, forKey: .platform)
            try container.encodeIfPresent(self.regions, forKey: .regions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case audiences
            case demographics
            case detailedTargeting = "detailed_targeting"
            case devices
            case languages
            case platform
            case regions
        }
    }
}