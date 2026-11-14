import Foundation

/// Membership source: an uploaded CSV, Whop People filters, or social engagement. Engagement audiences can no longer be created.
public enum AudienceSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case csvUpload = "csv_upload"
    case peopleFilter = "people_filter"
    case engagement
}