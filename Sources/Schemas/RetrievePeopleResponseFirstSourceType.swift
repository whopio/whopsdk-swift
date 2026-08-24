import Foundation

public enum RetrievePeopleResponseFirstSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case adClick = "ad_click"
    case leadForm = "lead_form"
    case externalAdClick = "external_ad_click"
    case referrer
    case utm
}