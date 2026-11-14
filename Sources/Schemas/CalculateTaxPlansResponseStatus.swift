import Foundation

public enum CalculateTaxPlansResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case calculated
    case notCalculated = "not_calculated"
}