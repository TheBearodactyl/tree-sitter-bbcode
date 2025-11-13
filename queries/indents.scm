; Increase indent for block-level tags
[
  (bold)
  (italic)
  (underline)
  (strikethrough)
  (color)
  (size)
  (url)
  (email)
  (quote)
  (code)
  (list)
  (box)
  (spoiler)
  (spoilerbox)
  (center)
  (heading)
  (notice)
  (imagemap)
] @indent.begin

; Dedent at closing tags
[
  "[/b]"
  "[/i]"
  "[/u]"
  "[/s]"
  "[/color]"
  "[/size]"
  "[/url]"
  "[/email]"
  "[/quote]"
  "[/code]"
  "[/list]"
  "[/box]"
  "[/spoiler]"
  "[/spoilerbox]"
  "[/center]"
  "[/heading]"
  "[/notice]"
  "[/imagemap]"
] @indent.end

; List items should be indented
(list_item) @indent.begin

; ImageMap sub-elements
(imagemap_base) @indent.begin
(imagemap_area) @indent.begin

[
  "[/base]"
  "[/area]"
] @indent.end

; Areas with link/tooltip content
(imagemap_area
  "[link]" @indent.begin
  "[/link]" @indent.end)

(imagemap_area
  "[tooltip]" @indent.begin
  "[/tooltip]" @indent.end)
