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

do {
  try HTTPServer.launch(name: "localhost", port: 8080, routes: routes)
    
} catch PerfectError.networkError(let err, let msg) {
  print("Network error thrown: \(err) \(msg)")
}
