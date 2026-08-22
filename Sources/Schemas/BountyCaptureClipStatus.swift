import Foundation

/// Recording and validation state. `recording` is still capturing; `verifying` is running server-side validation; `ready` passed validation and counts toward the verified-duration payout gate; `failed` did not validate.
public enum BountyCaptureClipStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case recording
    case verifying
    case ready
    case failed
}