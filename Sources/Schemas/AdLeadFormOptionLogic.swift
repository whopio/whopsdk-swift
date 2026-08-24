import Foundation

public struct AdLeadFormOptionLogic: Codable, Hashable, Sendable {
    /// What happens when the choice is selected.
    public let action: AdLeadFormOptionLogicAction
    /// Zero-based index of the ending screen to jump to.
    public let targetEndPageIndex: Double?
    /// Zero-based index of the question to jump to, for `go_to_question`.
    public let targetQuestionIndex: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: AdLeadFormOptionLogicAction,
        targetEndPageIndex: Double? = nil,
        targetQuestionIndex: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.targetEndPageIndex = targetEndPageIndex
        self.targetQuestionIndex = targetQuestionIndex
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(AdLeadFormOptionLogicAction.self, forKey: .action)
        self.targetEndPageIndex = try container.decodeIfPresent(Double.self, forKey: .targetEndPageIndex)
        self.targetQuestionIndex = try container.decodeIfPresent(Double.self, forKey: .targetQuestionIndex)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encodeIfPresent(self.targetEndPageIndex, forKey: .targetEndPageIndex)
        try container.encodeIfPresent(self.targetQuestionIndex, forKey: .targetQuestionIndex)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case targetEndPageIndex = "target_end_page_index"
        case targetQuestionIndex = "target_question_index"
    }
}