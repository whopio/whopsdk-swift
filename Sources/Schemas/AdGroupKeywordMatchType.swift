import Foundation

/// How closely a search has to match: `broad` also reaches related searches, `phrase` needs the meaning of the phrase, and `exact` needs the same meaning as the term. Defaults to `broad`.
public enum AdGroupKeywordMatchType: String, Codable, Hashable, CaseIterable, Sendable {
    case broad
    case phrase
    case exact
}