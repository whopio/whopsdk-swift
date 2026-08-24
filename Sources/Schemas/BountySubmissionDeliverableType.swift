import Foundation

/// How the work arrived when it came in through the API in one shot, informational only — read the work from `deliverable_urls`, `files`, and `capture_clips` directly. `null` for submissions whose proof is a livestream recording, including ones that attached links or files on submit.
public enum BountySubmissionDeliverableType: String, Codable, Hashable, CaseIterable, Sendable {
    case contentUrl = "content_url"
    case media
    case dataCapture = "data_capture"
}