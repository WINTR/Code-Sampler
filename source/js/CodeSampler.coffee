beautifyHTML = require "./BeautifyHTML.js"

class CodeSampler
  
  selector: "[data-code-sampler]"
  
  constructor: ->
    @$selector = $(@selector)
    @update()

  update: ->
    @$selector.each (index, el) ->
      $source = $(el)
      codeSnippet = $source.html().replace(/^\s+|\s+$/g, '')
      codeSnippet = beautifyHTML.html_beautify(codeSnippet, {wrap_line_length: 80})
      $target = $("<pre class='code-sample'><code></code></pre>")
      $target.find("code").text codeSnippet
      $target.insertAfter $source

  destroy: ->
    @$selector.each (index, el) ->
      $source = $(el)
      target = $(el).attr("data-code-sampler-target")
      $target = $("##{target}")

      $target.html("")


module.exports = CodeSampler