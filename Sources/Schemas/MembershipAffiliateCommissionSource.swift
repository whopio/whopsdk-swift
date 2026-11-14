import Foundation

/// How the commission rate was set: `custom` for a rate set for this affiliate, `member` for the member affiliate rate of the plan or product, `global` for the product's global affiliate rate, or `marketplace` for a Whop marketplace referral.
public enum MembershipAffiliateCommissionSource: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case member
    case marketplace
    case global
}