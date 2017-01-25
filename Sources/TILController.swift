import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

// Responsibility: call appropriate func & set header/body/completed

final class TILController {

  func addRoutes(routes: inout Routes) {
    routes.add(method: .get, uri: "/til", handler: indexView)
    routes.add(method: .post, uri: "/til", handler: addAcronym)
    routes.add(method: .post, uri: "/til/{id}/delete", handler: deleteAcronym)
  }

  func indexView(request: HTTPRequest, response: HTTPResponse) {
    do {
      var values = MustacheEvaluationContext.MapType()
      values["acronyms"] = try AcronymAPI.allAsDictionary()
      mustacheRequest(request: request, response: response, handler: MustacheHelper(values: values), templatePath: request.documentRoot + "/index.mustache")
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func addAcronym(request: HTTPRequest, response: HTTPResponse) {
    do {
      guard let short = request.param(name: "short"), let long = request.param(name: "long") else {
        response.status = .badRequest
        response.completed()
        return
      }
      _ = try AcronymAPI.newAcronym(withShort: short, long: long)
      response.status = .movedPermanently
      response.setHeader(.location, value: "/til")
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

  func deleteAcronym(request: HTTPRequest, response: HTTPResponse) {
    do {
      guard let idString = request.urlVariables["id"],
        let id = Int(idString) else {
        response.status = .badRequest
        response.completed()
        return
      }
      try AcronymAPI.delete(id: id)
      response.status = .movedPermanently
      response.setHeader(.location, value: "/til")
      response.completed()
    } catch {
      response.status = .internalServerError
      response.setBody(string: "Error handling request: \(error)")
      response.completed()
    }
  }

}
