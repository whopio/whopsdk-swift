import Foundation

/// more_volume (default) is quickest to submit; higher_intent adds a confirmation step.
public enum CreateAdsRequestLeadFormFormType: String, Codable, Hashable, CaseIterable, Sendable {
    case moreVolume = "more_volume"
    case higherIntent = "higher_intent"
}