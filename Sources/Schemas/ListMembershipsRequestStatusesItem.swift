import Foundation

public enum ListMembershipsRequestStatusesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case trialing
    case pastDue = "past_due"
    case completed
    case canceled
    case expired
    case canceling
    case paused
    case expiring
    case oneTime = "one_time"
    case unclaimed
    case banned
}