// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Caffeine",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .visionOS(.v1),
        .watchOS(.v10)
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
