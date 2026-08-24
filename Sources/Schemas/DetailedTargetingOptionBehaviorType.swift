import Foundation

/// What a behavior category is measured on, on ad platforms that scope them. Send it back on the `detailed_targeting.behaviors` entry alongside the id. Null for options that aren't scoped.
public enum DetailedTargetingOptionBehaviorType: String, Codable, Hashable, CaseIterable, Sendable {
    case video
    case creator
    case hashtag
}