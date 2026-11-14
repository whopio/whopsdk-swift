import Foundation

/// Randomization unit, and the only identity the assignment is keyed on — evaluation fails rather than falling back to another. `user` (default) uses `subject[user_id]`; `account` uses `subject[account_id]`, so every user of an account gets the same arm; `anonymous` uses the anonymous id and survives sign-in. Fixed after creation.
public enum CreateExperimentsRequestBucketBy: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case account
    case anonymous
}