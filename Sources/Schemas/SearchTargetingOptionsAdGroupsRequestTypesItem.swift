import Foundation

public enum SearchTargetingOptionsAdGroupsRequestTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case interests
    case behaviors
    case lifeEvents = "life_events"
    case industries
    case income
    case familyStatuses = "family_statuses"
    case workEmployers = "work_employers"
    case workPositions = "work_positions"
    case educationSchools = "education_schools"
    case educationMajors = "education_majors"
    case languages
    case locations
}