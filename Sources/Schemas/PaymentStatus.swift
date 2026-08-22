import Foundation

public struct PaymentStatus: Codable, Hashable, Sendable {
    /// The payment this status describes, prefixed `pay_`.
    public let id: String
    /// Details of the most recent failed attempt, or `null` when the payment has not failed.
    public let lastPaymentError: Nullable<PaymentLastPaymentError>
    /// What the buyer must do next while `status` is `requires_action`, otherwise `null`. `type` picks the shape and each variant carries only its own `data`, so switching on `type` gives you exactly that step's payload.
    public let nextAction: Nullable<PaymentNextAction>
    /// Always `payment_status`.
    public let object: String
    /// Present while `status` is `processing` on a settlement rail, otherwise `null`.
    public let processingDetails: Nullable<PaymentProcessingDetails>
    /// Where to send the buyer once the payment reaches a resting state, or `null` to leave them where they are. Editable until they return — see the return_url operation.
    public let returnUrl: Nullable<String>
    /// How far the payment has got. `requires_confirmation` — nothing attempted yet, or the last attempt failed and can be retried. `requires_action` — the buyer has a step outstanding; see `next_action`. `confirming` — the buyer has done their part and the processor is deciding. `processing` — the money is moving; see `processing_details`. `succeeded` — collected. `canceled` — voided or written off.
    public let status: PaymentStatusStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        lastPaymentError: Nullable<PaymentLastPaymentError>,
        nextAction: Nullable<PaymentNextAction>,
        object: String,
        processingDetails: Nullable<PaymentProcessingDetails>,
        returnUrl: Nullable<String>,
        status: PaymentStatusStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.lastPaymentError = lastPaymentError
        self.nextAction = nextAction
        self.object = object
        self.processingDetails = processingDetails
        self.returnUrl = returnUrl
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastPaymentError = try container.decode(Nullable<PaymentLastPaymentError>.self, forKey: .lastPaymentError)
        self.nextAction = try container.decode(Nullable<PaymentNextAction>.self, forKey: .nextAction)
        self.object = try container.decode(String.self, forKey: .object)
        self.processingDetails = try container.decode(Nullable<PaymentProcessingDetails>.self, forKey: .processingDetails)
        self.returnUrl = try container.decode(Nullable<String>.self, forKey: .returnUrl)
        self.status = try container.decode(PaymentStatusStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastPaymentError, forKey: .lastPaymentError)
        try container.encode(self.nextAction, forKey: .nextAction)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.processingDetails, forKey: .processingDetails)
        try container.encode(self.returnUrl, forKey: .returnUrl)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case lastPaymentError = "last_payment_error"
        case nextAction = "next_action"
        case object
        case processingDetails = "processing_details"
        case returnUrl = "return_url"
        case status
    }
}