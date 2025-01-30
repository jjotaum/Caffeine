// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Caffeine",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .visionOS(.v1),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Caffeine",
            targets: ["Caffeine"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Caffeine",
            dependencies: []),
        .testTarget(
            name: "CaffeineTests",
            dependencies: ["Caffeine"]),
    ]
)
