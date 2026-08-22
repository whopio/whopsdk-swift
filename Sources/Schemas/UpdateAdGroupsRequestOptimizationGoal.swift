import Foundation

/// The result the ad group's delivery is optimized to get the most of.
public enum UpdateAdGroupsRequestOptimizationGoal: String, Codable, Hashable, CaseIterable, Sendable {
    case conversions
    case linkClicks = "link_clicks"
    case landingPageViews = "landing_page_views"
    case reach
    case impressions
    case engagement
    case conversations
    case videoViews = "video_views"
    case twoSecondViews = "two_second_views"
    case pageLikes = "page_likes"
    case socialProfile = "social_profile"
    case adRecallLift = "ad_recall_lift"
    case eventResponses = "event_responses"
    case remindersSet = "reminders_set"
    case leadGeneration = "lead_generation"
    case qualityLead = "quality_lead"
    case value
    case profileAndPageEngagement = "profile_and_page_engagement"
}