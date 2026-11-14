import Foundation

public struct RetrieveTimeSeriesRequestSteps: Codable, Hashable, Sendable {
    public let _1: FunnelStep
    public let _2: FunnelStep
    public let _3: FunnelStep?
    public let _4: FunnelStep?
    public let _5: FunnelStep?
    public let _6: FunnelStep?
    public let _7: FunnelStep?
    public let _8: FunnelStep?
    public let _9: FunnelStep?
    public let _10: FunnelStep?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        _1: FunnelStep,
        _2: FunnelStep,
        _3: FunnelStep? = nil,
        _4: FunnelStep? = nil,
        _5: FunnelStep? = nil,
        _6: FunnelStep? = nil,
        _7: FunnelStep? = nil,
        _8: FunnelStep? = nil,
        _9: FunnelStep? = nil,
        _10: FunnelStep? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self._1 = _1
        self._2 = _2
        self._3 = _3
        self._4 = _4
        self._5 = _5
        self._6 = _6
        self._7 = _7
        self._8 = _8
        self._9 = _9
        self._10 = _10
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._1 = try container.decode(FunnelStep.self, forKey: ._1)
        self._2 = try container.decode(FunnelStep.self, forKey: ._2)
        self._3 = try container.decodeIfPresent(FunnelStep.self, forKey: ._3)
        self._4 = try container.decodeIfPresent(FunnelStep.self, forKey: ._4)
        self._5 = try container.decodeIfPresent(FunnelStep.self, forKey: ._5)
        self._6 = try container.decodeIfPresent(FunnelStep.self, forKey: ._6)
        self._7 = try container.decodeIfPresent(FunnelStep.self, forKey: ._7)
        self._8 = try container.decodeIfPresent(FunnelStep.self, forKey: ._8)
        self._9 = try container.decodeIfPresent(FunnelStep.self, forKey: ._9)
        self._10 = try container.decodeIfPresent(FunnelStep.self, forKey: ._10)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self._1, forKey: ._1)
        try container.encode(self._2, forKey: ._2)
        try container.encodeIfPresent(self._3, forKey: ._3)
        try container.encodeIfPresent(self._4, forKey: ._4)
        try container.encodeIfPresent(self._5, forKey: ._5)
        try container.encodeIfPresent(self._6, forKey: ._6)
        try container.encodeIfPresent(self._7, forKey: ._7)
        try container.encodeIfPresent(self._8, forKey: ._8)
        try container.encodeIfPresent(self._9, forKey: ._9)
        try container.encodeIfPresent(self._10, forKey: ._10)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case _1 = "1"
        case _2 = "2"
        case _3 = "3"
        case _4 = "4"
        case _5 = "5"
        case _6 = "6"
        case _7 = "7"
        case _8 = "8"
        case _9 = "9"
        case _10 = "10"
    }
}