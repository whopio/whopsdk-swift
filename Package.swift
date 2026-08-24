// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "WhopSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "WhopSDK",
            targets: ["WhopSDK"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WhopSDK",
            path: "Sources"
        ),
        .testTarget(
            name: "WhopSDKTests",
            dependencies: ["WhopSDK"],
            path: "Tests"
        )
    ]
)
