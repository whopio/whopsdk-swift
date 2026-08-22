import Foundation

public enum ListAdGroupsRequestAttributionModel: String, Codable, Hashable, CaseIterable, Sendable {
    case lastTouch = "last_touch"
    case firstTouch = "first_touch"
}