import Foundation

/// Legacy shape selector; no longer selects anything. When present it must name an inline shape (`content_url` or `media`).
public enum CreateBountySubmissionsRequestDeliverableType: String, Codable, Hashable, CaseIterable, Sendable {
    case contentUrl = "content_url"
    case media
}