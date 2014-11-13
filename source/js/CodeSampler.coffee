beautifyHTML = require "./BeautifyHTML.js"

class CodeSampler
  
  selector: "[data-code-sampler-target]"
  
  constructor: ->
    @$selector = $(@selector)
    @update()

  update: ->
    @$selector.each (index, el) ->
      $source = $(el)
      target = $(el).attr("data-code-sampler-target")
      $target = $("##{target}")

      codeSnippet = $source.html().replace(/^\s+|\s+$/g, '')
      codeSnippet = beautifyHTML.html_beautify(codeSnippet, {wrap_line_length: 80})

      $target.html("<pre><code></code></pre>")
      $target.find("code").text codeSnippet

  destroy: ->
    @$selector.each (index, el) ->
      $source = $(el)
      target = $(el).attr("data-code-sampler-target")
      $target = $("##{target}")

      $target.html("")


module.exports = CodeSampler