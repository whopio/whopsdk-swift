import Foundation

public struct AdContentReviewNetwork: Codable, Hashable, Sendable {
    /// Whether the ad passes Whop's content policy and this network's.
    public let recommended: Bool
    /// The network. `whop` is Whop's own content policy, which every other network also requires.
    public let title: AdContentReviewNetworkTitle
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        recommended: Bool,
        title: AdContentReviewNetworkTitle,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.recommended = recommended
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recommended = try container.decode(Bool.self, forKey: .recommended)
        self.title = try container.decode(AdContentReviewNetworkTitle.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.recommended, forKey: .recommended)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case recommended
        case title
    }
}