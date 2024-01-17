// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LPGSharedModels",
    platforms: [
       .iOS(.v16),
       .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LPGSharedModels",
            targets: ["LPGSharedModels"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-url-routing.git", from: "0.6.0"),
//        .package(path: "/Users/alif/Developer/Swift/MySideProjects/LearnPlayGrow/swift-url-routing"),
        .package(url: "https://github.com/orlandos-nl/BSON.git", from: "8.0.9")
    ],
    targets: [
        .target(
            name: "LPGSharedModels",
            dependencies: [
                .product(name: "URLRouting", package: "swift-url-routing"),
                .product(name: "BSON", package: "BSON")
            ]
        ),
        .testTarget(
            name: "LPGSharedModelsTests",
            dependencies: ["LPGSharedModels"]),
    ]
)
