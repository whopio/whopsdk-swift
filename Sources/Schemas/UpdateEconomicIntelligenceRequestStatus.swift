import Foundation

/// Use `running` to start a run of a ready recommendation, `executed` to record that it was carried out, `incomplete` to record that a running recommendation's run ended without carrying it out, `superseded` to reject a ready recommendation, or `acknowledged` to mark an executed run as seen; the recommendation stays `executed` and records `acknowledged_at`.
public enum UpdateEconomicIntelligenceRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case running
    case executed
    case incomplete
    case superseded
    case acknowledged
}