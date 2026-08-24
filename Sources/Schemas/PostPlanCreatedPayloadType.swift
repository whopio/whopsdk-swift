import Foundation

/// The webhook event type
public enum PostPlanCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case planCreated = "plan.created"
}