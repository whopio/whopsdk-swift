import Foundation

/// Entity level to group an ad report by.
public enum AdReportBreakdownLevels: String, Codable, Hashable, CaseIterable, Sendable {
    case campaign
    case adGroup = "ad_group"
    case ad
}