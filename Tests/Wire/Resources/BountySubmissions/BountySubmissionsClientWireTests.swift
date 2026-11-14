import Foundation
import Testing
import WhopSDK

@Suite("BountySubmissionsClient Wire Tests") struct BountySubmissionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "bounty_id": "bnty_xxxxxxxxxxxxxx",
                      "capture_clips": [
                        {
                          "bounty_submission_id": "btys_xxxxxxxxxxxxxx",
                          "created_at": "2026-01-01T12:00:00.000Z",
                          "duration_seconds": 180,
                          "failure_code": "upload_failed",
                          "failure_message": "video: The video upload failed after 5 retries.",
                          "frames_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "id": "bclip_xxxxxxxxxxxxxx",
                          "imu_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "manifest_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "ready_at": "2026-01-01T12:00:00.000Z",
                          "sequence": 1,
                          "status": "recording",
                          "updated_at": "2026-01-01T12:00:00.000Z",
                          "video_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "capture_filename": "US_Austin_BurnetRd_Bay2_mwebb",
                      "captured_clip_count": 0,
                      "captured_duration_seconds": 0,
                      "city": "Austin",
                      "claimed_at": "2026-01-01T12:00:00.000Z",
                      "content": "Ceramic coating reveal, shot at the Burnet Rd bay",
                      "country": "US",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "deliverable_type": "content_url",
                      "deliverable_urls": [
                        "https://tiktok.com/@shinetime/video/1"
                      ],
                      "denial_reason": "The clip never shows the finished paint.",
                      "device": "iPhone 15 Pro",
                      "files": [
                        {
                          "attachment_type": null,
                          "content_type": "image/png",
                          "filename": "ceramic-coating-cut.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "fov": 120,
                      "id": "btys_xxxxxxxxxxxxxx",
                      "latest_proof_livestream_feed": {
                        "ended_at": "2026-01-01T12:00:00.000Z",
                        "id": "lfeed_1",
                        "recording_status": null,
                        "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "started_at": "2026-01-01T12:00:00.000Z",
                        "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                        "title": "Untitled Livestream"
                      },
                      "operator": "mwebb",
                      "resolved_at": "2026-01-01T12:00:00.000Z",
                      "site": "BurnetRd",
                      "station": "Bay2",
                      "status": "in_progress",
                      "submitted_at": "2026-01-01T12:00:00.000Z",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "worker": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListBountySubmissionsResponse(
            data: [
                BountySubmission(
                    bountyId: "bnty_xxxxxxxxxxxxxx",
                    captureClips: Nullable<[BountyCaptureClip]>.value([
                        BountyCaptureClip(
                            bountySubmissionId: "btys_xxxxxxxxxxxxxx",
                            createdAt: "2026-01-01T12:00:00.000Z",
                            durationSeconds: Nullable<Int>.value(180),
                            failureCode: Nullable<String>.value("upload_failed"),
                            failureMessage: Nullable<String>.value("video: The video upload failed after 5 retries."),
                            framesUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            id: "bclip_xxxxxxxxxxxxxx",
                            imuUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            manifestUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            readyAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            sequence: 1,
                            status: BountyCaptureClipStatus.recording,
                            updatedAt: "2026-01-01T12:00:00.000Z",
                            videoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ]),
                    captureFilename: Nullable<String>.value("US_Austin_BurnetRd_Bay2_mwebb"),
                    capturedClipCount: 0,
                    capturedDurationSeconds: 0,
                    city: Nullable<String>.value("Austin"),
                    claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    content: Nullable<String>.value("Ceramic coating reveal, shot at the Burnet Rd bay"),
                    country: Nullable<String>.value("US"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
                    deliverableUrls: Nullable<[String]>.value([
                        "https://tiktok.com/@shinetime/video/1"
                    ]),
                    denialReason: Nullable<String>.value("The clip never shows the finished paint."),
                    device: Nullable<String>.value("iPhone 15 Pro"),
                    files: [
                        BountySubmissionFile(
                            attachmentType: .null,
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("ceramic-coating-cut.png"),
                            id: "file_xxxxxxxxxxxxxx",
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    fov: Nullable<Int>.value(120),
                    id: "btys_xxxxxxxxxxxxxx",
                    latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                        endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        id: "lfeed_1",
                        recordingStatus: .null,
                        recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                        title: "Untitled Livestream"
                    )),
                    operator: Nullable<String>.value("mwebb"),
                    resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    site: Nullable<String>.value("BurnetRd"),
                    station: Nullable<String>.value("Bay2"),
                    status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
                    submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    worker: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )
                )
            ],
            pageInfo: ListBountySubmissionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.bountySubmissions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "bounty_id": "bounty_id",
                      "capture_clips": [
                        {
                          "bounty_submission_id": "bounty_submission_id",
                          "created_at": "created_at",
                          "duration_seconds": 1,
                          "failure_code": "failure_code",
                          "failure_message": "failure_message",
                          "frames_url": "frames_url",
                          "id": "id",
                          "imu_url": "imu_url",
                          "manifest_url": "manifest_url",
                          "ready_at": "ready_at",
                          "sequence": 1,
                          "status": "recording",
                          "updated_at": "updated_at",
                          "video_url": "video_url"
                        },
                        {
                          "bounty_submission_id": "bounty_submission_id",
                          "created_at": "created_at",
                          "duration_seconds": 1,
                          "failure_code": "failure_code",
                          "failure_message": "failure_message",
                          "frames_url": "frames_url",
                          "id": "id",
                          "imu_url": "imu_url",
                          "manifest_url": "manifest_url",
                          "ready_at": "ready_at",
                          "sequence": 1,
                          "status": "recording",
                          "updated_at": "updated_at",
                          "video_url": "video_url"
                        }
                      ],
                      "capture_filename": "capture_filename",
                      "captured_clip_count": 1,
                      "captured_duration_seconds": 1,
                      "city": "city",
                      "claimed_at": "claimed_at",
                      "content": "content",
                      "country": "country",
                      "created_at": "created_at",
                      "deliverable_type": "content_url",
                      "deliverable_urls": [
                        "deliverable_urls",
                        "deliverable_urls"
                      ],
                      "denial_reason": "denial_reason",
                      "device": "device",
                      "files": [
                        {
                          "attachment_type": "image",
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "attachment_type": "image",
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "fov": 1,
                      "id": "id",
                      "latest_proof_livestream_feed": {
                        "ended_at": "ended_at",
                        "id": "id",
                        "recording_status": "recording",
                        "recording_url": "recording_url",
                        "started_at": "started_at",
                        "thumbnail_url": "thumbnail_url",
                        "title": "title"
                      },
                      "operator": "operator",
                      "resolved_at": "resolved_at",
                      "site": "site",
                      "station": "station",
                      "status": "in_progress",
                      "submitted_at": "submitted_at",
                      "updated_at": "updated_at",
                      "worker": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "bounty_id": "bounty_id",
                      "capture_clips": [
                        {
                          "bounty_submission_id": "bounty_submission_id",
                          "created_at": "created_at",
                          "duration_seconds": 1,
                          "failure_code": "failure_code",
                          "failure_message": "failure_message",
                          "frames_url": "frames_url",
                          "id": "id",
                          "imu_url": "imu_url",
                          "manifest_url": "manifest_url",
                          "ready_at": "ready_at",
                          "sequence": 1,
                          "status": "recording",
                          "updated_at": "updated_at",
                          "video_url": "video_url"
                        },
                        {
                          "bounty_submission_id": "bounty_submission_id",
                          "created_at": "created_at",
                          "duration_seconds": 1,
                          "failure_code": "failure_code",
                          "failure_message": "failure_message",
                          "frames_url": "frames_url",
                          "id": "id",
                          "imu_url": "imu_url",
                          "manifest_url": "manifest_url",
                          "ready_at": "ready_at",
                          "sequence": 1,
                          "status": "recording",
                          "updated_at": "updated_at",
                          "video_url": "video_url"
                        }
                      ],
                      "capture_filename": "capture_filename",
                      "captured_clip_count": 1,
                      "captured_duration_seconds": 1,
                      "city": "city",
                      "claimed_at": "claimed_at",
                      "content": "content",
                      "country": "country",
                      "created_at": "created_at",
                      "deliverable_type": "content_url",
                      "deliverable_urls": [
                        "deliverable_urls",
                        "deliverable_urls"
                      ],
                      "denial_reason": "denial_reason",
                      "device": "device",
                      "files": [
                        {
                          "attachment_type": "image",
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "attachment_type": "image",
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "fov": 1,
                      "id": "id",
                      "latest_proof_livestream_feed": {
                        "ended_at": "ended_at",
                        "id": "id",
                        "recording_status": "recording",
                        "recording_url": "recording_url",
                        "started_at": "started_at",
                        "thumbnail_url": "thumbnail_url",
                        "title": "title"
                      },
                      "operator": "operator",
                      "resolved_at": "resolved_at",
                      "site": "site",
                      "station": "station",
                      "status": "in_progress",
                      "submitted_at": "submitted_at",
                      "updated_at": "updated_at",
                      "worker": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListBountySubmissionsResponse(
            data: [
                BountySubmission(
                    bountyId: "bounty_id",
                    captureClips: Nullable<[BountyCaptureClip]>.value([
                        BountyCaptureClip(
                            bountySubmissionId: "bounty_submission_id",
                            createdAt: "created_at",
                            durationSeconds: Nullable<Int>.value(1),
                            failureCode: Nullable<String>.value("failure_code"),
                            failureMessage: Nullable<String>.value("failure_message"),
                            framesUrl: Nullable<String>.value("frames_url"),
                            id: "id",
                            imuUrl: Nullable<String>.value("imu_url"),
                            manifestUrl: Nullable<String>.value("manifest_url"),
                            readyAt: Nullable<String>.value("ready_at"),
                            sequence: 1,
                            status: BountyCaptureClipStatus.recording,
                            updatedAt: "updated_at",
                            videoUrl: Nullable<String>.value("video_url")
                        ),
                        BountyCaptureClip(
                            bountySubmissionId: "bounty_submission_id",
                            createdAt: "created_at",
                            durationSeconds: Nullable<Int>.value(1),
                            failureCode: Nullable<String>.value("failure_code"),
                            failureMessage: Nullable<String>.value("failure_message"),
                            framesUrl: Nullable<String>.value("frames_url"),
                            id: "id",
                            imuUrl: Nullable<String>.value("imu_url"),
                            manifestUrl: Nullable<String>.value("manifest_url"),
                            readyAt: Nullable<String>.value("ready_at"),
                            sequence: 1,
                            status: BountyCaptureClipStatus.recording,
                            updatedAt: "updated_at",
                            videoUrl: Nullable<String>.value("video_url")
                        )
                    ]),
                    captureFilename: Nullable<String>.value("capture_filename"),
                    capturedClipCount: 1,
                    capturedDurationSeconds: 1,
                    city: Nullable<String>.value("city"),
                    claimedAt: Nullable<String>.value("claimed_at"),
                    content: Nullable<String>.value("content"),
                    country: Nullable<String>.value("country"),
                    createdAt: "created_at",
                    deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
                    deliverableUrls: Nullable<[String]>.value([
                        "deliverable_urls",
                        "deliverable_urls"
                    ]),
                    denialReason: Nullable<String>.value("denial_reason"),
                    device: Nullable<String>.value("device"),
                    files: [
                        BountySubmissionFile(
                            attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        BountySubmissionFile(
                            attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    fov: Nullable<Int>.value(1),
                    id: "id",
                    latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                        endedAt: Nullable<String>.value("ended_at"),
                        id: "id",
                        recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                        recordingUrl: Nullable<String>.value("recording_url"),
                        startedAt: Nullable<String>.value("started_at"),
                        thumbnailUrl: Nullable<String>.value("thumbnail_url"),
                        title: "title"
                    )),
                    operator: Nullable<String>.value("operator"),
                    resolvedAt: Nullable<String>.value("resolved_at"),
                    site: Nullable<String>.value("site"),
                    station: Nullable<String>.value("station"),
                    status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
                    submittedAt: Nullable<String>.value("submitted_at"),
                    updatedAt: "updated_at",
                    worker: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                ),
                BountySubmission(
                    bountyId: "bounty_id",
                    captureClips: Nullable<[BountyCaptureClip]>.value([
                        BountyCaptureClip(
                            bountySubmissionId: "bounty_submission_id",
                            createdAt: "created_at",
                            durationSeconds: Nullable<Int>.value(1),
                            failureCode: Nullable<String>.value("failure_code"),
                            failureMessage: Nullable<String>.value("failure_message"),
                            framesUrl: Nullable<String>.value("frames_url"),
                            id: "id",
                            imuUrl: Nullable<String>.value("imu_url"),
                            manifestUrl: Nullable<String>.value("manifest_url"),
                            readyAt: Nullable<String>.value("ready_at"),
                            sequence: 1,
                            status: BountyCaptureClipStatus.recording,
                            updatedAt: "updated_at",
                            videoUrl: Nullable<String>.value("video_url")
                        ),
                        BountyCaptureClip(
                            bountySubmissionId: "bounty_submission_id",
                            createdAt: "created_at",
                            durationSeconds: Nullable<Int>.value(1),
                            failureCode: Nullable<String>.value("failure_code"),
                            failureMessage: Nullable<String>.value("failure_message"),
                            framesUrl: Nullable<String>.value("frames_url"),
                            id: "id",
                            imuUrl: Nullable<String>.value("imu_url"),
                            manifestUrl: Nullable<String>.value("manifest_url"),
                            readyAt: Nullable<String>.value("ready_at"),
                            sequence: 1,
                            status: BountyCaptureClipStatus.recording,
                            updatedAt: "updated_at",
                            videoUrl: Nullable<String>.value("video_url")
                        )
                    ]),
                    captureFilename: Nullable<String>.value("capture_filename"),
                    capturedClipCount: 1,
                    capturedDurationSeconds: 1,
                    city: Nullable<String>.value("city"),
                    claimedAt: Nullable<String>.value("claimed_at"),
                    content: Nullable<String>.value("content"),
                    country: Nullable<String>.value("country"),
                    createdAt: "created_at",
                    deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
                    deliverableUrls: Nullable<[String]>.value([
                        "deliverable_urls",
                        "deliverable_urls"
                    ]),
                    denialReason: Nullable<String>.value("denial_reason"),
                    device: Nullable<String>.value("device"),
                    files: [
                        BountySubmissionFile(
                            attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        BountySubmissionFile(
                            attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    fov: Nullable<Int>.value(1),
                    id: "id",
                    latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                        endedAt: Nullable<String>.value("ended_at"),
                        id: "id",
                        recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                        recordingUrl: Nullable<String>.value("recording_url"),
                        startedAt: Nullable<String>.value("started_at"),
                        thumbnailUrl: Nullable<String>.value("thumbnail_url"),
                        title: "title"
                    )),
                    operator: Nullable<String>.value("operator"),
                    resolvedAt: Nullable<String>.value("resolved_at"),
                    site: Nullable<String>.value("site"),
                    station: Nullable<String>.value("station"),
                    status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
                    submittedAt: Nullable<String>.value("submitted_at"),
                    updatedAt: "updated_at",
                    worker: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                )
            ],
            pageInfo: ListBountySubmissionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.bountySubmissions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bnty_xxxxxxxxxxxxxx",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "btys_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "duration_seconds": 180,
                      "failure_code": "upload_failed",
                      "failure_message": "video: The video upload failed after 5 retries.",
                      "frames_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "bclip_xxxxxxxxxxxxxx",
                      "imu_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "manifest_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "ready_at": "2026-01-01T12:00:00.000Z",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "video_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "capture_filename": "US_Austin_BurnetRd_Bay2_mwebb",
                  "captured_clip_count": 0,
                  "captured_duration_seconds": 0,
                  "city": "Austin",
                  "claimed_at": "2026-01-01T12:00:00.000Z",
                  "content": "Ceramic coating reveal, shot at the Burnet Rd bay",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "https://tiktok.com/@shinetime/video/1"
                  ],
                  "denial_reason": "The clip never shows the finished paint.",
                  "device": "iPhone 15 Pro",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "image/png",
                      "filename": "ceramic-coating-cut.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "fov": 120,
                  "id": "btys_xxxxxxxxxxxxxx",
                  "latest_proof_livestream_feed": {
                    "ended_at": "2026-01-01T12:00:00.000Z",
                    "id": "lfeed_1",
                    "recording_status": "recording",
                    "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "started_at": "2026-01-01T12:00:00.000Z",
                    "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                    "title": "Untitled Livestream"
                  },
                  "operator": "mwebb",
                  "resolved_at": "2026-01-01T12:00:00.000Z",
                  "site": "BurnetRd",
                  "station": "Bay2",
                  "status": "in_progress",
                  "submitted_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "worker": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bnty_xxxxxxxxxxxxxx",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "btys_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    durationSeconds: Nullable<Int>.value(180),
                    failureCode: Nullable<String>.value("upload_failed"),
                    failureMessage: Nullable<String>.value("video: The video upload failed after 5 retries."),
                    framesUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    id: "bclip_xxxxxxxxxxxxxx",
                    imuUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    manifestUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    readyAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    videoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ]),
            captureFilename: Nullable<String>.value("US_Austin_BurnetRd_Bay2_mwebb"),
            capturedClipCount: 0,
            capturedDurationSeconds: 0,
            city: Nullable<String>.value("Austin"),
            claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            content: Nullable<String>.value("Ceramic coating reveal, shot at the Burnet Rd bay"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "https://tiktok.com/@shinetime/video/1"
            ]),
            denialReason: Nullable<String>.value("The clip never shows the finished paint."),
            device: Nullable<String>.value("iPhone 15 Pro"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("ceramic-coating-cut.png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            fov: Nullable<Int>.value(120),
            id: "btys_xxxxxxxxxxxxxx",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: "lfeed_1",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                title: "Untitled Livestream"
            )),
            operator: Nullable<String>.value("mwebb"),
            resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            site: Nullable<String>.value("BurnetRd"),
            station: Nullable<String>.value("Bay2"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            worker: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )
        )
        let response = try await client.bountySubmissions.create(
            request: .init(bountyId: "bnty_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bounty_id",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    },
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    }
                  ],
                  "capture_filename": "capture_filename",
                  "captured_clip_count": 1,
                  "captured_duration_seconds": 1,
                  "city": "city",
                  "claimed_at": "claimed_at",
                  "content": "content",
                  "country": "country",
                  "created_at": "created_at",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "deliverable_urls",
                    "deliverable_urls"
                  ],
                  "denial_reason": "denial_reason",
                  "device": "device",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "fov": 1,
                  "id": "id",
                  "latest_proof_livestream_feed": {
                    "ended_at": "ended_at",
                    "id": "id",
                    "recording_status": "recording",
                    "recording_url": "recording_url",
                    "started_at": "started_at",
                    "thumbnail_url": "thumbnail_url",
                    "title": "title"
                  },
                  "operator": "operator",
                  "resolved_at": "resolved_at",
                  "site": "site",
                  "station": "station",
                  "status": "in_progress",
                  "submitted_at": "submitted_at",
                  "updated_at": "updated_at",
                  "worker": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bounty_id",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                ),
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                )
            ]),
            captureFilename: Nullable<String>.value("capture_filename"),
            capturedClipCount: 1,
            capturedDurationSeconds: 1,
            city: Nullable<String>.value("city"),
            claimedAt: Nullable<String>.value("claimed_at"),
            content: Nullable<String>.value("content"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "deliverable_urls",
                "deliverable_urls"
            ]),
            denialReason: Nullable<String>.value("denial_reason"),
            device: Nullable<String>.value("device"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            fov: Nullable<Int>.value(1),
            id: "id",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("ended_at"),
                id: "id",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("recording_url"),
                startedAt: Nullable<String>.value("started_at"),
                thumbnailUrl: Nullable<String>.value("thumbnail_url"),
                title: "title"
            )),
            operator: Nullable<String>.value("operator"),
            resolvedAt: Nullable<String>.value("resolved_at"),
            site: Nullable<String>.value("site"),
            station: Nullable<String>.value("station"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("submitted_at"),
            updatedAt: "updated_at",
            worker: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )
        )
        let response = try await client.bountySubmissions.create(
            request: .init(bountyId: "bounty_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bnty_xxxxxxxxxxxxxx",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "btys_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "duration_seconds": 180,
                      "failure_code": "upload_failed",
                      "failure_message": "video: The video upload failed after 5 retries.",
                      "frames_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "bclip_xxxxxxxxxxxxxx",
                      "imu_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "manifest_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "ready_at": "2026-01-01T12:00:00.000Z",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "video_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "capture_filename": "US_Austin_BurnetRd_Bay2_mwebb",
                  "captured_clip_count": 0,
                  "captured_duration_seconds": 0,
                  "city": "Austin",
                  "claimed_at": "2026-01-01T12:00:00.000Z",
                  "content": "Ceramic coating reveal, shot at the Burnet Rd bay",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "https://tiktok.com/@shinetime/video/1"
                  ],
                  "denial_reason": "The clip never shows the finished paint.",
                  "device": "iPhone 15 Pro",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "image/png",
                      "filename": "ceramic-coating-cut.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "fov": 120,
                  "id": "btys_xxxxxxxxxxxxxx",
                  "latest_proof_livestream_feed": {
                    "ended_at": "2026-01-01T12:00:00.000Z",
                    "id": "lfeed_1",
                    "recording_status": "recording",
                    "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "started_at": "2026-01-01T12:00:00.000Z",
                    "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                    "title": "Untitled Livestream"
                  },
                  "operator": "mwebb",
                  "resolved_at": "2026-01-01T12:00:00.000Z",
                  "site": "BurnetRd",
                  "station": "Bay2",
                  "status": "in_progress",
                  "submitted_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "worker": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bnty_xxxxxxxxxxxxxx",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "btys_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    durationSeconds: Nullable<Int>.value(180),
                    failureCode: Nullable<String>.value("upload_failed"),
                    failureMessage: Nullable<String>.value("video: The video upload failed after 5 retries."),
                    framesUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    id: "bclip_xxxxxxxxxxxxxx",
                    imuUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    manifestUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    readyAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    videoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ]),
            captureFilename: Nullable<String>.value("US_Austin_BurnetRd_Bay2_mwebb"),
            capturedClipCount: 0,
            capturedDurationSeconds: 0,
            city: Nullable<String>.value("Austin"),
            claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            content: Nullable<String>.value("Ceramic coating reveal, shot at the Burnet Rd bay"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "https://tiktok.com/@shinetime/video/1"
            ]),
            denialReason: Nullable<String>.value("The clip never shows the finished paint."),
            device: Nullable<String>.value("iPhone 15 Pro"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("ceramic-coating-cut.png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            fov: Nullable<Int>.value(120),
            id: "btys_xxxxxxxxxxxxxx",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: "lfeed_1",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                title: "Untitled Livestream"
            )),
            operator: Nullable<String>.value("mwebb"),
            resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            site: Nullable<String>.value("BurnetRd"),
            station: Nullable<String>.value("Bay2"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            worker: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )
        )
        let response = try await client.bountySubmissions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bounty_id",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    },
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    }
                  ],
                  "capture_filename": "capture_filename",
                  "captured_clip_count": 1,
                  "captured_duration_seconds": 1,
                  "city": "city",
                  "claimed_at": "claimed_at",
                  "content": "content",
                  "country": "country",
                  "created_at": "created_at",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "deliverable_urls",
                    "deliverable_urls"
                  ],
                  "denial_reason": "denial_reason",
                  "device": "device",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "fov": 1,
                  "id": "id",
                  "latest_proof_livestream_feed": {
                    "ended_at": "ended_at",
                    "id": "id",
                    "recording_status": "recording",
                    "recording_url": "recording_url",
                    "started_at": "started_at",
                    "thumbnail_url": "thumbnail_url",
                    "title": "title"
                  },
                  "operator": "operator",
                  "resolved_at": "resolved_at",
                  "site": "site",
                  "station": "station",
                  "status": "in_progress",
                  "submitted_at": "submitted_at",
                  "updated_at": "updated_at",
                  "worker": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bounty_id",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                ),
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                )
            ]),
            captureFilename: Nullable<String>.value("capture_filename"),
            capturedClipCount: 1,
            capturedDurationSeconds: 1,
            city: Nullable<String>.value("city"),
            claimedAt: Nullable<String>.value("claimed_at"),
            content: Nullable<String>.value("content"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "deliverable_urls",
                "deliverable_urls"
            ]),
            denialReason: Nullable<String>.value("denial_reason"),
            device: Nullable<String>.value("device"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            fov: Nullable<Int>.value(1),
            id: "id",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("ended_at"),
                id: "id",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("recording_url"),
                startedAt: Nullable<String>.value("started_at"),
                thumbnailUrl: Nullable<String>.value("thumbnail_url"),
                title: "title"
            )),
            operator: Nullable<String>.value("operator"),
            resolvedAt: Nullable<String>.value("resolved_at"),
            site: Nullable<String>.value("site"),
            station: Nullable<String>.value("station"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("submitted_at"),
            updatedAt: "updated_at",
            worker: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )
        )
        let response = try await client.bountySubmissions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "btys_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteBountySubmissionsResponse(
            deleted: true,
            id: "btys_xxxxxxxxxxxxxx"
        )
        let response = try await client.bountySubmissions.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteBountySubmissionsResponse(
            deleted: true,
            id: "id"
        )
        let response = try await client.bountySubmissions.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func submit1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bnty_xxxxxxxxxxxxxx",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "btys_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "duration_seconds": 180,
                      "failure_code": "upload_failed",
                      "failure_message": "video: The video upload failed after 5 retries.",
                      "frames_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "bclip_xxxxxxxxxxxxxx",
                      "imu_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "manifest_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "ready_at": "2026-01-01T12:00:00.000Z",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "video_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "capture_filename": "US_Austin_BurnetRd_Bay2_mwebb",
                  "captured_clip_count": 0,
                  "captured_duration_seconds": 0,
                  "city": "Austin",
                  "claimed_at": "2026-01-01T12:00:00.000Z",
                  "content": "Ceramic coating reveal, shot at the Burnet Rd bay",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "https://tiktok.com/@shinetime/video/1"
                  ],
                  "denial_reason": "The clip never shows the finished paint.",
                  "device": "iPhone 15 Pro",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "image/png",
                      "filename": "ceramic-coating-cut.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "fov": 120,
                  "id": "btys_xxxxxxxxxxxxxx",
                  "latest_proof_livestream_feed": {
                    "ended_at": "2026-01-01T12:00:00.000Z",
                    "id": "lfeed_1",
                    "recording_status": "recording",
                    "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "started_at": "2026-01-01T12:00:00.000Z",
                    "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                    "title": "Untitled Livestream"
                  },
                  "operator": "mwebb",
                  "resolved_at": "2026-01-01T12:00:00.000Z",
                  "site": "BurnetRd",
                  "station": "Bay2",
                  "status": "in_progress",
                  "submitted_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "worker": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bnty_xxxxxxxxxxxxxx",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "btys_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    durationSeconds: Nullable<Int>.value(180),
                    failureCode: Nullable<String>.value("upload_failed"),
                    failureMessage: Nullable<String>.value("video: The video upload failed after 5 retries."),
                    framesUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    id: "bclip_xxxxxxxxxxxxxx",
                    imuUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    manifestUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    readyAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    videoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ]),
            captureFilename: Nullable<String>.value("US_Austin_BurnetRd_Bay2_mwebb"),
            capturedClipCount: 0,
            capturedDurationSeconds: 0,
            city: Nullable<String>.value("Austin"),
            claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            content: Nullable<String>.value("Ceramic coating reveal, shot at the Burnet Rd bay"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "https://tiktok.com/@shinetime/video/1"
            ]),
            denialReason: Nullable<String>.value("The clip never shows the finished paint."),
            device: Nullable<String>.value("iPhone 15 Pro"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("ceramic-coating-cut.png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            fov: Nullable<Int>.value(120),
            id: "btys_xxxxxxxxxxxxxx",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: "lfeed_1",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                title: "Untitled Livestream"
            )),
            operator: Nullable<String>.value("mwebb"),
            resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            site: Nullable<String>.value("BurnetRd"),
            station: Nullable<String>.value("Bay2"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            worker: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )
        )
        let response = try await client.bountySubmissions.submit(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func submit2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_id": "bounty_id",
                  "capture_clips": [
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    },
                    {
                      "bounty_submission_id": "bounty_submission_id",
                      "created_at": "created_at",
                      "duration_seconds": 1,
                      "failure_code": "failure_code",
                      "failure_message": "failure_message",
                      "frames_url": "frames_url",
                      "id": "id",
                      "imu_url": "imu_url",
                      "manifest_url": "manifest_url",
                      "ready_at": "ready_at",
                      "sequence": 1,
                      "status": "recording",
                      "updated_at": "updated_at",
                      "video_url": "video_url"
                    }
                  ],
                  "capture_filename": "capture_filename",
                  "captured_clip_count": 1,
                  "captured_duration_seconds": 1,
                  "city": "city",
                  "claimed_at": "claimed_at",
                  "content": "content",
                  "country": "country",
                  "created_at": "created_at",
                  "deliverable_type": "content_url",
                  "deliverable_urls": [
                    "deliverable_urls",
                    "deliverable_urls"
                  ],
                  "denial_reason": "denial_reason",
                  "device": "device",
                  "files": [
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "attachment_type": "image",
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "fov": 1,
                  "id": "id",
                  "latest_proof_livestream_feed": {
                    "ended_at": "ended_at",
                    "id": "id",
                    "recording_status": "recording",
                    "recording_url": "recording_url",
                    "started_at": "started_at",
                    "thumbnail_url": "thumbnail_url",
                    "title": "title"
                  },
                  "operator": "operator",
                  "resolved_at": "resolved_at",
                  "site": "site",
                  "station": "station",
                  "status": "in_progress",
                  "submitted_at": "submitted_at",
                  "updated_at": "updated_at",
                  "worker": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BountySubmission(
            bountyId: "bounty_id",
            captureClips: Nullable<[BountyCaptureClip]>.value([
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                ),
                BountyCaptureClip(
                    bountySubmissionId: "bounty_submission_id",
                    createdAt: "created_at",
                    durationSeconds: Nullable<Int>.value(1),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    framesUrl: Nullable<String>.value("frames_url"),
                    id: "id",
                    imuUrl: Nullable<String>.value("imu_url"),
                    manifestUrl: Nullable<String>.value("manifest_url"),
                    readyAt: Nullable<String>.value("ready_at"),
                    sequence: 1,
                    status: BountyCaptureClipStatus.recording,
                    updatedAt: "updated_at",
                    videoUrl: Nullable<String>.value("video_url")
                )
            ]),
            captureFilename: Nullable<String>.value("capture_filename"),
            capturedClipCount: 1,
            capturedDurationSeconds: 1,
            city: Nullable<String>.value("city"),
            claimedAt: Nullable<String>.value("claimed_at"),
            content: Nullable<String>.value("content"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            deliverableType: Nullable<BountySubmissionDeliverableType>.value(BountySubmissionDeliverableType.contentUrl),
            deliverableUrls: Nullable<[String]>.value([
                "deliverable_urls",
                "deliverable_urls"
            ]),
            denialReason: Nullable<String>.value("denial_reason"),
            device: Nullable<String>.value("device"),
            files: [
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                BountySubmissionFile(
                    attachmentType: Nullable<BountySubmissionFileAttachmentType>.value(BountySubmissionFileAttachmentType.image),
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            fov: Nullable<Int>.value(1),
            id: "id",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("ended_at"),
                id: "id",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("recording_url"),
                startedAt: Nullable<String>.value("started_at"),
                thumbnailUrl: Nullable<String>.value("thumbnail_url"),
                title: "title"
            )),
            operator: Nullable<String>.value("operator"),
            resolvedAt: Nullable<String>.value("resolved_at"),
            site: Nullable<String>.value("site"),
            station: Nullable<String>.value("station"),
            status: Nullable<BountySubmissionStatus>.value(BountySubmissionStatus.inProgress),
            submittedAt: Nullable<String>.value("submitted_at"),
            updatedAt: "updated_at",
            worker: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )
        )
        let response = try await client.bountySubmissions.submit(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}