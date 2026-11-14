import Foundation

/// Custom audience source. Inferred from `filters`, otherwise defaults to `csv_upload`. Supply only the fields for the selected source.
public enum CreateAudiencesRequestSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case csvUpload = "csv_upload"
    case peopleFilter = "people_filter"
}