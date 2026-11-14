import Foundation
import Testing
import WhopSDK

@Suite("TopicsClient Wire Tests") struct TopicsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "default_preference_value": false,
                      "description": "A customer books and pays for a detail",
                      "id": "topic_xxxxxxxxxxxxxx",
                      "identifier": "notification_topic1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "is_mention": true,
                      "name": "New sales",
                      "topic_type": "account"
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
        let expectedResponse = ListTopicsResponse(
            data: [
                NotificationTopic(
                    defaultPreferenceValue: false,
                    description: Nullable<String>.value("A customer books and pays for a detail"),
                    id: "topic_xxxxxxxxxxxxxx",
                    identifier: "notification_topic1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    isMention: true,
                    name: "New sales",
                    topicType: NotificationTopicTopicType.account
                )
            ],
            pageInfo: ListTopicsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.notifications.topics.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "default_preference_value": true,
                      "description": "description",
                      "id": "id",
                      "identifier": "identifier",
                      "is_mention": true,
                      "name": "name",
                      "topic_type": "account"
                    },
                    {
                      "default_preference_value": true,
                      "description": "description",
                      "id": "id",
                      "identifier": "identifier",
                      "is_mention": true,
                      "name": "name",
                      "topic_type": "account"
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
        let expectedResponse = ListTopicsResponse(
            data: [
                NotificationTopic(
                    defaultPreferenceValue: true,
                    description: Nullable<String>.value("description"),
                    id: "id",
                    identifier: "identifier",
                    isMention: true,
                    name: "name",
                    topicType: NotificationTopicTopicType.account
                ),
                NotificationTopic(
                    defaultPreferenceValue: true,
                    description: Nullable<String>.value("description"),
                    id: "id",
                    identifier: "identifier",
                    isMention: true,
                    name: "name",
                    topicType: NotificationTopicTopicType.account
                )
            ],
            pageInfo: ListTopicsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.notifications.topics.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}