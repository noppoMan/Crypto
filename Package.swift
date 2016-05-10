import PackageDescription

#if os(OSX)
    let openSSLRepo = "https://github.com/noppoMan/COpenSSL-OSX.git"
#else
    let openSSLRepo = "https://github.com/noppoMan/COpenSSL.git"
#endif

let package = Package(
	name: "Crypto",
	dependencies: [
      .Package(url: "https://github.com/open-swift/C7.git", majorVersion: 0, minor: 7),
      .Package(url: openSSLRepo, majorVersion: 0, minor: 1)
  ]
)
