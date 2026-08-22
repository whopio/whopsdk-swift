import Foundation

///  The statuses of a DMs feed member
public enum DmsFeedMemberStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case accepted
    case hidden
    case closed
    case archived
}