; extends

; The bundled jinja injections only handle jinja_inline (inside {{ }} / {% %}) and
; comments, so nothing ever pulls the surrounding markup back in -- which is why
; .html templates got jinja delimiters but no HTML tree.
;
; The jinja grammar emits the non-jinja text as a series of (content) nodes, one per
; gap between jinja blocks. injection.combined is required: without it each (content)
; node parses as its own HTML tree, so a <div> opened before a {% if %} and closed
; after {% endif %} would never pair up.
((content) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined))
