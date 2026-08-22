import Foundation

public enum ListPeopleRequestAttributionModel: String, Codable, Hashable, CaseIterable, Sendable {
    case lastTouch = "last_touch"
    case firstTouch = "first_touch"
}