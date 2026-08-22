import Foundation

/// How the client must configure video stabilization: `off` disables EIS so raw motion is preserved for pose extraction, `on` requires it, `any` leaves the device default.
public enum CaptureSpecVideoStabilizationMode: String, Codable, Hashable, CaseIterable, Sendable {
    case off
    case on
    case any
}