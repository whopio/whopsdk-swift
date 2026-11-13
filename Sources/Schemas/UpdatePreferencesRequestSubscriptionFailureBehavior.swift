import Foundation

/// What happens to a subscription once every retry of a renewal payment has failed. `cancel` (the default) cancels it. `none` leaves it past due and keeps billing it each period; access follows the account's past-due access setting. Requires company:manage_checkout permission.
public enum UpdatePreferencesRequestSubscriptionFailureBehavior: String, Codable, Hashable, CaseIterable, Sendable {
    case cancel
    case none
}