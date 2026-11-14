import Foundation

/// `pending` until it is used, then `consumed`; `expired` once its short lifetime elapses. Only a `pending` token can be charged.
public enum ConfirmationTokenStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case consumed
    case expired
}