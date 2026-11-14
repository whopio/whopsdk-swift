import Foundation

/// The type of the feed named by `feed_id`.
public enum CreateTransfersRequestBodyBalanceFeedType: String, Codable, Hashable, CaseIterable, Sendable {
    case dmsFeed = "dms_feed"
    case chatFeed = "chat_feed"
    case forumFeed = "forum_feed"
    case livestreamFeed = "livestream_feed"
    case universalPost = "universal_post"
    case user
}