import Foundation

/// Where members come from. `csv_upload` = an uploaded customer list; `people_filter` = built from saved People filters. See `auto_refresh` for whether a `people_filter` audience keeps updating.
public enum AudienceSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case csvUpload = "csv_upload"
    case peopleFilter = "people_filter"
}