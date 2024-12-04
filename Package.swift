// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "PhoneBooth",
    platforms: [.macOS(.v11), .iOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/TokamakUI/Tokamak", from: "0.11.0"),
        .package(url: "https://github.com/swiftwasm/carton", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "PhoneBooth",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ],
            path: "Sources/PhoneBooth"
        ),
    ]
)
