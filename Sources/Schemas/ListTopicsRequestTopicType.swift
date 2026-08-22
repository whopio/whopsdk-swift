import Foundation

public enum ListTopicsRequestTopicType: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case accountTeam = "account_team"
}