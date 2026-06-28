// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MorphingButton",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MorphingButton",
            targets: ["MorphingButton"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MorphingButton",
            dependencies: [],
            path: "Sources/MorphingButton")
    ]
)
