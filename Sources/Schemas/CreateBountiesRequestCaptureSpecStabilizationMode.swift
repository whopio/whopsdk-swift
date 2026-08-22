import Foundation

/// How the recorder configures video stabilization. `off` preserves raw motion for pose extraction.
public enum CreateBountiesRequestCaptureSpecStabilizationMode: String, Codable, Hashable, CaseIterable, Sendable {
    case off
    case on
    case any
}