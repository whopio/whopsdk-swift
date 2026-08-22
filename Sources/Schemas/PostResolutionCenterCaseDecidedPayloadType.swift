import Foundation

/// The webhook event type
public enum PostResolutionCenterCaseDecidedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case resolutionCenterCaseDecided = "resolution_center_case.decided"
}