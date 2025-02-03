// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Modules",
    products: [
        .library(
            name: "Modules",
            targets: ["Core", "AuthModule", "Models", "ErrorHandling", "Service"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            dependencies: []
        ),
        .target(
            name: "Models",
            dependencies: []
        ),
        .target(
            name: "ErrorHandling",
            dependencies: []
        ),
        .target(
            name: "AuthModule",
            dependencies: ["Core", "Models", "ErrorHandling"]
        ),
        .target(
            name: "Service",
            dependencies: ["Models", "ErrorHandling"]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]
        )
    ]
)
