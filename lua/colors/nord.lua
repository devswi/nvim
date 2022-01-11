local hl = {}

hl.c = {
    nord0 = '#2E3440',
    nord1 = '#3B4252',
    nord2 = '#434C5E',
    nord3 = '#4C566A',
    nord3_bright = '#616E88',
    nord4 = '#D8DEE9',
    nord5 = '#E5E9F0',
    nord6 = '#ECEFF4',
    nord7 = '#8FBCBB',
    nord8 = '#88C0D0',
    nord9 = '#81A1C1',
    nord10 = '#5E81AC',
    nord11 = '#BF616A',
    nord12 = '#D08770',
    nord13 = '#EBCB8B',
    nord14 = '#A3BE8C',
    nord15 = '#B48EAD',
    none = 'NONE',
    sidebar = '#2E3440',
    float = '#2E3440',
    cursorlinefg = '#3B4252',
}

hl.common = {
    NormalFloat =      { fg = hl.c.nord4, bg = hl.c.float }, -- normal text and background color
    FloatBorder =      { fg = hl.c.nord4, bg = hl.c.float }, -- normal text and background color
    ColorColumn =      { fg = hl.c.none, bg = hl.c.nord1 }, --  used for the columns set with 'colorcolumn'
    Conceal =          { fg = hl.c.nord1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor =           { fg = hl.c.nord4, bg = hl.c.none, style = 'reverse' }, -- the character under the cursor
    CursorIM =         { fg = hl.c.nord5, bg = hl.c.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
    Directory =        { fg = hl.c.nord7, bg = hl.c.none }, -- directory names (and other special names in listings)
    DiffAdd =          { fg = hl.c.nord14, bg = hl.c.none, style = 'reverse' }, -- diff mode: Added line
    DiffChange =       { fg = hl.c.nord13, bg = hl.c.none, style = 'reverse' }, --  diff mode: Changed line
    DiffDelete =       { fg = hl.c.nord11, bg = hl.c.none, style = 'reverse' }, -- diff mode: Deleted line
    DiffText =         { fg = hl.c.nord15, bg = hl.c.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
    EndOfBuffer =      { fg = hl.c.nord1 },
    ErrorMsg =         { fg = hl.c.none },
    Folded =           { fg = hl.c.nord3_bright, bg = hl.c.none, style = 'italic' },
    FoldColumn =       { fg = hl.c.nord7 },
    IncSearch =        { fg = hl.c.nord6, bg = hl.c.nord10 },
    LineNr =           { fg = hl.c.nord3_bright },
    CursorLineNr =     { fg = hl.c.nord4 },
    MatchParen =       { fg = hl.c.nord15, bg = hl.c.none, style = 'bold' },
    ModeMsg =          { fg = hl.c.nord4 },
    MoreMsg =          { fg = hl.c.nord4 },
    NonText =          { fg = hl.c.nord1 },
    Pmenu =            { fg = hl.c.nord4, bg = hl.c.nord2 },
    PmenuSel =         { fg = hl.c.nord4, bg = hl.c.nord10 },
    PmenuSbar =        { fg = hl.c.nord4, bg = hl.c.nord2 },
    PmenuThumb =       { fg = hl.c.nord4, bg = hl.c.nord4 },
    Question =         { fg = hl.c.nord14 },
    QuickFixLine =     { fg = hl.c.nord4, bg = hl.c.none, style = 'reverse' },
    qfLineNr =         { fg = hl.c.nord4, bg = hl.c.none, style = 'reverse' },
    Search =           { fg = hl.c.nord10, bg = hl.c.nord6, style = 'reverse' },
    SignColumn =       { fg = hl.c.nord4, bg = hl.c.nord0 },
    SpecialKey =       { fg = hl.c.nord9 },
    SpellBad =         { fg = hl.c.nord11, bg = hl.c.none, style = 'italic,undercurl' },
    SpellCap =         { fg = hl.c.nord7, bg = hl.c.none, style = 'italic,undercurl' },
    SpellLocal =       { fg = hl.c.nord8, bg = hl.c.none, style = 'italic,undercurl' },
    SpellRare =        { fg = hl.c.nord9, bg = hl.c.none, style = 'italic,undercurl' },
    StatusLine =       { fg = hl.c.nord4, bg = hl.c.nord2 },
    StatusLineNC =     { fg = hl.c.nord4, bg = hl.c.nord1 },
    StatusLineTerm =   { fg = hl.c.nord4, bg = hl.c.nord2 },
    StatusLineTermNC = { fg = hl.c.nord4, bg = hl.c.nord1 },
    TabLineFill =      { fg = hl.c.nord4, bg = hl.c.none },
    TablineSel =       { fg = hl.c.nord1, bg = hl.c.nord9 },
    Tabline =          { fg = hl.c.nord4, bg = hl.c.nord1 },
    Title =            { fg = hl.c.nord14, bg = hl.c.none, style = 'bold' },
    Visual =           { fg = hl.c.none, bg = hl.c.nord2 },
    VisualNOS = { fg = hl.c.none, bg = hl.c.nord2 },
    VertSplit = { fg = hl.c.nord0 },
    WarningMsg = { fg = hl.c.nord15 },
    WildMenu = { fg = hl.c.nord12, bg = hl.c.none, style = 'bold' },
    CursorColumn = { fg = hl.c.none, bg = hl.c.cursorlinefg },
    CursorLine = { fg = hl.c.none, bg = hl.c.cursorlinefg },
    ToolbarLine = { fg = hl.c.nord4, bg = hl.c.nord1 },
    ToolbarButton = { fg = hl.c.nord4, bg = hl.c.none, style = 'bold' },
    Normal = { fg = hl.c.nord4, bg = hl.c.nord0 },
    NormalMode ={ fg = hl.c.nord4, bg = hl.c.none, style = 'reverse' },
    InsertMode = { fg = hl.c.nord14, bg = hl.c.none, style = 'reverse' },
    ReplacelMode = { fg = hl.c.nord11, bg = hl.c.none, style = 'reverse' },
    VisualMode = { fg = hl.c.nord9, bg = hl.c.none, style = 'reverse' },
    CommandMode = { fg = hl.c.nord4, bg = hl.c.none, style = 'reverse' },
    Warnings = { fg = hl.c.nord15 },

    healthError = { fg = hl.c.nord11 },
    healthSuccess = { fg = hl.c.nord14 },
    healthWarning = { fg = hl.c.nord15 },

    -- dashboard
    DashboardShortCut = { fg = hl.c.nord7 },
    DashboardHeader = { fg = hl.c.nord9 },
    DashboardCenter = { fg = hl.c.nord8 },
    DashboardFooter = { fg = hl.c.nord14, style = "italic" },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = hl.c.nord0 },
    BufferLineFill = { bg = hl.c.nord0 },
}

hl.syntax = {
    Type = { fg = hl.c.nord9 }, -- int, long, char, etc.
    StorageClass = { fg = hl.c.nord9 }, -- static, register, volatile, etc.
    Structure = { fg = hl.c.nord9 }, -- struct, union, enum, etc.
    Constant = { fg = hl.c.nord4 }, -- any constant
    Character = { fg = hl.c.nord14 }, -- any character constant: 'c', '\n'
    Number = { fg = hl.c.nord15 }, -- a number constant: 5
    Boolean = { fg = hl.c.nord9 }, -- a boolean constant: TRUE, false
    Float = { fg = hl.c.nord15 }, -- a floating point constant: 2.3e10
    Statement = { fg = hl.c.nord9 }, -- any statement
    Label = { fg = hl.c.nord9 }, -- case, default, etc.
    Operator = { fg = hl.c.nord9 }, -- sizeof", "+", "*", etc.
    Exception = { fg = hl.c.nord9 }, -- try, catch, throw
    PreProc = { fg = hl.c.nord9 }, -- generic Preprocessor
    Include = { fg = hl.c.nord9 }, -- preprocessor #include
    Define = { fg = hl.c.nord9 }, -- preprocessor #define
    Macro = { fg = hl.c.nord9 }, -- same as Define
    Typedef = { fg = hl.c.nord9 }, -- A typedef
    PreCondit = { fg = hl.c.nord13 }, -- preprocessor #if, #else, #endif, etc.
    Special = { fg = hl.c.nord4 }, -- any special symbol
    SpecialChar = { fg = hl.c.nord13 }, -- special character in a constant
    Tag = { fg = hl.c.nord4 }, -- you can use CTRL-] on this
    Delimiter = { fg = hl.c.nord6 }, -- character that needs attention like , or .
    SpecialComment = { fg = hl.c.nord8 }, -- special things inside a comment
    Debug = { fg = hl.c.nord11 }, -- debugging statements
    Underlined = { fg = hl.c.nord14, bg = hl.c.none, style = 'underline' }, -- text that stands out, HTML links
    Ignore = { fg = hl.c.nord1 }, -- left blank, hidden
    Error = { fg = hl.c.nord11, bg = hl.c.none, style = 'bold,underline' }, -- any erroneous construct
    Todo = { fg = hl.c.nord13, bg = hl.c.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Conceal =        { fg = hl.c.none, bg = hl.c.nord0 },

    htmlLink = { fg = hl.c.nord14, style = "underline" },
    htmlH1 = { fg = hl.c.nord8, style = "bold" },
    htmlH2 = { fg = hl.c.nord11, style = "bold" },
    htmlH3 = { fg = hl.c.nord14, style = "bold" },
    htmlH4 = { fg = hl.c.nord15, style = "bold" },
    htmlH5 = { fg = hl.c.nord9, style = "bold" },
    markdownH1 = { fg = hl.c.nord8, style = "bold" },
    markdownH2 = { fg = hl.c.nord11, style = "bold" },
    markdownH3 = { fg = hl.c.nord14, style = "bold" },
    markdownH1Delimiter = { fg = hl.c.nord8 },
    markdownH2Delimiter = { fg = hl.c.nord11 },
    markdownH3Delimiter = { fg = hl.c.nord14 },

    Conditional = { fg = hl.c.nord9, bg = hl.c.none, style = 'italic' }, -- italic if, then, else, endif, switch, etc.
    Keyword = { fg = hl.c.nord9, bg = hl.c.none, style = 'italic' }, -- italic for, do, while, etc.
    Repeat  = { fg = hl.c.nord9, bg = hl.c.none, style = 'italic' }, -- italic any other keyword
    Comment = { fg = hl.c.nord3_bright, bg = hl.c.none, style = 'italic' }, -- italic comments
    Function = { fg = hl.c.nord8, bg = hl.c.none, style = 'italic' }, -- italic funtion names
    Identifier = { fg = hl.c.nord9, bg = hl.c.none, style = 'italic' }, -- any variable name
    String = { fg = hl.c.nord14, bg = hl.c.none, style= 'italic' }, -- any string
}

-- TS highlights
hl.ts = {
    TSAnnotation =        { fg = hl.c.nord12 },    -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
    TSCharacter=          { fg = hl.c.nord14 },    -- For characters.
    TSConstructor =       { fg = hl.c.nord9 }, -- For constructor calls and definitions: `=                                                                          { }` in Lua, and Java constructors.
    TSConstant =          { fg = hl.c.nord13 },    -- For constants
    TSFloat =             { fg = hl.c.nord15 },    -- For floats
    TSNumber =            { fg = hl.c.nord15 },    -- For all number
    TSString =            { fg = hl.c.nord14 },    -- For strings.

    TSAttribute =         { fg = hl.c.nord15 },    -- (unstable) TODO: docs
    TSBoolean=            { fg = hl.c.nord9 },    -- For booleans.
    TSConstBuiltin =      { fg = hl.c.nord7 },    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro =        { fg = hl.c.nord7 },    -- For constants that are defined by macros: `NULL` in C.
    TSError =             { fg = hl.c.nord11 },    -- For syntax/parser errors.
    TSException =         { fg = hl.c.nord15 },    -- For exception related keywords.
    TSField =             { fg = hl.c.nord4 }, -- For fields.
    TSFuncMacro =         { fg = hl.c.nord7 },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude =           { fg = hl.c.nord9 },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel =             { fg = hl.c.nord15 }, -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace =         { fg = hl.c.nord4},    -- For identifiers referring to modules and namespaces.
    TSOperator =          { fg = hl.c.nord9 }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter =         { fg = hl.c.nord10 }, -- For parameters of a function.
    TSParameterReference= { fg = hl.c.nord10 },    -- For references to parameters of a function.
    TSProperty =          { fg = hl.c.nord10 }, -- Same as `TSField`.
    TSPunctDelimiter =    { fg = hl.c.nord8 }, -- For delimiters ie: `.`
    TSPunctBracket =      { fg = hl.c.nord8 }, -- For brackets and parens.
    TSPunctSpecial =      { fg = hl.c.nord8 }, -- For special punctutation that does not fall in the catagories before.
    TSStringRegex =       { fg = hl.c.nord7 }, -- For regexes.
    TSStringEscape =      { fg = hl.c.nord15 }, -- For escape characters within a string.
    TSSymbol =            { fg = hl.c.nord15 },    -- For identifiers referring to symbols or atoms.
    TSType =              { fg = hl.c.nord9 },    -- For types.
    TSTypeBuiltin =       { fg = hl.c.nord9 },    -- For builtin types.
    TSTag =               { fg = hl.c.nord4 },    -- Tags like html tag names.
    TSTagDelimiter =      { fg = hl.c.nord15 },    -- Tag delimiter like `<` `>` `/`
    TSText =              { fg = hl.c.nord4 },    -- For strings considenord11 text in a markup language.
    TSTextReference =     { fg = hl.c.nord15 }, -- FIXME
    TSEmphasis =          { fg = hl.c.nord10 },    -- For text to be represented with emphasis.
    TSUnderline =         { fg = hl.c.nord4, bg = hl.c.none, style = 'underline' },    -- For text to be represented with an underline.
    TSTitle =             { fg = hl.c.nord10, bg = hl.c.none, style = 'bold' },    -- Text that is part of a title.
    TSLiteral =           { fg = hl.c.nord4 },    -- Literal text.
    TSURI =               { fg = hl.c.nord14 },    -- Any URI like a link or email.        TSAnnotation =
    TSComment=          { fg = hl.c.nord3_bright },
    TSConditional =     { fg = hl.c.nord9 },
    TSKeyword =         { fg = hl.c.nord9 }, -- For keywords that don't fall in previous categories.
    TSRepeat =          { fg = hl.c.nord9 },    -- For keywords related to loops.
    TSKeywordFunction = { fg = hl.c.nord8 },
    TSFunction =        { fg = hl.c.nord8 },    -- For fuction (calls and definitions).
    TSMethod =          { fg = hl.c.nord7 },    -- For method calls and definitions.
    TSFuncBuiltin =     { fg = hl.c.nord8 },
    TSVariable =        { fg = hl.c.nord4 }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = hl.c.nord4 },
}

local time
-- LSP colors
hl.lsp = {
    LspDiagnosticsDefaultError =           { fg = hl.c.nord11 }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError =              { fg = hl.c.nord11 }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError =          { fg = hl.c.nord11 }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError =       { fg = hl.c.nord11 }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError =         { style = 'undercurl', sp = hl.c.nord11 }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning =         { fg = hl.c.nord15 }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning =            { fg = hl.c.nord15 }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning =        { fg = hl.c.nord15 }, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning =     { fg = hl.c.nord15 }, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning =       { style = 'undercurl', sp = hl.c.nord15 }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation =     { fg = hl.c.nord10 }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation =        { fg = hl.c.nord10 },  -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation =    { fg = hl.c.nord10 }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = hl.c.nord10 }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation =   { style = 'undercurl', sp = hl.c.nord10 }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint =            { fg = hl.c.nord9 },  -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint =               { fg = hl.c.nord9 }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint =           { fg = hl.c.nord9 }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint =        { fg = hl.c.nord9 }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint =          { style = 'undercurl', sp = hl.c.nord10 }, -- used to underline "Hint" diagnostics.
    LspReferenceText =                     { fg = hl.c.nord4, bg = hl.c.nord1 }, -- used for highlighting "text" references
    LspReferenceRead =                     { fg = hl.c.nord4, bg = hl.c.nord1 }, -- used for highlighting "read" references
    LspReferenceWrite =                    { fg = hl.c.nord4, bg = hl.c.nord1 }, -- used for highlighting "write" references

    DiagnosticError            = { link = "LspDiagnosticsDefaultError" },
    DiagnosticWarn             = { link = "LspDiagnosticsDefaultWarning" },
    DiagnosticInfo             = { link = "LspDiagnosticsDefaultInformation" },
    DiagnosticHint             = { link = "LspDiagnosticsDefaultHint" },
    DiagnosticVirtualTextWarn  = { link = "LspDiagnosticsVirtualTextWarning" },
    DiagnosticUnderlineWarn    = { link = "LspDiagnosticsUnderlineWarning" },
    DiagnosticFloatingWarn     = { link = "LspDiagnosticsFloatingWarning" },
    DiagnosticSignWarn         = { link = "LspDiagnosticsSignWarning" },
    DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
    DiagnosticUnderlineError   = { link = "LspDiagnosticsUnderlineError" },
    DiagnosticFloatingError    = { link = "LspDiagnosticsFloatingError" },
    DiagnosticSignError        = { link = "LspDiagnosticsSignError" },
    DiagnosticVirtualTextInfo  = { link = "LspDiagnosticsVirtualTextInformation" },
    DiagnosticUnderlineInfo    = { link = "LspDiagnosticsUnderlineInformation" },
    DiagnosticFloatingInfo     = { link = "LspDiagnosticsFloatingInformation" },
    DiagnosticSignInfo         = { link = "LspDiagnosticsSignInformation" },
    DiagnosticVirtualTextHint  = { link = "LspDiagnosticsVirtualTextHint" },
    DiagnosticUnderlineHint    = { link = "LspDiagnosticsUnderlineHint" },
    DiagnosticFloatingHint     = { link = "LspDiagnosticsFloatingHint" },
    DiagnosticSignHint         = { link = "LspDiagnosticsSignHint" },
}

hl.others = {

}

hl.after = function()
    vim.g.terminal_color_0 = hl.c.nord1
    vim.g.terminal_color_1 = hl.c.nord11
    vim.g.terminal_color_2 = hl.c.nord14
    vim.g.terminal_color_3 = hl.c.nord13
    vim.g.terminal_color_4 = hl.c.nord9
    vim.g.terminal_color_5 = hl.c.nord15
    vim.g.terminal_color_6 = hl.c.nord8
    vim.g.terminal_color_7 = hl.c.nord5
    vim.g.terminal_color_8 = hl.c.nord3
    vim.g.terminal_color_9 = hl.c.nord11
    vim.g.terminal_color_10 = hl.c.nord14
    vim.g.terminal_color_11 = hl.c.nord13
    vim.g.terminal_color_12 = hl.c.nord9
    vim.g.terminal_color_13 = hl.c.nord15
    vim.g.terminal_color_14 = hl.c.nord7
    vim.g.terminal_color_15 = hl.c.nord6
end

return hl
