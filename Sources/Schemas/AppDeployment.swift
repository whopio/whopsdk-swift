import Foundation

public struct AppDeployment: Codable, Hashable, Sendable {
    /// The app being deployed, prefixed `app_`.
    public let appId: String
    /// The build the deployment produced, prefixed `abld_`, or `null` until it succeeds.
    public let buildId: Nullable<String>
    /// Whether the running or last deployment uploaded a build without making it live.
    public let draft: Bool
    /// Why the deployment failed, or `null` when it did not.
    public let error: Nullable<String>
    /// How long this deployment is expected to take in total, estimated from previous runs.
    public let estimatedDurationMs: Nullable<Int>
    /// How much longer the deployment is expected to take. Held above zero until it actually finishes.
    public let estimatedRemainingMs: Nullable<Int>
    /// When the deployment ended, in milliseconds since the epoch, or `null` while it is still running.
    public let finishedAt: Nullable<Int>
    /// The stage a running deployment has reached, or `null` when none is running. Later phases dominate the wall clock: `process_archive` waits on the upload pipeline and `promote` waits for the build to go live.
    public let phase: Nullable<AppDeploymentPhase>
    /// Fraction of the deployment estimated to be complete, from 0 to 1. Stops just short of 1 until the run ends.
    public let progress: Nullable<Double>
    /// When the deployment began, in milliseconds since the epoch, or `null` when none has run.
    public let startedAt: Nullable<Int>
    /// Whether the app has anything to publish, and what a publish in flight is doing. `unpublished` means publishing would ship something new; `no_source` means the sandbox holds no copy of this app, so there is nothing to publish from.
    public let status: AppDeploymentStatus
    /// Where the deployed site is served, or `null` unless the deployment went live.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appId: String,
        buildId: Nullable<String>,
        draft: Bool,
        error: Nullable<String>,
        estimatedDurationMs: Nullable<Int>,
        estimatedRemainingMs: Nullable<Int>,
        finishedAt: Nullable<Int>,
        phase: Nullable<AppDeploymentPhase>,
        progress: Nullable<Double>,
        startedAt: Nullable<Int>,
        status: AppDeploymentStatus,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appId = appId
        self.buildId = buildId
        self.draft = draft
        self.error = error
        self.estimatedDurationMs = estimatedDurationMs
        self.estimatedRemainingMs = estimatedRemainingMs
        self.finishedAt = finishedAt
        self.phase = phase
        self.progress = progress
        self.startedAt = startedAt
        self.status = status
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.buildId = try container.decode(Nullable<String>.self, forKey: .buildId)
        self.draft = try container.decode(Bool.self, forKey: .draft)
        self.error = try container.decode(Nullable<String>.self, forKey: .error)
        self.estimatedDurationMs = try container.decode(Nullable<Int>.self, forKey: .estimatedDurationMs)
        self.estimatedRemainingMs = try container.decode(Nullable<Int>.self, forKey: .estimatedRemainingMs)
        self.finishedAt = try container.decode(Nullable<Int>.self, forKey: .finishedAt)
        self.phase = try container.decode(Nullable<AppDeploymentPhase>.self, forKey: .phase)
        self.progress = try container.decode(Nullable<Double>.self, forKey: .progress)
        self.startedAt = try container.decode(Nullable<Int>.self, forKey: .startedAt)
        self.status = try container.decode(AppDeploymentStatus.self, forKey: .status)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appId, forKey: .appId)
        try container.encode(self.buildId, forKey: .buildId)
        try container.encode(self.draft, forKey: .draft)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.estimatedDurationMs, forKey: .estimatedDurationMs)
        try container.encode(self.estimatedRemainingMs, forKey: .estimatedRemainingMs)
        try container.encode(self.finishedAt, forKey: .finishedAt)
        try container.encode(self.phase, forKey: .phase)
        try container.encode(self.progress, forKey: .progress)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appId = "app_id"
        case buildId = "build_id"
        case draft
        case error
        case estimatedDurationMs = "estimated_duration_ms"
        case estimatedRemainingMs = "estimated_remaining_ms"
        case finishedAt = "finished_at"
        case phase
        case progress
        case startedAt = "started_at"
        case status
        case url
    }
}