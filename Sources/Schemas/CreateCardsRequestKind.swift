import Foundation

/// Who the card application verifies, set only on the call that files it; sending it while the account's application is in progress or approved is a 400. `business` applies as the account with its approved KYB. `individual` applies as a person: assigned_user_id when given, otherwise the account owner, using the identity verified on the account. Omit it to apply as the business when its KYB is approved, and as an individual otherwise.
public enum CreateCardsRequestKind: String, Codable, Hashable, CaseIterable, Sendable {
    case individual
    case business
}