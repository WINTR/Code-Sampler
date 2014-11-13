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
      $target = $(el).next '.code-sample'
      $target.remove()


module.exports = CodeSampler