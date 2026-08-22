import Foundation
import Testing
import WhopSDK

@Suite("CourseStudentsClient Wire Tests") struct CourseStudentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "completed_lessons_count": 42,
                      "completion_rate": 6.9,
                      "first_interaction_at": "2023-12-01T05:00:00Z",
                      "id": "id",
                      "last_interaction_at": "2023-12-01T05:00:00Z",
                      "total_lessons_count": 42,
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
        let expectedResponse = ListCourseStudentsResponse(
            data: [
                CourseStudentListItem(
                    completedLessonsCount: 42,
                    completionRate: 6.9,
                    firstInteractionAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "id",
                    lastInteractionAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    totalLessonsCount: 42,
                    user: CourseStudentListItemUser(
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
        let response = try await client.courseStudents.list(
            first: 42,
            last: 42,
            courseId: "cors_xxxxxxxxxxxxx",
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
                  "completed_lessons_count": 42,
                  "completion_rate": 6.9,
                  "course": {
                    "experience": {
                      "id": "exp_xxxxxxxxxxxxxx"
                    },
                    "id": "cors_xxxxxxxxxxxxx",
                    "title": "Introduction to Technical Analysis"
                  },
                  "first_interaction_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "last_interaction_at": "2023-12-01T05:00:00Z",
                  "total_lessons_count": 42,
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
        let expectedResponse = CourseStudent(
            completedLessonsCount: 42,
            completionRate: 6.9,
            course: CourseStudentCourse(
                experience: CourseStudentCourseExperience(
                    id: "exp_xxxxxxxxxxxxxx"
                ),
                id: "cors_xxxxxxxxxxxxx",
                title: Nullable<String>.value("Introduction to Technical Analysis")
            ),
            firstInteractionAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            lastInteractionAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            totalLessonsCount: 42,
            user: CourseStudentUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.courseStudents.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}