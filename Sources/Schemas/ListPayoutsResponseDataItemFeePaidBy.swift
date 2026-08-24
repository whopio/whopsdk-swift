import Foundation

/// Who bore the payout fee: the account itself, or its parent platform.
public enum ListPayoutsResponseDataItemFeePaidBy: String, Codable, Hashable, CaseIterable, Sendable {
    case `self`
    case platform
}