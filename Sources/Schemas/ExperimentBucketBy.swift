import Foundation

/// Randomization unit — `user` buckets each user independently, `account` buckets whole accounts (every user of an account gets the same arm). `null` for feature flags.
public enum ExperimentBucketBy: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case account
    case anonymous
}