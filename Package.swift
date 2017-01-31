// Generated automatically by Perfect Assistant Application
// Date: 2017-01-24 22:31:54 +0000
import PackageDescription
let package = Package(
    name: "hello-persistence",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", versions: Version(2,1,13)..<Version(3,0,0)),
        .Package(url: "https://github.com/SwiftORM/Postgres-StORM.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", majorVersion: 2),
    ]
)
