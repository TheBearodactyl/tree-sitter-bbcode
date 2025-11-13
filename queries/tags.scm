; Tag matching for editor features like bracket matching
(bold
  "[b]" @opening
  "[/b]" @closing) @container

(italic
  "[i]" @opening
  "[/i]" @closing) @container

(underline
  "[u]" @opening
  "[/u]" @closing) @container

(strikethrough
  "[s]" @opening
  "[/s]" @closing) @container

(color
  "[color=" @opening
  "[/color]" @closing) @container

(size
  "[size=" @opening
  "[/size]" @closing) @container

(url
  "[url" @opening
  "[/url]" @closing) @container

(quote
  "[quote" @opening
  "[/quote]" @closing) @container

(code
  "[code]" @opening
  "[/code]" @closing) @container

(list
  "[list" @opening
  "[/list]" @closing) @container

(box
  "[box=" @opening
  "[/box]" @closing) @container

(spoiler
  "[spoiler]" @opening
  "[/spoiler]" @closing) @container

(spoilerbox
  "[spoilerbox]" @opening
  "[/spoilerbox]" @closing) @container

(center
  "[center]" @opening
  "[/center]" @closing) @container

(heading
  "[heading]" @opening
  "[/heading]" @closing) @container

(notice
  "[notice]" @opening
  "[/notice]" @closing) @container

(imagemap
  "[imagemap]" @opening
  "[/imagemap]" @closing) @container
