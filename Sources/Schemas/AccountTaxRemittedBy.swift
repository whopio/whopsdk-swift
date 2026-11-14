import Foundation

/// Who calculates and remits tax for the account. `whop` means Whop calculates and remits. `self` means Whop calculates, and the account collects and remits. `none` means neither, and the account is responsible. New businesses start on `whop`, and new connected accounts start on `none`. `null` means the account has no setting yet.
public enum AccountTaxRemittedBy: String, Codable, Hashable, CaseIterable, Sendable {
    case whop
    case `self`
    case none
}