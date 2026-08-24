import Foundation

public enum ListAudiencesRequestSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case csvUpload = "csv_upload"
    case peopleFilter = "people_filter"
}