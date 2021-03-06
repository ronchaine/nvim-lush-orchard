--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()

  local not_code = hsl(200, 85, 56)
  local statement_base = hsl(150, 100, 50)
  local cursor = hsl(50, 50, 50)

  local normal = hsl(0, 10, 90)
  local selection_fg = hsl(20,50,50)

  local darkest = hsl(0, 0, 0)
  local dark_background = hsl(0, 20, 13)
  local almost_dark_background = hsl(0, 20, 20)
  local semilight_background = hsl(0, 20, 40)
  local not_so_dark = hsl(0, 20, 50)

  local shown_whitespace = hsl(0, 0, 23)

  local popup_fg = hsl(10, 10, 10)
  local popup_bg = hsl(200, 50, 30)

  local line_number = hsl(59, 100, 25)

  local rose_red = hsl(0, 100, 50)

  local typedecl = hsl(140, 100, 70)
  local integer = hsl(180, 100, 50)
  local boolean = hsl(300, 80, 55)
  local string = hsl(33, 35, 70)

  local foldline = hsl(100, 100, 10)

  local orange = hsl(39, 100, 50)
  local green = hsl(120, 100, 25)
  local yellow = hsl(60, 100, 50)
  local cyan = hsl(180, 100, 50)
  local white = hsl(0, 0, 100)
  local purple = hsl(300, 100, 25)
  local magenta = hsl(300, 100, 50)

  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Normal       { fg = normal }, -- normal text
    NormalFloat  { fg = Normal.fg.lighten(50), bg = darkest }, -- Normal text in floating windows.
    NormalNC     { fg = Normal.fg.darken(25) }, -- normal text in non-current windows
    Comment      { fg = not_code }, -- any comment
    CursorLine   { bg = almost_dark_background }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Error        { fg = darkest, bg = rose_red }, -- (preferred) any erroneous construct
    ErrorMsg     { Error }, -- error messages on the command line
    LineNr       { fg = line_number, bg = dark_background }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = line_number.lighten(50).saturate(50), bg = dark_background.darken(25) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MoreMsg      { fg = green.desaturate(50), gui="bold" }, -- |more-prompt|
    NonText      { fg = Normal.fg.darken(50) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu        { fg = popup_fg, bg = popup_bg }, -- Popup menu: normal item.
    PmenuSel     { fg = popup_fg.lighten(70).saturate(100).rotate(100), bg = popup_bg.lighten(20) }, -- Popup menu: selected item.
    PmenuSbar    { fg = popup_fg.lighten(80), bg = popup_bg.darken(25)}, -- Popup menu: scrollbar.
    PmenuThumb   { fg = popup_fg.lighten(80), bg = popup_bg.lighten(25)}, -- Popup menu: Thumb of the scrollbar.
    StatusLine   { fg = Normal.fg.lighten(10) }, -- status line of current window
    StatusLineNC { fg = Normal.fg.darken(20) }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { fg = purple }, -- tab pages line, not active tab page label
    TabLineSel   { fg = orange }, -- tab pages line, active tab page label
    TabLineFill  { Normal }, -- tab pages line, where there are no labels
    Title        { fg = magenta.lighten(60), gui="bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { fg = selection_fg, bg = almost_dark_background }, -- Visual mode selection
    VisualNOS    { fg = white.darken(50), bg = almost_dark_background }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = orange, gui="bold" }, -- warning messages
    Whitespace   { fg = shown_whitespace }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    EndOfBuffer  { fg = purple, bg = purple.darken(70) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ModeMsg      { fg = white.darken(50) }, -- 'showmode' message (e.g., "-- INSERT -- ")

    -- stuff I don't care too much about
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { fg = darkest }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { fg = darkest }, -- character under the cursor
    -- lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { Cursor }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Directory    { }, -- directory names (and other special names in listings)
    -- DiffAdd      { }, -- diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
    -- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    -- TermCursor   { fg = cursor, bg = darkest }, -- cursor in a focused terminal
    -- TermCursorNC { TermCursor }, -- cursor in an unfocused terminal
    -- VertSplit    { }, -- the column separating vertically split windows
    Folded       { fg = green, bg = foldline }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = Normal.fg, gui="bold" }, -- (preferred) any constant
    String         { fg = string }, --   a string constant: "this is a string"
    Character      { fg = string, gui="bold" }, --  a character constant: 'c', '\n'
    Number         { fg = integer, gui="bold" }, --   a number constant: 234, 0xff
    Boolean        { fg = boolean }, --  a boolean constant: TRUE, false
    Float          { fg = integer.rotate(-10).darken(10), gui="bold" }, --    a floating point constant: 2.3e10

    Identifier     { fg = Normal.fg.lighten(40) }, -- (preferred) any variable name
    Function       { fg = yellow.lighten(40), gui="italic" }, -- function name (also: methods for classes)

    Statement      { fg = statement_base.saturate(100).lighten(45).rotate(-5), gui="bold" }, -- (preferred) any statement
    Conditional    { fg = statement_base.saturate(100).darken(20).rotate(5), gui="bold" }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = statement_base, gui="bold" }, --   for, do, while, etc.
    Label          { fg = statement_base.rotate(45) }, --    case, default, etc.
    Operator       { fg = statement_base.rotate(180), gui="bold" }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = statement_base }, --  any other keyword
    Exception      { fg = statement_base.rotate(45).lighten(50) , gui="bold" }, --  try, catch, throw

    PreProc        { fg = green.desaturate(50).lighten(50), gui="bold" }, -- (preferred) generic Preprocessor
    Include        { fg = PreProc.fg, gui="bold" }, --  preprocessor #include
    Define         { fg = PreProc.fg, gui="bold,italic" }, --   preprocessor #define
    Macro          { Define }, --    same as Define
    PreCondit      { fg = PreProc.fg, gui="bold"}, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = typedecl, gui="bold" }, -- (preferred) int, long, char, etc.
    StorageClass   { Type }, -- static, register, volatile, etc.
    Structure      { Type }, --  struct, union, enum, etc.
    Typedef        { Type }, --  A typedef

    Special        { fg = orange }, -- (preferred) any special symbol
    SpecialChar    { fg = orange.lighten(50) }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    Delimiter      { Special }, --  character that needs attention
    SpecialComment { Special }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Todo           { fg = darkest, bg = statement_base }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { fg = white }, -- used for highlighting "text" references
    LspReferenceRead                     { fg = white }, -- used for highlighting "read" references
    LspReferenceWrite                    { fg = white }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError           { fg = rose_red.lighten(20) }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg = orange }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { fg = cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { fg = yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { fg = rose_red.lighten(20), gui="underline" }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { fg = orange, gui="underline" }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { fg = cyan, gui="underline" }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { fg = yellow, gui="underline" }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { fg = rose_red.lighten(20) }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { fg = orange }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { fg = cyan }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { fg = yellow }, -- Used for "Hint" signs in sign column

    -- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    -- TSPunctDelimiter     { };    -- For delimiters ie: `.`
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.

  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
