import PerfectMustache

struct MustacheHelper: MustachePageHandler {
  var values: MustacheEvaluationContext.MapType

  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    contxt.extendValues(with: values)
    do {
      try contxt.requestCompleted(withCollector: collector)
    } catch {
      let response = contxt.webResponse
      response.status = .internalServerError
      response.appendBody(string: "\(error)")
      response.completed()
    }
  }
}
