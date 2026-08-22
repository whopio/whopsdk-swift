import Foundation

/// Instant lead form for the ad. Only allowed when the ad group's conversion_location is an instant-form destination (instant_forms, instant_forms_and_messenger, website_and_instant_forms). Mutually exclusive with lead_form_id.
public struct CreateAdsRequestLeadForm: Codable, Hashable, Sendable {
    /// Optional completion screen shown after submission; url sets the follow-up website button.
    public let completion: CreateAdsRequestLeadFormCompletion?
    /// Optional custom consent disclaimer with checkboxes.
    public let disclaimer: CreateAdsRequestLeadFormDisclaimer?
    /// more_volume (default) is quickest to submit; higher_intent adds a confirmation step.
    public let formType: CreateAdsRequestLeadFormFormType?
    /// Optional intro screen shown before the questions.
    public let intro: CreateAdsRequestLeadFormIntro?
    /// Internal name for the form. Auto-generated if omitted.
    public let name: String?
    /// Require SMS verification of the phone number (higher_intent forms).
    public let phoneVerification: Bool?
    /// Your privacy policy. url is required by the ad platform.
    public let privacyPolicy: CreateAdsRequestLeadFormPrivacyPolicy?
    /// The questions on the form. Standard prefill types need only a type; a custom question needs a label and a format (plus options for multiple_choice). Options carry an optional key and answer-routing logic.
    public let questions: [CreateAdsRequestLeadFormQuestionsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completion: CreateAdsRequestLeadFormCompletion? = nil,
        disclaimer: CreateAdsRequestLeadFormDisclaimer? = nil,
        formType: CreateAdsRequestLeadFormFormType? = nil,
        intro: CreateAdsRequestLeadFormIntro? = nil,
        name: String? = nil,
        phoneVerification: Bool? = nil,
        privacyPolicy: CreateAdsRequestLeadFormPrivacyPolicy? = nil,
        questions: [CreateAdsRequestLeadFormQuestionsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completion = completion
        self.disclaimer = disclaimer
        self.formType = formType
        self.intro = intro
        self.name = name
        self.phoneVerification = phoneVerification
        self.privacyPolicy = privacyPolicy
        self.questions = questions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completion = try container.decodeIfPresent(CreateAdsRequestLeadFormCompletion.self, forKey: .completion)
        self.disclaimer = try container.decodeIfPresent(CreateAdsRequestLeadFormDisclaimer.self, forKey: .disclaimer)
        self.formType = try container.decodeIfPresent(CreateAdsRequestLeadFormFormType.self, forKey: .formType)
        self.intro = try container.decodeIfPresent(CreateAdsRequestLeadFormIntro.self, forKey: .intro)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.phoneVerification = try container.decodeIfPresent(Bool.self, forKey: .phoneVerification)
        self.privacyPolicy = try container.decodeIfPresent(CreateAdsRequestLeadFormPrivacyPolicy.self, forKey: .privacyPolicy)
        self.questions = try container.decodeIfPresent([CreateAdsRequestLeadFormQuestionsItem].self, forKey: .questions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.completion, forKey: .completion)
        try container.encodeIfPresent(self.disclaimer, forKey: .disclaimer)
        try container.encodeIfPresent(self.formType, forKey: .formType)
        try container.encodeIfPresent(self.intro, forKey: .intro)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.phoneVerification, forKey: .phoneVerification)
        try container.encodeIfPresent(self.privacyPolicy, forKey: .privacyPolicy)
        try container.encodeIfPresent(self.questions, forKey: .questions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completion
        case disclaimer
        case formType = "form_type"
        case intro
        case name
        case phoneVerification = "phone_verification"
        case privacyPolicy = "privacy_policy"
        case questions
    }
}