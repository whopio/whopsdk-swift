import Foundation

/// The stage a running deployment has reached, or `null` when none is running. Later phases dominate the wall clock: `process_archive` waits on the upload pipeline and `promote` waits for the build to go live.
public enum AppDeploymentPhase: String, Codable, Hashable, CaseIterable, Sendable {
    case install
    case build
    case typecheck
    case uploadBuild = "upload_build"
    case uploadSource = "upload_source"
    case processArchive = "process_archive"
    case createBuild = "create_build"
    case promote
}