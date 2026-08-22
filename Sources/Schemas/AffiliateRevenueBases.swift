import Foundation

/// The calculation method for affiliate rev-share percentages
public enum AffiliateRevenueBases: String, Codable, Hashable, CaseIterable, Sendable {
    case preFees = "pre_fees"
    case postFees = "post_fees"
}