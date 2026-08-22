import Foundation

/// `automatic` to let the ad platform choose placements, or the list of platforms and positions to target. Omit a platform's positions to target all of them.
///
/// Valid positions per platform:
///
/// - `facebook`: `feed`, `right_hand_column`, `marketplace`, `search`, `profile_feed`, `notification`, `story`, `instream_video`, `facebook_reels`, `facebook_reels_overlay`, `biz_disco_feed`
/// - `instagram`: `stream`, `story`, `explore`, `explore_home`, `reels`, `profile_feed`, `profile_reels`, `ig_search`
/// - `messenger`: `story`
/// - `audience_network`: `classic`, `rewarded_video`
/// - `threads`: `threads_stream`
/// - `whatsapp`: `status`
public enum CreateAdGroupsRequestPlacements: Codable, Hashable, Sendable {
    case createAdGroupsRequestPlacementsZero(CreateAdGroupsRequestPlacementsZero)
    case createAdGroupsRequestPlacementsOneItemArray([CreateAdGroupsRequestPlacementsOneItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CreateAdGroupsRequestPlacementsZero.self) {
            self = .createAdGroupsRequestPlacementsZero(value)
        } else if let value = try? container.decode([CreateAdGroupsRequestPlacementsOneItem].self) {
            self = .createAdGroupsRequestPlacementsOneItemArray(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .createAdGroupsRequestPlacementsZero(let value):
            try container.encode(value)
        case .createAdGroupsRequestPlacementsOneItemArray(let value):
            try container.encode(value)
        }
    }
}