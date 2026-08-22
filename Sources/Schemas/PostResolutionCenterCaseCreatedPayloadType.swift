import Foundation

/// The webhook event type
public enum PostResolutionCenterCaseCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case resolutionCenterCaseCreated = "resolution_center_case.created"
}