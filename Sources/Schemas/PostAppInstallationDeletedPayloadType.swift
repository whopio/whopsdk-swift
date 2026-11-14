import Foundation

/// The webhook event type
public enum PostAppInstallationDeletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case appInstallationDeleted = "app_installation.deleted"
}