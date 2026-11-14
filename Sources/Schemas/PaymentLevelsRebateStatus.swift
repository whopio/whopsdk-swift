import Foundation

/// `rebated` when the payment earned part of its account's monthly Whop Levels rebate. `pending` until the month its processing fee posted in has closed. `not_covered` when the account's spend that month ran out before this payment. `ineligible` when it can't earn one; `ineligible_reason` says why.
public enum PaymentLevelsRebateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case rebated
    case pending
    case notCovered = "not_covered"
    case ineligible
}