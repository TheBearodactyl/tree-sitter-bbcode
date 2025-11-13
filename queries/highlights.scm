; Tags
[
  "[b]" "[/b]"
  "[i]" "[/i]"
  "[u]" "[/u]"
  "[s]" "[/s]"
  "[center]" "[/center]"
  "[heading]" "[/heading]"
  "[notice]" "[/notice]"
  "[spoiler]" "[/spoiler]"
  "[spoilerbox]" "[/spoilerbox]"
  "[code]" "[/code]"
  "[quote]" "[/quote]"
  "[list]" "[/list]"
  "[*]"
  "[img]" "[/img]"
  "[url]" "[/url]"
  "[email]" "[/email]"
  "[youtube]" "[/youtube]"
  "[audio]" "[/audio]"
  "[profile]" "[/profile]"
  "[imagemap]" "[/imagemap]"
  "[base]" "[/base]"
  "[area]" "[/area]"
  "[link]" "[/link]"
  "[tooltip]" "[/tooltip]"
] @tag

; Tag delimiters with attributes
[
  "[color="
  "[size="
  "[box="
  "[url="
  "[email="
  "[quote=\""
  "[list="
  "[area="
] @tag

(color "[/color]" @tag)
(size "[/size]" @tag)
(box "[/box]" @tag)
(imagemap_area "[/area]" @tag)

; Closing brackets and quotes for attributes
[
  "]"
  "\"]"
] @tag

; Bold content
(bold (text) @markup.strong)

; Italic content
(italic (text) @markup.italic)

; Underline content
(underline (text) @markup.underline)

; Strikethrough content
(strikethrough (text) @markup.strikethrough)

; Heading content
(heading) @markup.heading

; Color values
(color_name) @constant
(hex_color) @constant

; Size values
(size (size_value) @number)

; URLs and links
(url_content) @markup.link.url
(email_address) @markup.link.url

; Quote author
(quote_author) @string.special

; Box title
(box_title) @string.special

; Code blocks
(code) @markup.raw.block
(code_content) @markup.raw.block

; Quote blocks
(quote) @markup.quote

; Notice blocks
(notice) @comment.note

; List type
(list_type) @constant

; YouTube video ID
(youtube_id) @string.special

; User ID
(user_id) @number

; Area coordinates
(area_coords) @string.special

; Plain text
(text) @text

; Spoilers
(spoiler) @comment
(spoilerbox) @comment
