import Foundation

/// The webhook event type
public enum PostAppInstallationCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case appInstallationCreated = "app_installation.created"
}