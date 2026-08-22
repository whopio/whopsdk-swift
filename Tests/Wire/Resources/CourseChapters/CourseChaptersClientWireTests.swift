import Foundation
import Testing
import WhopSDK

@Suite("CourseChaptersClient Wire Tests") struct CourseChaptersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "chap_xxxxxxxxxxxxx",
                      "order": 42,
                      "title": "Getting Started"
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
        let expectedResponse = ListCourseChaptersResponse(
            data: [
                CourseChapterListItem(
                    id: "chap_xxxxxxxxxxxxx",
                    order: 42,
                    title: "Getting Started"
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courseChapters.list(
            first: 42,
            last: 42,
            courseId: "cors_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "chap_xxxxxxxxxxxxx",
                  "lessons": [
                    {
                      "id": "lesn_xxxxxxxxxxxxx",
                      "order": 42,
                      "title": "Understanding Candlestick Patterns"
                    }
                  ],
                  "order": 42,
                  "title": "Getting Started"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseChapter(
            id: "chap_xxxxxxxxxxxxx",
            lessons: [
                CourseChapterLessonsItem(
                    id: "lesn_xxxxxxxxxxxxx",
                    order: 42,
                    title: "Understanding Candlestick Patterns"
                )
            ],
            order: 42,
            title: "Getting Started"
        )
        let response = try await client.courseChapters.create(
            request: .init(courseId: "cors_xxxxxxxxxxxxx"),
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
                  "id": "chap_xxxxxxxxxxxxx",
                  "lessons": [
                    {
                      "id": "lesn_xxxxxxxxxxxxx",
                      "order": 42,
                      "title": "Understanding Candlestick Patterns"
                    }
                  ],
                  "order": 42,
                  "title": "Getting Started"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseChapter(
            id: "chap_xxxxxxxxxxxxx",
            lessons: [
                CourseChapterLessonsItem(
                    id: "lesn_xxxxxxxxxxxxx",
                    order: 42,
                    title: "Understanding Candlestick Patterns"
                )
            ],
            order: 42,
            title: "Getting Started"
        )
        let response = try await client.courseChapters.retrieve(
            id: "chap_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.courseChapters.delete(
            id: "chap_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "chap_xxxxxxxxxxxxx",
                  "lessons": [
                    {
                      "id": "lesn_xxxxxxxxxxxxx",
                      "order": 42,
                      "title": "Understanding Candlestick Patterns"
                    }
                  ],
                  "order": 42,
                  "title": "Getting Started"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseChapter(
            id: "chap_xxxxxxxxxxxxx",
            lessons: [
                CourseChapterLessonsItem(
                    id: "lesn_xxxxxxxxxxxxx",
                    order: 42,
                    title: "Understanding Candlestick Patterns"
                )
            ],
            order: 42,
            title: "Getting Started"
        )
        let response = try await client.courseChapters.update(
            id: "chap_xxxxxxxxxxxxx",
            request: .init(title: "title"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}