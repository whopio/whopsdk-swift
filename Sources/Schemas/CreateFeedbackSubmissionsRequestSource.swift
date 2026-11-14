import Foundation

/// What kind of submission this is. Use api_report_feedback for an issue or api_ask_question for an unanswered question. The other values are reserved for Whop's own clients: the hosted MCP server, the Whop CLI, and Whop AI chat.
public enum CreateFeedbackSubmissionsRequestSource: String, Codable, Hashable, CaseIterable, Sendable {
    case mcpReportFeedback = "mcp_report_feedback"
    case mcpAskQuestion = "mcp_ask_question"
    case cliReportFeedback = "cli_report_feedback"
    case cliAskQuestion = "cli_ask_question"
    case aiChatReportFeedback = "ai_chat_report_feedback"
    case aiChatAskQuestion = "ai_chat_ask_question"
    case apiReportFeedback = "api_report_feedback"
    case apiAskQuestion = "api_ask_question"
}