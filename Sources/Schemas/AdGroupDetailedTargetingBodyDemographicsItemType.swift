import Foundation

/// Kind of demographic the category belongs to.
public enum AdGroupDetailedTargetingBodyDemographicsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case lifeEvents = "life_events"
    case industries
    case income
    case familyStatuses = "family_statuses"
    case workEmployers = "work_employers"
    case workPositions = "work_positions"
    case educationSchools = "education_schools"
    case educationMajors = "education_majors"
}