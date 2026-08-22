import Foundation

public struct BountySubmission: Codable, Hashable, Sendable {
    /// The bounty the work was submitted to, prefixed `bnty_`.
    public let bountyId: String
    public let captureClips: Nullable<[BountyCaptureClip]>
    /// The vendor filename stem `Country_City_Site_Station_Operator`, derived from the capture metadata. `null` until every component is present.
    public let captureFilename: Nullable<String>
    /// Number of verified capture clips accepted for this submission so far. `0` for submissions whose deliverable doesn't accumulate clips.
    public let capturedClipCount: Int
    /// Total verified duration of accepted capture clips, in whole seconds. `0` for submissions whose deliverable doesn't accumulate clips.
    public let capturedDurationSeconds: Int
    /// Capture metadata: city the footage was recorded in. `null` unless capture metadata was provided.
    public let city: Nullable<String>
    /// When the worker claimed the submission, as an ISO 8601 timestamp.
    public let claimedAt: Nullable<String>
    /// Written proof the worker submitted with their work.
    public let content: Nullable<String>
    /// Capture metadata: country the footage was recorded in. `null` unless capture metadata was provided.
    public let country: Nullable<String>
    /// When the submission was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// How the work arrived when it came in through the API in one shot, informational only — read the work from `deliverable_urls`, `files`, and `capture_clips` directly. `null` for submissions whose proof is a livestream recording, including ones that attached links or files on submit.
    public let deliverableType: Nullable<BountySubmissionDeliverableType>
    public let deliverableUrls: Nullable<[String]>
    /// Why the submission was denied, when a presentable reason exists. Always `null` unless `status` is `denied`.
    public let denialReason: Nullable<String>
    /// Capture metadata: device the footage was recorded on. `null` unless capture metadata was provided.
    public let device: Nullable<String>
    public let files: [BountySubmissionFile]
    /// Capture metadata: horizontal field of view in degrees. `null` when not reported.
    public let fov: Nullable<Int>
    /// Submission ID, prefixed `btys_`.
    public let id: String
    /// Latest public proof livestream attached to the submission.
    public let latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>
    /// Capture metadata: identifier of the person who recorded the footage. `null` unless capture metadata was provided.
    public let `operator`: Nullable<String>
    /// When the submission was approved or denied, as an ISO 8601 timestamp. `null` until then.
    public let resolvedAt: Nullable<String>
    /// Capture metadata: site or venue the footage was recorded at. `null` unless capture metadata was provided.
    public let site: Nullable<String>
    /// Capture metadata: station or position within the site. `null` unless capture metadata was provided.
    public let station: Nullable<String>
    /// Lifecycle state. `in_progress` submissions are active attempts that have not submitted proof yet; `submitted` submissions await review; `approved` submissions were accepted and paid; `denied` submissions were rejected. `null` when the attempt ended without proof, taking it out of the public lifecycle — those attempts are absent from every public list and read.
    public let status: Nullable<BountySubmissionStatus>
    /// When proof was submitted for review, as an ISO 8601 timestamp. `null` while the attempt is in progress.
    public let submittedAt: Nullable<String>
    /// When the submission was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// User who submitted the work.
    public let worker: UserSummary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bountyId: String,
        captureClips: Nullable<[BountyCaptureClip]>,
        captureFilename: Nullable<String>,
        capturedClipCount: Int,
        capturedDurationSeconds: Int,
        city: Nullable<String>,
        claimedAt: Nullable<String>,
        content: Nullable<String>,
        country: Nullable<String>,
        createdAt: String,
        deliverableType: Nullable<BountySubmissionDeliverableType>,
        deliverableUrls: Nullable<[String]>,
        denialReason: Nullable<String>,
        device: Nullable<String>,
        files: [BountySubmissionFile],
        fov: Nullable<Int>,
        id: String,
        latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>,
        operator: Nullable<String>,
        resolvedAt: Nullable<String>,
        site: Nullable<String>,
        station: Nullable<String>,
        status: Nullable<BountySubmissionStatus>,
        submittedAt: Nullable<String>,
        updatedAt: String,
        worker: UserSummary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bountyId = bountyId
        self.captureClips = captureClips
        self.captureFilename = captureFilename
        self.capturedClipCount = capturedClipCount
        self.capturedDurationSeconds = capturedDurationSeconds
        self.city = city
        self.claimedAt = claimedAt
        self.content = content
        self.country = country
        self.createdAt = createdAt
        self.deliverableType = deliverableType
        self.deliverableUrls = deliverableUrls
        self.denialReason = denialReason
        self.device = device
        self.files = files
        self.fov = fov
        self.id = id
        self.latestProofLivestreamFeed = latestProofLivestreamFeed
        self.operator = `operator`
        self.resolvedAt = resolvedAt
        self.site = site
        self.station = station
        self.status = status
        self.submittedAt = submittedAt
        self.updatedAt = updatedAt
        self.worker = worker
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bountyId = try container.decode(String.self, forKey: .bountyId)
        self.captureClips = try container.decode(Nullable<[BountyCaptureClip]>.self, forKey: .captureClips)
        self.captureFilename = try container.decode(Nullable<String>.self, forKey: .captureFilename)
        self.capturedClipCount = try container.decode(Int.self, forKey: .capturedClipCount)
        self.capturedDurationSeconds = try container.decode(Int.self, forKey: .capturedDurationSeconds)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.claimedAt = try container.decode(Nullable<String>.self, forKey: .claimedAt)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.deliverableType = try container.decode(Nullable<BountySubmissionDeliverableType>.self, forKey: .deliverableType)
        self.deliverableUrls = try container.decode(Nullable<[String]>.self, forKey: .deliverableUrls)
        self.denialReason = try container.decode(Nullable<String>.self, forKey: .denialReason)
        self.device = try container.decode(Nullable<String>.self, forKey: .device)
        self.files = try container.decode([BountySubmissionFile].self, forKey: .files)
        self.fov = try container.decode(Nullable<Int>.self, forKey: .fov)
        self.id = try container.decode(String.self, forKey: .id)
        self.latestProofLivestreamFeed = try container.decode(Nullable<BountySubmissionLivestreamFeed>.self, forKey: .latestProofLivestreamFeed)
        self.operator = try container.decode(Nullable<String>.self, forKey: .operator)
        self.resolvedAt = try container.decode(Nullable<String>.self, forKey: .resolvedAt)
        self.site = try container.decode(Nullable<String>.self, forKey: .site)
        self.station = try container.decode(Nullable<String>.self, forKey: .station)
        self.status = try container.decode(Nullable<BountySubmissionStatus>.self, forKey: .status)
        self.submittedAt = try container.decode(Nullable<String>.self, forKey: .submittedAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.worker = try container.decode(UserSummary.self, forKey: .worker)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bountyId, forKey: .bountyId)
        try container.encode(self.captureClips, forKey: .captureClips)
        try container.encode(self.captureFilename, forKey: .captureFilename)
        try container.encode(self.capturedClipCount, forKey: .capturedClipCount)
        try container.encode(self.capturedDurationSeconds, forKey: .capturedDurationSeconds)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.claimedAt, forKey: .claimedAt)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deliverableType, forKey: .deliverableType)
        try container.encode(self.deliverableUrls, forKey: .deliverableUrls)
        try container.encode(self.denialReason, forKey: .denialReason)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.files, forKey: .files)
        try container.encode(self.fov, forKey: .fov)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.latestProofLivestreamFeed, forKey: .latestProofLivestreamFeed)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.resolvedAt, forKey: .resolvedAt)
        try container.encode(self.site, forKey: .site)
        try container.encode(self.station, forKey: .station)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.submittedAt, forKey: .submittedAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.worker, forKey: .worker)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bountyId = "bounty_id"
        case captureClips = "capture_clips"
        case captureFilename = "capture_filename"
        case capturedClipCount = "captured_clip_count"
        case capturedDurationSeconds = "captured_duration_seconds"
        case city
        case claimedAt = "claimed_at"
        case content
        case country
        case createdAt = "created_at"
        case deliverableType = "deliverable_type"
        case deliverableUrls = "deliverable_urls"
        case denialReason = "denial_reason"
        case device
        case files
        case fov
        case id
        case latestProofLivestreamFeed = "latest_proof_livestream_feed"
        case `operator`
        case resolvedAt = "resolved_at"
        case site
        case station
        case status
        case submittedAt = "submitted_at"
        case updatedAt = "updated_at"
        case worker
    }
}