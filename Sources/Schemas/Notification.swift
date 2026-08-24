import Foundation

public struct Notification: Codable, Hashable, Sendable {
    /// Account the notification belongs to. `null` when the notification is not associated with an account.
    public let account: Nullable<NotificationAccount>
    /// Image displayed alongside the notification — the sender's avatar, or the default notification image.
    public let attachmentUrl: String
    /// The body text of the notification displayed to the user.
    public let content: String
    /// When the notification was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Experience the notification is related to. `null` when not tied to a specific experience.
    public let experience: Nullable<NotificationExperience>
    /// Notification ID. Feed rows carry a composite id that doubles as the list cursor.
    public let id: String
    /// The same destination on the app's own domain, which the Whop web and mobile clients embed instead of navigating to it. Only relevant if you render Whop apps yourself. `null` when the notification carries its own `link`.
    public let iframeLink: Nullable<String>
    /// The whop.com page the notification opens, as a normal top-level navigation. This is the link to use unless you host Whop apps yourself. `null` when the notification has no click-through destination.
    public let link: Nullable<String>
    /// Whether the authenticated user was directly mentioned in this notification.
    public let mentionsMe: Bool
    /// Additional path information appended to the notification's deep link, if any.
    public let restPath: Nullable<String>
    /// User who triggered the notification. `null` when it was system-generated.
    public let sender: Nullable<NotificationSender>
    /// The title line of the notification displayed to the user.
    public let subject: String
    /// Topic category the notification belongs to, used for grouping and preference management. `null` when uncategorized.
    public let topic: Nullable<NotificationTopicSummary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<NotificationAccount>,
        attachmentUrl: String,
        content: String,
        createdAt: String,
        experience: Nullable<NotificationExperience>,
        id: String,
        iframeLink: Nullable<String>,
        link: Nullable<String>,
        mentionsMe: Bool,
        restPath: Nullable<String>,
        sender: Nullable<NotificationSender>,
        subject: String,
        topic: Nullable<NotificationTopicSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.attachmentUrl = attachmentUrl
        self.content = content
        self.createdAt = createdAt
        self.experience = experience
        self.id = id
        self.iframeLink = iframeLink
        self.link = link
        self.mentionsMe = mentionsMe
        self.restPath = restPath
        self.sender = sender
        self.subject = subject
        self.topic = topic
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<NotificationAccount>.self, forKey: .account)
        self.attachmentUrl = try container.decode(String.self, forKey: .attachmentUrl)
        self.content = try container.decode(String.self, forKey: .content)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.experience = try container.decode(Nullable<NotificationExperience>.self, forKey: .experience)
        self.id = try container.decode(String.self, forKey: .id)
        self.iframeLink = try container.decode(Nullable<String>.self, forKey: .iframeLink)
        self.link = try container.decode(Nullable<String>.self, forKey: .link)
        self.mentionsMe = try container.decode(Bool.self, forKey: .mentionsMe)
        self.restPath = try container.decode(Nullable<String>.self, forKey: .restPath)
        self.sender = try container.decode(Nullable<NotificationSender>.self, forKey: .sender)
        self.subject = try container.decode(String.self, forKey: .subject)
        self.topic = try container.decode(Nullable<NotificationTopicSummary>.self, forKey: .topic)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.attachmentUrl, forKey: .attachmentUrl)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.experience, forKey: .experience)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.iframeLink, forKey: .iframeLink)
        try container.encode(self.link, forKey: .link)
        try container.encode(self.mentionsMe, forKey: .mentionsMe)
        try container.encode(self.restPath, forKey: .restPath)
        try container.encode(self.sender, forKey: .sender)
        try container.encode(self.subject, forKey: .subject)
        try container.encode(self.topic, forKey: .topic)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case attachmentUrl = "attachment_url"
        case content
        case createdAt = "created_at"
        case experience
        case id
        case iframeLink = "iframe_link"
        case link
        case mentionsMe = "mentions_me"
        case restPath = "rest_path"
        case sender
        case subject
        case topic
    }
}