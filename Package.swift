// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SDL",
    products: [
        .library(
            name: "SDL",
            targets: ["SDL"]),
        .executable(
            name: "SDLDemo",
            targets: ["SDLDemo"]),
        ],
    targets: [
        .target(
            name: "SDLDemo",
            dependencies: ["SDL"]),
        .target(
            name: "SDL",
            dependencies: ["CSDL2", "CSDL2GFX", "CSDL2TTF"]),
        .systemLibrary(
            name: "CSDL2",
            pkgConfig: "sdl2",
            providers: [
                .brew(["sdl2"]),
                .apt(["libsdl2-dev"])
            ]),
        .systemLibrary(
            name: "CSDL2GFX",
            pkgConfig: "SDL2_gfx"),
        .systemLibrary(
            name: "CSDL2TTF",
            pkgConfig: "SDL2_ttf",
            providers: [
                .apt(["libsdl2-ttf-dev"])
                // TODO: does homebrew have this as well?
            ]),
        .testTarget(
            name: "SDLTests",
            dependencies: ["SDL"]),
        ],
    swiftLanguageVersions: [.v5]
)
