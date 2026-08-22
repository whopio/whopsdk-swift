import Foundation

/// One result from the ad-group targeting-options search. `type` picks the shape: detailed-targeting taxonomy options carry the ad platform's `id`, languages carry an ISO 639 `code`, and locations carry the platform `key` plus geographic context.
public enum TargetingOption: Codable, Hashable, Sendable {
    case behaviors(DetailedTargetingOption)
    case educationMajors(DetailedTargetingOption)
    case educationSchools(DetailedTargetingOption)
    case familyStatuses(DetailedTargetingOption)
    case income(DetailedTargetingOption)
    case industries(DetailedTargetingOption)
    case interests(DetailedTargetingOption)
    case languages(LanguageTargetingOption)
    case lifeEvents(DetailedTargetingOption)
    case locations(LocationTargetingOption)
    case workEmployers(DetailedTargetingOption)
    case workPositions(DetailedTargetingOption)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "behaviors":
            self = .behaviors(try DetailedTargetingOption(from: decoder))
        case "education_majors":
            self = .educationMajors(try DetailedTargetingOption(from: decoder))
        case "education_schools":
            self = .educationSchools(try DetailedTargetingOption(from: decoder))
        case "family_statuses":
            self = .familyStatuses(try DetailedTargetingOption(from: decoder))
        case "income":
            self = .income(try DetailedTargetingOption(from: decoder))
        case "industries":
            self = .industries(try DetailedTargetingOption(from: decoder))
        case "interests":
            self = .interests(try DetailedTargetingOption(from: decoder))
        case "languages":
            self = .languages(try LanguageTargetingOption(from: decoder))
        case "life_events":
            self = .lifeEvents(try DetailedTargetingOption(from: decoder))
        case "locations":
            self = .locations(try LocationTargetingOption(from: decoder))
        case "work_employers":
            self = .workEmployers(try DetailedTargetingOption(from: decoder))
        case "work_positions":
            self = .workPositions(try DetailedTargetingOption(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .behaviors(let data):
            try container.encode("behaviors", forKey: .type)
            try data.encode(to: encoder)
        case .educationMajors(let data):
            try container.encode("education_majors", forKey: .type)
            try data.encode(to: encoder)
        case .educationSchools(let data):
            try container.encode("education_schools", forKey: .type)
            try data.encode(to: encoder)
        case .familyStatuses(let data):
            try container.encode("family_statuses", forKey: .type)
            try data.encode(to: encoder)
        case .income(let data):
            try container.encode("income", forKey: .type)
            try data.encode(to: encoder)
        case .industries(let data):
            try container.encode("industries", forKey: .type)
            try data.encode(to: encoder)
        case .interests(let data):
            try container.encode("interests", forKey: .type)
            try data.encode(to: encoder)
        case .languages(let data):
            try container.encode("languages", forKey: .type)
            try data.encode(to: encoder)
        case .lifeEvents(let data):
            try container.encode("life_events", forKey: .type)
            try data.encode(to: encoder)
        case .locations(let data):
            try container.encode("locations", forKey: .type)
            try data.encode(to: encoder)
        case .workEmployers(let data):
            try container.encode("work_employers", forKey: .type)
            try data.encode(to: encoder)
        case .workPositions(let data):
            try container.encode("work_positions", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}