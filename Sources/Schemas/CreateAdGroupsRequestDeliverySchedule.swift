import Foundation

/// Hours the ad group delivers in each week, keyed by day. Each window runs from `start` to `end` on the hour, with `24:00` for midnight, and a day's windows can't overlap or touch. A day that's empty or left out doesn't deliver. Replaces the whole schedule; `null` delivers at every hour. Some platforms need a lifetime `budget_type` for a schedule, on the ad group or on its campaign when the campaign holds the budget.
public struct CreateAdGroupsRequestDeliverySchedule: Codable, Hashable, Sendable {
    /// Windows the ad group delivers in on Friday.
    public let friday: [CreateAdGroupsRequestDeliveryScheduleFridayItem]?
    /// Windows the ad group delivers in on Monday.
    public let monday: [CreateAdGroupsRequestDeliveryScheduleMondayItem]?
    /// Windows the ad group delivers in on Saturday.
    public let saturday: [CreateAdGroupsRequestDeliveryScheduleSaturdayItem]?
    /// Windows the ad group delivers in on Sunday.
    public let sunday: [CreateAdGroupsRequestDeliveryScheduleSundayItem]?
    /// Windows the ad group delivers in on Thursday.
    public let thursday: [CreateAdGroupsRequestDeliveryScheduleThursdayItem]?
    /// Windows the ad group delivers in on Tuesday.
    public let tuesday: [CreateAdGroupsRequestDeliveryScheduleTuesdayItem]?
    /// Windows the ad group delivers in on Wednesday.
    public let wednesday: [CreateAdGroupsRequestDeliveryScheduleWednesdayItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        friday: [CreateAdGroupsRequestDeliveryScheduleFridayItem]? = nil,
        monday: [CreateAdGroupsRequestDeliveryScheduleMondayItem]? = nil,
        saturday: [CreateAdGroupsRequestDeliveryScheduleSaturdayItem]? = nil,
        sunday: [CreateAdGroupsRequestDeliveryScheduleSundayItem]? = nil,
        thursday: [CreateAdGroupsRequestDeliveryScheduleThursdayItem]? = nil,
        tuesday: [CreateAdGroupsRequestDeliveryScheduleTuesdayItem]? = nil,
        wednesday: [CreateAdGroupsRequestDeliveryScheduleWednesdayItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.friday = friday
        self.monday = monday
        self.saturday = saturday
        self.sunday = sunday
        self.thursday = thursday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.friday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleFridayItem].self, forKey: .friday)
        self.monday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleMondayItem].self, forKey: .monday)
        self.saturday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleSaturdayItem].self, forKey: .saturday)
        self.sunday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleSundayItem].self, forKey: .sunday)
        self.thursday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleThursdayItem].self, forKey: .thursday)
        self.tuesday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleTuesdayItem].self, forKey: .tuesday)
        self.wednesday = try container.decodeIfPresent([CreateAdGroupsRequestDeliveryScheduleWednesdayItem].self, forKey: .wednesday)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.friday, forKey: .friday)
        try container.encodeIfPresent(self.monday, forKey: .monday)
        try container.encodeIfPresent(self.saturday, forKey: .saturday)
        try container.encodeIfPresent(self.sunday, forKey: .sunday)
        try container.encodeIfPresent(self.thursday, forKey: .thursday)
        try container.encodeIfPresent(self.tuesday, forKey: .tuesday)
        try container.encodeIfPresent(self.wednesday, forKey: .wednesday)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case friday
        case monday
        case saturday
        case sunday
        case thursday
        case tuesday
        case wednesday
    }
}