// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Caffeine",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
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
