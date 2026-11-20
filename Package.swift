// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadGoogleAdMobAdapter) is what
// BidmadSDK looks up at runtime. BidmadGoogleAdMobAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
//
// Versions: 7.2.x works with BidmadSDK 7.2.x. The part after "+" is the
// GoogleMobileAds version this build pins.
let package = Package(
  name: "BidmadGoogleAdMobAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadGoogleAdMobAdapter", targets: ["BidmadGoogleAdMobAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.2")),
    .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.2.0"),
  ],
  targets: [
    .target(
      name: "BidmadGoogleAdMobAdapterLoader",
      dependencies: [
        "BidmadGoogleAdMobAdapter",
        .product(name: "BidmadSDK", package: "BidmadSDK-SPM"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ]
    ),
    .binaryTarget(
      name: "BidmadGoogleAdMobAdapter",
      url: "https://github.com/bidmad/BidmadGoogleAdMobAdapter-SPM/releases/download/7.2.0-dev.2+13.2.0/BidmadGoogleAdMobAdapter.xcframework.zip",
      checksum: "a6300b34dc52a3d99e81e012afaa28a86d362c1fc4be6a7dd81dc20e22a44b28"
    ),
  ]
)
