import Foundation

public enum ListAppBuildsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case pending
    case approved
    case rejected
}