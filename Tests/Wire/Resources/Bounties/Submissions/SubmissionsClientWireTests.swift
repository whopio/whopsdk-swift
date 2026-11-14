import Foundation
import Testing
import WhopSDK

@Suite("SubmissionsClient Wire Tests") struct SubmissionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "bounty_id": "bnty_xxxxxxxxxxxxxx",
                      "claimed_at": "2026-01-01T12:00:00.000Z",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "denial_reason": "The wheels were never shown in the finished clip.",
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
                      "resolved_at": "2026-01-01T12:00:00.000Z",
                      "status": "submitted",
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
        let expectedResponse = ListSubmissionsResponse(
            data: [
                PublicBountySubmission(
                    bountyId: "bnty_xxxxxxxxxxxxxx",
                    claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    denialReason: Nullable<String>.value("The wheels were never shown in the finished clip."),
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
                    resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: PublicBountySubmissionStatus.submitted,
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
            pageInfo: ListSubmissionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.bounties.submissions.list(
            bountyId: "bounty_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "claimed_at": "claimed_at",
                      "created_at": "created_at",
                      "denial_reason": "denial_reason",
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
                      "resolved_at": "resolved_at",
                      "status": "submitted",
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
                      "claimed_at": "claimed_at",
                      "created_at": "created_at",
                      "denial_reason": "denial_reason",
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
                      "resolved_at": "resolved_at",
                      "status": "submitted",
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
        let expectedResponse = ListSubmissionsResponse(
            data: [
                PublicBountySubmission(
                    bountyId: "bounty_id",
                    claimedAt: Nullable<String>.value("claimed_at"),
                    createdAt: "created_at",
                    denialReason: Nullable<String>.value("denial_reason"),
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
                    resolvedAt: Nullable<String>.value("resolved_at"),
                    status: PublicBountySubmissionStatus.submitted,
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
                PublicBountySubmission(
                    bountyId: "bounty_id",
                    claimedAt: Nullable<String>.value("claimed_at"),
                    createdAt: "created_at",
                    denialReason: Nullable<String>.value("denial_reason"),
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
                    resolvedAt: Nullable<String>.value("resolved_at"),
                    status: PublicBountySubmissionStatus.submitted,
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
            pageInfo: ListSubmissionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.bounties.submissions.list(
            bountyId: "bounty_id",
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
                  "claimed_at": "2026-01-01T12:00:00.000Z",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "denial_reason": "The wheels were never shown in the finished clip.",
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
                  "resolved_at": "2026-01-01T12:00:00.000Z",
                  "status": "submitted",
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
        let expectedResponse = PublicBountySubmission(
            bountyId: "bnty_xxxxxxxxxxxxxx",
            claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            createdAt: "2026-01-01T12:00:00.000Z",
            denialReason: Nullable<String>.value("The wheels were never shown in the finished clip."),
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
            resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: PublicBountySubmissionStatus.submitted,
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
        let response = try await client.bounties.submissions.retrieve(
            bountyId: "bounty_id",
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
                  "claimed_at": "claimed_at",
                  "created_at": "created_at",
                  "denial_reason": "denial_reason",
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
                  "resolved_at": "resolved_at",
                  "status": "submitted",
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
        let expectedResponse = PublicBountySubmission(
            bountyId: "bounty_id",
            claimedAt: Nullable<String>.value("claimed_at"),
            createdAt: "created_at",
            denialReason: Nullable<String>.value("denial_reason"),
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
            resolvedAt: Nullable<String>.value("resolved_at"),
            status: PublicBountySubmissionStatus.submitted,
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
        let response = try await client.bounties.submissions.retrieve(
            bountyId: "bounty_id",
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}