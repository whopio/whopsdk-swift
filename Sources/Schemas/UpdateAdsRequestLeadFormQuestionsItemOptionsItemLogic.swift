import Foundation

public struct UpdateAdsRequestLeadFormQuestionsItemOptionsItemLogic: Codable, Hashable, Sendable {
    public let action: UpdateAdsRequestLeadFormQuestionsItemOptionsItemLogicAction?
    public let targetEndPageIndex: Int?
    public let targetQuestionIndex: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: UpdateAdsRequestLeadFormQuestionsItemOptionsItemLogicAction? = nil,
        targetEndPageIndex: Int? = nil,
        targetQuestionIndex: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.targetEndPageIndex = targetEndPageIndex
        self.targetQuestionIndex = targetQuestionIndex
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decodeIfPresent(UpdateAdsRequestLeadFormQuestionsItemOptionsItemLogicAction.self, forKey: .action)
        self.targetEndPageIndex = try container.decodeIfPresent(Int.self, forKey: .targetEndPageIndex)
        self.targetQuestionIndex = try container.decodeIfPresent(Int.self, forKey: .targetQuestionIndex)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.action, forKey: .action)
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