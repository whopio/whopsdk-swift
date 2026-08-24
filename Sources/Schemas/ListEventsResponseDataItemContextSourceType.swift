import Foundation

/// How this event counts as an acquisition touch, using the same rule attribution credits a conversion with. `ad_click` and `lead_form` resolved to a Whop ad; `external_ad_click` is a paid click on a campaign run outside Whop; `referrer` is organic. Null when the event is not a touch.
public enum ListEventsResponseDataItemContextSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case adClick = "ad_click"
    case leadForm = "lead_form"
    case externalAdClick = "external_ad_click"
    case referrer
}