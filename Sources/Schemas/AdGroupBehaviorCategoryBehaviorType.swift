import Foundation

/// On ad platforms that scope behavior categories, what this one is measured on. Send back the value the targeting_options endpoint returned alongside the id. Absent on platforms that don't scope them.
public enum AdGroupBehaviorCategoryBehaviorType: String, Codable, Hashable, CaseIterable, Sendable {
    case video
    case creator
    case hashtag
}