import Foundation

/// `queued` when awaiting generation; `pending` while generating or preparing its work; `ready` when available to run; `running` while Whop AI or the recommendation's API calls carry it out; `executed` when carried out; `incomplete` when the run ended without carrying it out; `superseded` when rejected or replaced.
public enum EconomicIntelligenceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case pending
    case ready
    case running
    case executed
    case incomplete
    case superseded
}