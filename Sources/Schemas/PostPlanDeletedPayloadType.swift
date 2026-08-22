import Foundation

/// The webhook event type
public enum PostPlanDeletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case planDeleted = "plan.deleted"
}