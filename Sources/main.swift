import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import StORM
import PostgresStORM
import Foundation

if let host = ProcessInfo.processInfo.environment["DATABASE_HOST"] {
  PostgresConnector.host = host
} else {
  PostgresConnector.host = "localhost"
}
PostgresConnector.username	= "perfect"
PostgresConnector.password	= "perfect"
PostgresConnector.database	= "perfect_testing"
PostgresConnector.port		= 5432

// Create db tables
let setupObj = Acronym()
try? setupObj.setup()

let basic = BasicController()
let til = TILController()

let routes = basic.routes + til.routes

let server = HTTPServer()
server.addRoutes(Routes(routes))
server.serverPort = 8080
server.documentRoot = "webroot"

do {
  // Didn't work - no way to set webroot as far as I can tell...
  // let context = try HTTPServer.launch(name: "localhost", port: 8080, routes: routes)

  try server.start()
} catch PerfectError.networkError(let err, let msg) {
  print("Network error thrown: \(err) \(msg)")
}
