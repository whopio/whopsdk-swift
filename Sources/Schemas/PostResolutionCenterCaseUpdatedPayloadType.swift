import Foundation

/// The webhook event type
public enum PostResolutionCenterCaseUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case resolutionCenterCaseUpdated = "resolution_center_case.updated"
}