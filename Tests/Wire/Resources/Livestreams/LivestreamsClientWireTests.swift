import Foundation
import Testing
import WhopSDK

@Suite("LivestreamsClient Wire Tests") struct LivestreamsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "ended_at": "2026-01-01T12:00:00.000Z",
                      "id": "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
                      "pinned_at": "2026-01-01T12:00:00.000Z",
                      "recording_started_at": "2026-01-01T12:00:00.000Z",
                      "recording_status": "recording",
                      "recording_url": "https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4",
                      "started_at": "2026-01-01T12:00:00.000Z",
                      "thumbnail_url": "https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg",
                      "title": "Live edit: blue hour"
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
        let expectedResponse = ListLivestreamsResponse(
            data: [
                Livestream(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
                    pinnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    recordingStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    recordingStatus: Nullable<LivestreamRecordingStatus>.value(LivestreamRecordingStatus.recording),
                    recordingUrl: Nullable<String>.value("https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4"),
                    startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    thumbnailUrl: Nullable<String>.value("https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg"),
                    title: "Live edit: blue hour"
                )
            ],
            pageInfo: ListLivestreamsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.livestreams.list(
            experienceId: "experience_id",
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "id": "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
                  "pinned_at": "2026-01-01T12:00:00.000Z",
                  "recording_started_at": "2026-01-01T12:00:00.000Z",
                  "recording_status": "recording",
                  "recording_url": "https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4",
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "thumbnail_url": "https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg",
                  "title": "Live edit: blue hour"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Livestream(
            createdAt: "2026-01-01T12:00:00.000Z",
            endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
            pinnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStatus: Nullable<LivestreamRecordingStatus>.value(LivestreamRecordingStatus.recording),
            recordingUrl: Nullable<String>.value("https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4"),
            startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            thumbnailUrl: Nullable<String>.value("https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg"),
            title: "Live edit: blue hour"
        )
        let response = try await client.livestreams.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pin1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "id": "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
                  "pinned_at": "2026-01-01T12:00:00.000Z",
                  "recording_started_at": "2026-01-01T12:00:00.000Z",
                  "recording_status": "recording",
                  "recording_url": "https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4",
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "thumbnail_url": "https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg",
                  "title": "Live edit: blue hour"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Livestream(
            createdAt: "2026-01-01T12:00:00.000Z",
            endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
            pinnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStatus: Nullable<LivestreamRecordingStatus>.value(LivestreamRecordingStatus.recording),
            recordingUrl: Nullable<String>.value("https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4"),
            startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            thumbnailUrl: Nullable<String>.value("https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg"),
            title: "Live edit: blue hour"
        )
        let response = try await client.livestreams.pin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpin1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "id": "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
                  "pinned_at": "2026-01-01T12:00:00.000Z",
                  "recording_started_at": "2026-01-01T12:00:00.000Z",
                  "recording_status": "recording",
                  "recording_url": "https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4",
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "thumbnail_url": "https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg",
                  "title": "Live edit: blue hour"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Livestream(
            createdAt: "2026-01-01T12:00:00.000Z",
            endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "lfeed_xxxxxxxxxxxxxxxxxxxxxx",
            pinnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            recordingStatus: Nullable<LivestreamRecordingStatus>.value(LivestreamRecordingStatus.recording),
            recordingUrl: Nullable<String>.value("https://whop-livestreams-example.s3.amazonaws.com/room/lfeed_xxxxxxxxxxxxxxxxxxxxxx.mp4"),
            startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            thumbnailUrl: Nullable<String>.value("https://img.whop.com/livestreams/lfeed_xxxxxxxxxxxxxxxxxxxxxx.jpg"),
            title: "Live edit: blue hour"
        )
        let response = try await client.livestreams.unpin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}