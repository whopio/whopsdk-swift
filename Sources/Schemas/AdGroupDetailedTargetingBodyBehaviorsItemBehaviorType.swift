import Foundation

/// On ad platforms that scope behavior categories, what this one is measured on. Send back the value the targeting_options endpoint returned alongside the id.
public enum AdGroupDetailedTargetingBodyBehaviorsItemBehaviorType: String, Codable, Hashable, CaseIterable, Sendable {
    case video
    case creator
    case hashtag
}