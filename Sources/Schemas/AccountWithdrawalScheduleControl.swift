import Foundation

public struct AccountWithdrawalScheduleControl: Codable, Hashable, Sendable {
    /// Day the automatic withdrawal runs on: 0-6 (Sunday-Saturday) for `weekly`, 1-31 for `monthly`. `null` for `manual` and `daily`.
    public let day: Nullable<Int>
    /// How often the account's balance automatically withdraws.
    public let frequency: AccountWithdrawalScheduleControlFrequency
    /// Next date the automatic withdrawal is scheduled to run, as an ISO 8601 date. `null` for `manual` and `daily`, where no single next date applies.
    public let nextPayoutDate: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        day: Nullable<Int>,
        frequency: AccountWithdrawalScheduleControlFrequency,
        nextPayoutDate: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.day = day
        self.frequency = frequency
        self.nextPayoutDate = nextPayoutDate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.day = try container.decode(Nullable<Int>.self, forKey: .day)
        self.frequency = try container.decode(AccountWithdrawalScheduleControlFrequency.self, forKey: .frequency)
        self.nextPayoutDate = try container.decode(Nullable<String>.self, forKey: .nextPayoutDate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.day, forKey: .day)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encode(self.nextPayoutDate, forKey: .nextPayoutDate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case day
        case frequency
        case nextPayoutDate = "next_payout_date"
    }
}