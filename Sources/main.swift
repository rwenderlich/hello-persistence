import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import StORM
import PostgresStORM
import Foundation

let server = HTTPServer()
var routes = Routes()

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
basic.addRoutes(routes: &routes)

let til = TILController()
til.addRoutes(routes: &routes)

server.addRoutes(routes)
server.serverPort = 8080
server.documentRoot = "webroot"

do {
  try server.start()
} catch PerfectError.networkError(let err, let msg) {
  print("Network error thrown: \(err) \(msg)")
}
