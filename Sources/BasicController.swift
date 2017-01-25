import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// Responsibility: call appropriate func, deal with request/response, exception handling

final class BasicController {

  func addRoutes(routes: inout Routes) {
    routes.add(method: .get, uri: "/test", handler: test)
    routes.add(method: .post, uri: "/new", handler: new)
    routes.add(method: .get, uri: "/all", handler: all)
    routes.add(method: .get, uri: "/first", handler: first)
    routes.add(method: .get, uri: "/afks", handler: afks)
    routes.add(method: .get, uri: "/non-afks", handler: nonAfks)
    routes.add(method: .post, uri: "/update", handler: update)
    routes.add(method: .get, uri: "/delete-first", handler: deleteFirst)
  }

  func test(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.test()
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func new(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.newAcronym(withJSONRequest: request.postBodyString)
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func all(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.all()
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func first(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.first()
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func afks(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.matchingShort("AFK")
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func nonAfks(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.notMatchingShort("AFK")
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func update(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.updateAcronym(withJSONRequest: request.postBodyString)
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func deleteFirst(request: HTTPRequest, response: HTTPResponse) {
    do {
      let json = try AcronymAPI.deleteFirst()
      response.setHeader(.contentType, value: "application/json")
      response.setBody(string: json)
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

}
