import Foundation
import Testing
import WhopSDK

@Suite("CourseLessonInteractionsClient Wire Tests") struct CourseLessonInteractionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "completed": true,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "crsli_xxxxxxxxxxxx",
                      "lesson": {
                        "chapter": {
                          "id": "chap_xxxxxxxxxxxxx"
                        },
                        "id": "lesn_xxxxxxxxxxxxx",
                        "title": "Understanding Candlestick Patterns"
                      },
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
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
        let expectedResponse = ListCourseLessonInteractionsResponse(
            data: [
                CourseLessonInteractionListItem(
                    completed: true,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "crsli_xxxxxxxxxxxx",
                    lesson: CourseLessonInteractionListItemLesson(
                        chapter: CourseLessonInteractionListItemLessonChapter(
                            id: "chap_xxxxxxxxxxxxx"
                        ),
                        id: "lesn_xxxxxxxxxxxxx",
                        title: "Understanding Candlestick Patterns"
                    ),
                    user: CourseLessonInteractionListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courseLessonInteractions.list(
            first: 42,
            last: 42,
            userId: "user_xxxxxxxxxxxxx",
            lessonId: "lesn_xxxxxxxxxxxxx",
            courseId: "cors_xxxxxxxxxxxxx",
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
                      "completed": true,
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "lesson": {
                        "chapter": {
                          "id": "id"
                        },
                        "id": "id",
                        "title": "title"
                      },
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
                    },
                    {
                      "completed": true,
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "lesson": {
                        "chapter": {
                          "id": "id"
                        },
                        "id": "id",
                        "title": "title"
                      },
                      "user": {
                        "id": "id",
                        "name": "name",
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
        let expectedResponse = ListCourseLessonInteractionsResponse(
            data: [
                CourseLessonInteractionListItem(
                    completed: true,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    lesson: CourseLessonInteractionListItemLesson(
                        chapter: CourseLessonInteractionListItemLessonChapter(
                            id: "id"
                        ),
                        id: "id",
                        title: "title"
                    ),
                    user: CourseLessonInteractionListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                ),
                CourseLessonInteractionListItem(
                    completed: true,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    lesson: CourseLessonInteractionListItemLesson(
                        chapter: CourseLessonInteractionListItemLessonChapter(
                            id: "id"
                        ),
                        id: "id",
                        title: "title"
                    ),
                    user: CourseLessonInteractionListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courseLessonInteractions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "completed": true,
                  "course": {
                    "experience": {
                      "id": "exp_xxxxxxxxxxxxxx"
                    },
                    "id": "cors_xxxxxxxxxxxxx",
                    "title": "Introduction to Technical Analysis"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "crsli_xxxxxxxxxxxx",
                  "lesson": {
                    "chapter": {
                      "id": "chap_xxxxxxxxxxxxx"
                    },
                    "id": "lesn_xxxxxxxxxxxxx",
                    "title": "Understanding Candlestick Patterns"
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = CourseLessonInteraction(
            completed: true,
            course: CourseLessonInteractionCourse(
                experience: CourseLessonInteractionCourseExperience(
                    id: "exp_xxxxxxxxxxxxxx"
                ),
                id: "cors_xxxxxxxxxxxxx",
                title: Nullable<String>.value("Introduction to Technical Analysis")
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "crsli_xxxxxxxxxxxx",
            lesson: CourseLessonInteractionLesson(
                chapter: CourseLessonInteractionLessonChapter(
                    id: "chap_xxxxxxxxxxxxx"
                ),
                id: "lesn_xxxxxxxxxxxxx",
                title: "Understanding Candlestick Patterns"
            ),
            user: CourseLessonInteractionUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.courseLessonInteractions.retrieve(
            id: "crsli_xxxxxxxxxxxx",
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
                  "completed": true,
                  "course": {
                    "experience": {
                      "id": "id"
                    },
                    "id": "id",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "lesson": {
                    "chapter": {
                      "id": "id"
                    },
                    "id": "id",
                    "title": "title"
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
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
        let expectedResponse = CourseLessonInteraction(
            completed: true,
            course: CourseLessonInteractionCourse(
                experience: CourseLessonInteractionCourseExperience(
                    id: "id"
                ),
                id: "id",
                title: Nullable<String>.value("title")
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            lesson: CourseLessonInteractionLesson(
                chapter: CourseLessonInteractionLessonChapter(
                    id: "id"
                ),
                id: "id",
                title: "title"
            ),
            user: CourseLessonInteractionUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.courseLessonInteractions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}