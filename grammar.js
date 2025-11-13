/**
 * @file osu!treesitter
 * @author The Motherfucking Bearodactyl <gannonkoenig@gmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "osu_bbcode",

  extras: ($) => [],

  rules: {
    document: ($) => repeat($._content),

    _content: ($) =>
      choice(
        $.bold,
        $.italic,
        $.underline,
        $.strikethrough,
        $.color,
        $.size,
        $.url,
        $.email,
        $.img,
        $.quote,
        $.code,
        $.list,
        $.box,
        $.spoiler,
        $.spoilerbox,
        $.center,
        $.heading,
        $.notice,
        $.imagemap,
        $.youtube,
        $.audio,
        $.profile,
        $.text,
        $.lone_bracket,
      ),

    // Basic formatting tags
    bold: ($) => seq("[b]", repeat($._content), "[/b]"),

    italic: ($) => seq("[i]", repeat($._content), "[/i]"),

    underline: ($) => seq("[u]", repeat($._content), "[/u]"),

    strikethrough: ($) => seq("[s]", repeat($._content), "[/s]"),

    // Color tag
    color: ($) =>
      seq(
        "[color=",
        field("color_value", choice($.color_name, $.hex_color)),
        "]",
        repeat($._content),
        "[/color]",
      ),

    color_name: ($) => /[a-zA-Z]+/,
    hex_color: ($) => /#[0-9a-fA-F]{6}/,

    // Size tag - only supports 50, 85, 100, 150
    size: ($) =>
      seq(
        "[size=",
        field("size_value", choice("50", "85", "100", "150")),
        "]",
        repeat($._content),
        "[/size]",
      ),

    // URL tag
    url: ($) =>
      choice(
        seq("[url]", $.url_content, "[/url]"),
        seq("[url=", $.url_content, "]", repeat($._content), "[/url]"),
      ),

    url_content: ($) => /[^\]]+/,

    // Email tag
    email: ($) =>
      choice(
        seq("[email]", $.email_address, "[/email]"),
        seq("[email=", $.email_address, "]", repeat($._content), "[/email]"),
      ),

    email_address: ($) => /[^\]]+/,

    // Image tag
    img: ($) => seq("[img]", $.url_content, "[/img]"),

    // Quote tag
    quote: ($) =>
      choice(
        seq("[quote]", repeat($._content), "[/quote]"),
        seq(
          '[quote="',
          field("author", $.quote_author),
          '"]',
          repeat($._content),
          "[/quote]",
        ),
      ),

    quote_author: ($) => /[^"]+/,

    // Code tag
    code: ($) =>
      seq("[code]", field("code_content", $.code_content), "[/code]"),

    code_content: ($) => repeat1(choice(/[^\[]+/, $.lone_bracket)),

    // List tags
    list: ($) =>
      choice(
        seq("[list]", repeat($.list_item), "[/list]"),
        seq("[list=", $.list_type, "]", repeat($.list_item), "[/list]"),
      ),

    list_type: ($) => /[^\]]+/,

    list_item: ($) => seq("[*]", repeat($._content)),

    // Box tag
    box: ($) =>
      seq(
        "[box=",
        field("box_title", $.box_title),
        "]",
        repeat($._content),
        "[/box]",
      ),

    box_title: ($) => /[^\]]+/,

    // Spoiler tag (inline)
    spoiler: ($) => seq("[spoiler]", repeat($._content), "[/spoiler]"),

    // Spoilerbox tag (block)
    spoilerbox: ($) => seq("[spoilerbox]", repeat($._content), "[/spoilerbox]"),

    // Center alignment
    center: ($) => seq("[center]", repeat($._content), "[/center]"),

    // Heading tag
    heading: ($) => seq("[heading]", repeat($._content), "[/heading]"),

    // Notice tag
    notice: ($) => seq("[notice]", repeat($._content), "[/notice]"),

    // ImageMap tag (advanced feature)
    imagemap: ($) =>
      seq("[imagemap]", repeat($._imagemap_content), "[/imagemap]"),

    _imagemap_content: ($) =>
      choice($.imagemap_base, $.imagemap_area, $.text, $.lone_bracket),

    imagemap_base: ($) => seq("[base]", $.url_content, "[/base]"),

    imagemap_area: ($) =>
      seq(
        "[area=",
        $.area_coords,
        "]",
        optional(seq("[link]", $.url_content, "[/link]")),
        optional(seq("[tooltip]", repeat($._content), "[/tooltip]")),
        "[/area]",
      ),

    area_coords: ($) => /[^\]]+/,

    // YouTube embed
    youtube: ($) => seq("[youtube]", $.youtube_id, "[/youtube]"),

    youtube_id: ($) => /[0-9a-zA-Z_\-]+/,

    // Audio tag
    audio: ($) => seq("[audio]", $.url_content, "[/audio]"),

    // Profile tag
    profile: ($) => seq("[profile]", $.user_id, "[/profile]"),

    user_id: ($) => /[0-9]+/,

    // Plain text (everything except opening bracket)
    text: ($) => /[^\[]+/,

    // A lone bracket that doesn't start a tag
    lone_bracket: ($) => "[",
  },
});
