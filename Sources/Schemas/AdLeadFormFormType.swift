import Foundation

/// `more_volume` is quickest to submit; `higher_intent` adds a confirmation step before submission.
public enum AdLeadFormFormType: String, Codable, Hashable, CaseIterable, Sendable {
    case moreVolume = "more_volume"
    case higherIntent = "higher_intent"
}