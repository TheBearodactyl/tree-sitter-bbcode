// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterBBcode",
    products: [
        .library(name: "TreeSitterBBcode", targets: ["TreeSitterBBcode"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterBBcode",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterBBcodeTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterBBcode",
            ],
            path: "bindings/swift/TreeSitterBBcodeTests"
        )
    ],
    cLanguageStandard: .c11
)
