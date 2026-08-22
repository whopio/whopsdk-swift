import Foundation

/// The webhook event type
public enum PostPlanUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case planUpdated = "plan.updated"
}