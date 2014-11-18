beautifyHTML = require "./BeautifyHTML.js"

class CodeSampler
  
  selector: "[data-code-sampler]"
  
  constructor: ->
    @$selector = $(@selector)
    @update()

  update: ->
    @$selector.each (index, el) ->
      $source = $(el)

      target = $(el).data("code-sampler")
      $target = $("##{target}")

      insertAfter = true unless target.length > 0

      codeSnippet = $source.html().replace(/^\s+|\s+$/g, '')
      codeSnippet = beautifyHTML.html_beautify(codeSnippet, {wrap_line_length: 80})
      $snippet = $("<pre class='code-sample'><code></code></pre>")
      $snippet.find("code").text codeSnippet
      
      if insertAfter
        $snippet.insertAfter $source
      else
        $target.append $snippet

  destroy: ->
    @$selector.each (index, el) ->
      $target = $(el).next '.code-sample'
      $target.remove()


module.exports = CodeSampler