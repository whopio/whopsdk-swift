import Foundation

/// Whether the app has anything to publish, and what a publish in flight is doing. `unpublished` means publishing would ship something new; `no_source` means the sandbox holds no copy of this app, so there is nothing to publish from.
public enum AppDeploymentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case published
    case unpublished
    case publishing
    case failed
    case noSource = "no_source"
}