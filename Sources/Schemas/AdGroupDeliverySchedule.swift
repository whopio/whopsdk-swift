import Foundation

public struct AdGroupDeliverySchedule: Codable, Hashable, Sendable {
    public let friday: [AdGroupDeliveryWindow]?
    public let monday: [AdGroupDeliveryWindow]?
    public let saturday: [AdGroupDeliveryWindow]?
    public let sunday: [AdGroupDeliveryWindow]?
    public let thursday: [AdGroupDeliveryWindow]?
    public let tuesday: [AdGroupDeliveryWindow]?
    public let wednesday: [AdGroupDeliveryWindow]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        friday: [AdGroupDeliveryWindow]? = nil,
        monday: [AdGroupDeliveryWindow]? = nil,
        saturday: [AdGroupDeliveryWindow]? = nil,
        sunday: [AdGroupDeliveryWindow]? = nil,
        thursday: [AdGroupDeliveryWindow]? = nil,
        tuesday: [AdGroupDeliveryWindow]? = nil,
        wednesday: [AdGroupDeliveryWindow]? = nil,
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
        self.friday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .friday)
        self.monday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .monday)
        self.saturday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .saturday)
        self.sunday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .sunday)
        self.thursday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .thursday)
        self.tuesday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .tuesday)
        self.wednesday = try container.decodeIfPresent([AdGroupDeliveryWindow].self, forKey: .wednesday)
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