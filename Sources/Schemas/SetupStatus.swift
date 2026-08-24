import Foundation

public struct SetupStatus: Codable, Hashable, Sendable {
    /// The setup this status describes, prefixed `sint_`.
    public let id: String
    /// Why the setup ended where it did, or `null` when nothing has failed. Present on `canceled` — a buyer who abandoned carries no code, one refused by the provider does.
    public let lastSetupError: Nullable<SetupLastSetupError>
    /// What the buyer must do next while `status` is `requires_action`, otherwise `null`. `type` picks the shape and each variant carries only its own `data`, so switching on `type` gives you exactly that step's payload.
    public let nextAction: Nullable<PaymentNextAction>
    /// Always `setup_status`.
    public let object: String
    /// Where to send the buyer once the setup reaches a resting state, or `null` to leave them where they are.
    public let returnUrl: Nullable<String>
    /// How far the setup has got. **A 200 means we answered, not that the method was saved — always branch on this.** `requires_action` — the buyer has a step outstanding; see `next_action`. `processing` — the buyer has done their part and the processor is deciding. `succeeded` — the payment method is saved, and only this one means saved. `canceled` — abandoned or refused; see `last_setup_error` to tell which.
    public let status: SetupStatusStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        lastSetupError: Nullable<SetupLastSetupError>,
        nextAction: Nullable<PaymentNextAction>,
        object: String,
        returnUrl: Nullable<String>,
        status: SetupStatusStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.lastSetupError = lastSetupError
        self.nextAction = nextAction
        self.object = object
        self.returnUrl = returnUrl
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastSetupError = try container.decode(Nullable<SetupLastSetupError>.self, forKey: .lastSetupError)
        self.nextAction = try container.decode(Nullable<PaymentNextAction>.self, forKey: .nextAction)
        self.object = try container.decode(String.self, forKey: .object)
        self.returnUrl = try container.decode(Nullable<String>.self, forKey: .returnUrl)
        self.status = try container.decode(SetupStatusStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastSetupError, forKey: .lastSetupError)
        try container.encode(self.nextAction, forKey: .nextAction)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.returnUrl, forKey: .returnUrl)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case lastSetupError = "last_setup_error"
        case nextAction = "next_action"
        case object
        case returnUrl = "return_url"
        case status
    }
}