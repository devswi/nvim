local hl = {}

hl.c = {
    bg = '#323F4E',
    fg = '#cbe3e7',
    red = '#F48FB1',
    dark_red = '#F02E6E',
    green = '#A1EFD3',
    dark_green = '#62d196',
    yellow = '#ffe6b3',
    dark_yellow = '#F2B482',
    blue = '#91ddff',
    dark_blue = '#65b2ff',
    purple = '#d4bfff',
    dark_purple = '#a37acc',
    cyan = '#87DFEB',
    dark_cyan = '#63f2f1',
    white = '#E4E4E4',
    black = '#100E23',
    visual_black = 'NONE',
    comment_grey = '#8A889D',
    gutter_fg_grey = '#656A7c',
    cursor_grey = '#3B4252',
    visual_grey = '#56687E',
    menu_grey = '#56687E',
    special_grey = '#656A7c',
    vertsplit = '#181A1F',
}

hl.before = function()
    -- 256-color terminal colors
    vim.g.terminal_ansi_colors = {
        hl.c.special_grey,
        hl.c.red,
        hl.c.green,
        hl.c.yellow,
        hl.c.blue,
        hl.c.purple,
        hl.c.cyan,
        hl.c.white,
        hl.c.visual_grey,
        hl.c.dark_red,
        hl.c.dark_green,
        hl.c.dark_yellow,
        hl.c.dark_blue,
        hl.c.dark_purple,
        hl.c.dark_cyan,
        hl.c.comment_grey,
    }
end

hl.common = {
    Normal = { fg = hl.c.fg, bg = hl.c.bg },
    Conceal = { },
    Cursor = { fg = hl.c.special_grey, bg = hl.c.blue },
    CursorIM = { },
    CursorLine = { bg = hl.c.cursor_grey },
    CursorColumn = { bg = hl.c.cursor_grey },
    ColorColumn = { bg = hl.c.cursor_grey },
    Directory = { fg = hl.c.purple },
    DiffAdd = { fg = hl.c.bg, bg = hl.c.dark_green },
    DiffDelete = { fg = hl.c.bg, bg = hl.c.red  },
    DiffChange = { fg = hl.c.yellow, style = 'underline' },
    DiffText = { fg = hl.c.bg, bg = hl.c.dark_yellow, style = 'bold' },
    EndOfBuffer = { fg = hl.c.gutter_fg_grey },
    ErrorMsg = { fg = hl.c.dark_red },
    VertSplit = { fg = hl.c.vertsplit },
    Folded = { fg = hl.c.comment_grey },
    FoldColumn = { },
    SignColumn = { },
    Search = { fg = hl.c.black, bg = hl.c.dark_yellow },
    IncSearch = { fg = hl.c.yellow, bg = hl.c.comment_grey },
    LineNr = { fg = hl.c.gutter_fg_grey },
    CursorLineNr = { fg = hl.c.blue, bg = hl.c.cursor_grey, style = 'bold' },
    MatchParen = { fg = hl.c.purple, bg = hl.c.black, style = 'underline,bold' },
    ModeMsg = { fg = hl.c.white, style = 'bold' },
    MoreMsg = { fg = hl.c.white, style = 'bold' },
    NonText = { fg = hl.c.special_grey },
    Pmenu = { bg = hl.c.menu_grey },
    PmenuSel = { fg = hl.c.black, bg = hl.c.dark_blue },
    PmenuSbar = { bg = hl.c.special_grey },
    PmenuThumb = { bg = hl.c.fg },
    Question = { fg = hl.c.red },
    QuickFixLine = { fg = hl.c.blellow },
    SpecialKey = { fg = hl.c.special_grey },
    -- if vim.fn.has("gui_running") then
    SpellBad = { fg = hl.c.dark_red,   style = 'underline' },
    SpellCap = { fg = hl.c.green,      style = 'underline' },
    SpellLocal = { fg = hl.c.dark_green, style = 'underline' },
    SpellRare = { fg = hl.c.red,        style = 'underline' },
    -- end
    StatusLine = { fg = hl.c.fg, bg = hl.c.cursor_grey },
    StatusLineNC = { fg = hl.c.comment_grey },
    StatusLineTerm = { fg = hl.c.fg, bg = hl.c.cursor_grey },
    StatusLineTermNC = { fg = hl.c.comment_grey },
    TabLine = { fg = hl.c.comment_grey, bg = hl.c.black },
    TabLineFill = { },
    TabLineSel = { fg = hl.c.black, bg = hl.c.dark_blue, style = 'bold' },
    Terminal = { fg = hl.c.fg, bg = hl.c.black },
    Title = { fg = hl.c.dark_blue },
    Visual = { fg = hl.c.visual_black, bg = hl.c.visual_grey },
    VisualNOS = { bg = hl.c.visual_grey },
    WarningMsg = { fg = hl.c.yellow },
    WildMenu = { fg = hl.c.black, bg = hl.c.blue },
    FloatBorder = { fg = hl.c.comment_grey },
    Underlined = { fg = hl.c.dark_cyan, style = 'underline' },
    Ignore = { },
    Error = { fg = hl.c.dark_red, bg = hl.c.black, style = 'bold' },
    Todo = { fg = hl.c.dark_yellow, bg = hl.c.bg, style = 'bold' },
    Debug = { fg = hl.c.yellow },
    debugPC = { bg = hl.c.special_grey },
    debugBreakpoint = { fg = hl.c.black, bg = hl.c.red },
}

hl.syntax = {
    Constant = { fg = hl.c.yellow },
    String = { fg = hl.c.yellow },
    Character = { fg = hl.c.yellow },
    Number = { fg = hl.c.dark_yellow },
    Boolean = { fg = hl.c.dark_yellow },
    Float = { fg = hl.c.dark_yellow },
    Identifier = { fg = hl.c.purple },
    Function = { fg = hl.c.red },
    Keyword = { fg = hl.c.red },
    Statement = { fg = hl.c.red },
    Conditional = { fg = hl.c.red },
    Label = { fg = hl.c.dark_blue },
    Operator = { fg = hl.c.dark_cyan },
    Repeat = { fg = hl.c.dark_cyan },
    Exception = { fg = hl.c.dark_blue },
    PreProc = { fg = hl.c.green },
    Include = { fg = hl.c.green },
    Define = { fg = hl.c.green },
    Macro = { fg = hl.c.green },
    PreCondit = { fg = hl.c.green },
    Type = { fg = hl.c.blue },
    StorageClass = { fg = hl.c.blue },
    Structure = { fg = hl.c.blue },
    Typedef = { fg = hl.c.blue },
    Special = { fg = hl.c.cyan },
    SpecialChar = { fg = hl.c.cyan },
    Tag = { fg = hl.c.cyan },
    Delimiter = { fg = hl.c.cyan },
    Comment = { fg = hl.c.comment_grey, style = 'italic' },
    SpecialComment = { fg = hl.c.comment_grey },
}

-- TS highlights
hl.ts = {
    TSAnnotation = { fg = hl.c.fg },
    TSAttribute = { fg = hl.c.cyan },
    TSBoolean = { fg = hl.c.dark_yellow },
    TSCharacter = { fg = hl.c.yellow },
    TSComment = { fg = hl.c.comment_grey, style = 'italic' },
    TSConditional = { fg = hl.c.red },
    TSConstant = { fg = hl.c.yellow },
    TSConstBuiltin = { fg = hl.c.green },
    TSConstMacro = { fg = hl.c.green },
    TSConstructor = { fg = hl.c.dark_blue },
    TSError = { fg = hl.c.red },
    TSException = { fg = hl.c.purple },
    TSField = { fg = hl.c.purple },
    TSFloat = { fg = hl.c.dark_yellow },
    TSFunction = { fg = hl.c.red },
    TSFuncBuiltin = { fg = hl.c.cyan },
    TSFuncMacro = { fg = hl.c.green },
    TSInclude = { fg = hl.c.green },
    TSKeyword = { fg = hl.c.red },
    TSKeywordFunction = { fg = hl.c.red },
    TSKeywordOperator = { fg = hl.c.dark_cyan },
    TSLabel = { fg = hl.c.blue },
    TSMethod = { fg = hl.c.red },
    TSNamespace = { fg = hl.c.fg },
    TSNone = { fg = hl.c.fg },
    TSNumber = { fg = hl.c.dark_yellow },
    TSOperator = { fg = hl.c.dark_cyan },
    TSParameter = { fg = hl.c.purple },
    TSParameterReference = { fg = hl.c.purple },
    TSProperty = { fg = hl.c.purple },
    TSPunctDelimiter = { fg = hl.c.dark_cyan },
    TSPunctBracket = { fg = hl.c.cyan },
    TSPunctSpecial = { fg = hl.c.cyan },
    TSRepeat = { fg = hl.c.dark_cyan },
    TSString = { fg = hl.c.yellow },
    TSStringRegex = { fg = hl.c.cyan },
    TSStringEscape = { fg = hl.c.cyan },
    TSSymbol = { fg = hl.c.cyan },
    TSTag = { fg = hl.c.dark_red },
    TSTagDelimiter = { fg = hl.c.comment_grey },
    TSText = { fg = hl.c.fg },
    TSStrong = { fg = hl.c.fg },
    TSEmphasis = { fg = hl.c.fg },
    TSUnderline = { fg = hl.c.fg },
    TSStrike = { fg = hl.c.fg },
    TSTitle = { fg = hl.c.fg },
    TSLiteral = { fg = hl.c.green },
    TSURI = { fg = hl.c.yellow },
    TSMath = { fg = hl.c.fg },
    TSTextReference = { fg = hl.c.fg },
    TSEnviroment = { fg = hl.c.fg },
    TSEnviromentName = { fg = hl.c.fg },
    TSNote = { fg = hl.c.fg },
    TSWarning = { fg = hl.c.fg },
    TSDanger = { fg = hl.c.fg },
    TSType = { fg = hl.c.blue },
    TSTypeBuiltin = { fg = hl.c.dark_blue },
    TSVariable = { fg = hl.c.fg },
    TSVariableBuiltin = { fg = hl.c.cyan }
}

-- LSP colors
hl.lsp = {
    LspCxxHlGroupEnumConstant = { fg = hl.c.dark_yellow },
    LspCxxHlGroupMemberVariable = { fg = hl.c.dark_yellow },
    LspCxxHlGroupNamespace = { fg = hl.c.blue },
    LspCxxHlSkippedRegion = { fg = hl.c.comment_grey },
    LspCxxHlSkippedRegionBeginEnd = { fg = hl.c.red },
    LspDiagnosticsDefaultError = { fg = hl.c.red },
    LspDiagnosticsDefaultWarning = { fg = hl.c.yellow },
    LspDiagnosticsDefaultInformation = { fg = hl.c.blue },
    LspDiagnosticsDefaultHint = { fg = hl.c.purple },
    LspDiagnosticsSignError = { fg = hl.c.red },
    LspDiagnosticsSignWarning = { fg = hl.c.yellow },
    LspDiagnosticsSignInformation = { fg = hl.c.blue },
    LspDiagnosticsSignHint = { fg = hl.c.purple },
    LspDiagnosticsUnderlineError = { fg = hl.c.red, gui = 'underline', cterm = 'underline' },
    LspDiagnosticsUnderlineWarning = { fg = hl.c.yellow, gui = 'underline', cterm = 'underline' },
    LspDiagnosticsUnderlineInformation = { fg = hl.c.blue, gui = 'underline', cterm = 'underline' },
    LspDiagnosticsUnderlineHint = { fg = hl.c.purple, gui = 'underline', cterm = 'underline' },
    LspReferenceText = { fg = hl.c.fg, gui = 'underline', cterm = 'underline' },
    LspReferenceWrite = { fg = hl.c.fg, gui = 'underline', cterm = 'underline' },
    LspReferenceRead = { fg = hl.c.fg, gui = 'underline', cterm = 'underline' },
}

-- For other languages
hl.others = {
    -- CSS
    cssAttrComma = { fg = hl.c.purple },
    cssAttributeSelector = { fg = hl.c.green },
    cssBraces = { fg = hl.c.white },
    cssClassName = { fg = hl.c.dark_yellow },
    cssClassNameDot = { fg = hl.c.dark_yellow },
    cssDefinition = { fg = hl.c.purple },
    cssFontAttr = { fg = hl.c.dark_yellow },
    cssFontDescriptor = { fg = hl.c.purple },
    cssFunctionName = { fg = hl.c.blue },
    cssIdentifier = { fg = hl.c.blue },
    cssImportant = { fg = hl.c.purple },
    cssInclude = { fg = hl.c.white },
    cssIncludeKeyword = { fg = hl.c.purple },
    cssMediaType = { fg = hl.c.dark_yellow },
    cssProp = { fg = hl.c.white },
    cssPseudoClassId = { fg = hl.c.dark_yellow },
    cssSelectorOp = { fg = hl.c.purple },
    cssSelectorOp2 = { fg = hl.c.purple },
    cssTagName = { fg = hl.c.red },

    -- Go
    goDeclaration = { fg = hl.c.purple },
    goBuiltins = { fg = hl.c.cyan },
    goFunctionCall = { fg = hl.c.blue },
    goVarDefs = { fg = hl.c.red },
    goVarAssign = { fg = hl.c.red },
    goVar = { fg = hl.c.purple },
    goConst = { fg = hl.c.purple },
    goType = { fg = hl.c.yellow },
    goTypeName = { fg = hl.c.yellow },
    goDeclType = { fg = hl.c.cyan },
    goTypeDecl = { fg = hl.c.purple },

    -- HTML (keep consistent with Markdown, below)
    htmlArg = { fg = hl.c.dark_yellow },
    htmlBold = { fg = hl.c.dark_yellow, style = 'bold', cterm = 'bold' },
    htmlEndTag = { fg = hl.c.white },
    htmlH1 = { fg = hl.c.red },
    htmlH2 = { fg = hl.c.red },
    htmlH3 = { fg = hl.c.red },
    htmlH4 = { fg = hl.c.red },
    htmlH5 = { fg = hl.c.red },
    htmlH6 = { fg = hl.c.red },
    htmlItalic = { fg = hl.c.purple, style = 'italic', cterm = 'italic' },
    htmlLink = { fg = hl.c.dark_cyan, style = 'underline', cterm = 'underline' },
    htmlSpecialChar = { fg = hl.c.dark_yellow },
    htmlSpecialTagName = { fg = hl.c.red },
    htmlTag = { fg = hl.c.white },
    htmlTagN = { fg = hl.c.red },
    htmlTagName = { fg = hl.c.red },
    htmlTitle = { fg = hl.c.white },

    -- JavaScript
    javaScriptBraces = { fg = hl.c.white },
    javaScriptFunction = { fg = hl.c.purple },
    javaScriptIdentifier = { fg = hl.c.purple },
    javaScriptNull = { fg = hl.c.dark_yellow },
    javaScriptNumber = { fg = hl.c.dark_yellow },
    javaScriptRequire = { fg = hl.c.cyan },
    javaScriptReserved = { fg = hl.c.purple },
    jsArrowFunction = { fg = hl.c.purple },
    jsClassKeyword = { fg = hl.c.purple },
    jsClassMethodType = { fg = hl.c.purple },
    jsDocParam = { fg = hl.c.blue },
    jsDocTags = { fg = hl.c.purple },
    jsExport = { fg = hl.c.purple },
    jsExportDefault = { fg = hl.c.purple },
    jsExtendsKeyword = { fg = hl.c.purple },
    jsFrom = { fg = hl.c.purple },
    jsFuncCall = { fg = hl.c.blue },
    jsFunction = { fg = hl.c.purple },
    jsGenerator = { fg = hl.c.yellow },
    jsGlobalObjects = { fg = hl.c.yellow },
    jsImport = { fg = hl.c.purple },
    jsModuleAs = { fg = hl.c.purple },
    jsModuleWords = { fg = hl.c.purple },
    jsModules = { fg = hl.c.purple },
    jsNull = { fg = hl.c.dark_yellow },
    jsOperator = { fg = hl.c.purple },
    jsStorageClass = { fg = hl.c.purple },
    jsSuper = { fg = hl.c.red },
    jsTemplateBraces = { fg = hl.c.dark_red },
    jsTemplateVar = { fg = hl.c.green },
    jsThis = { fg = hl.c.red },
    jsUndefined = { fg = hl.c.dark_yellow },

    -- JSON
    jsonCommentError = { fg = hl.c.white },
    jsonKeyword = { fg = hl.c.red },
    jsonBoolean = { fg = hl.c.dark_yellow },
    jsonNumber = { fg = hl.c.dark_yellow },
    jsonQuote = { fg = hl.c.white },
    jsonMissingCommaError = { fg = hl.c.red, style = 'reverse' },
    jsonNoQuotesError = { fg = hl.c.red, style = 'reverse' },
    jsonNumError = { fg = hl.c.red, style = 'reverse' },
    jsonString = { fg = hl.c.green },
    jsonStringSQError = { fg = hl.c.red, style = 'reverse' },
    jsonSemicolonError = { fg = hl.c.red, style = 'reverse' },

    -- LESS
    lessVariable = { fg = hl.c.purple },
    lessAmpersandChar = { fg = hl.cwhite },
    lessClass = { fg = hl.c.dark_yellow },

    -- Markdown (keep consistent with HTML, above)
    markdownBlockquote = { fg = hl.c.comment_grey },
    markdownBold = { fg = hl.c.dark_yellow, style = 'bold', cterm = 'bold' },
    markdownCode = { fg = hl.c.green },
    markdownCodeBlock = { fg = hl.c.green },
    markdownCodeDelimiter = { fg = hl.c.green },
    markdownH1 = { fg = hl.c.red },
    markdownH2 = { fg = hl.c.red },
    markdownH3 = { fg = hl.c.red },
    markdownH4 = { fg = hl.c.red },
    markdownH5 = { fg = hl.c.red },
    markdownH6 = { fg = hl.c.red },
    markdownHeadingDelimiter = { fg = hl.c.red },
    markdownHeadingRule = { fg = hl.c.comment_grey },
    markdownId = { fg = hl.c.purple },
    markdownIdDeclaration = { fg = hl.c.blue },
    markdownIdDelimiter = { fg = hl.c.purple },
    markdownItalic = { fg = hl.c.purple, style = 'italic', cterm = 'italic' },
    markdownLinkDelimiter = { fg = hl.c.purple },
    markdownLinkText = { fg = hl.c.dark_blue },
    markdownListMarker = { fg = hl.c.red },
    markdownOrderedListMarker = { fg = hl.c.red },
    markdownRule = { fg = hl.c.comment_grey },
    markdownUrl = { fg = hl.c.dark_cyan, style = 'underline', cterm = 'underline' },

    -- Ruby
    rubyBlockParameter = { fg = hl.c.red },
    rubyBlockParameterList = { fg = hl.c.red },
    rubyClass = { fg = hl.c.purple },
    rubyConstant = { fg = hl.c.yellow },
    rubyControl = { fg = hl.c.purple },
    rubyEscape = { fg = hl.c.red },
    rubyFunction = { fg = hl.c.blue },
    rubyGlobalVariable = { fg = hl.c.red },
    rubyInclude = { fg = hl.c.blue },
    rubyIncluderubyGlobalVariable = { fg = hl.c.red },
    rubyInstanceVariable = { fg = hl.c.red },
    rubyInterpolation = { fg = hl.c.cyan },
    rubyInterpolationDelimiter = { fg = hl.c.red },
    rubyRegexp = { fg = hl.c.cyan },
    rubyRegexpDelimiter = { fg = hl.c.cyan },
    rubyStringDelimiter = { fg = hl.c.green },
    rubySymbol = { fg = hl.c.cyan },

    -- TypeScript
    typescriptReserved =  { fg = hl.c.purple },
    typescriptEndColons = { fg = hl.c.white },
    typescriptBraces = { fg = hl.c.white },

    -- easymotion/vim-easymotion
    EasyMotionTarget = { fg = hl.c.red, style = 'bold', cterm = 'bold' },
    EasyMotionTarget2First = { fg = hl.c.yellow, style = 'bold', cterm = 'bold' },
    EasyMotionTarget2Second = { fg = hl.c.dark_yellow, style = 'bold', cterm = 'bold' },
    EasyMotionShade = { fg = hl.c.comment_grey },

    -- mhinz/vim-signify
    SignifySignAdd = { fg = hl.c.green },
    SignifySignChange = { fg = hl.c.yellow },
    SignifySignDelete = { fg = hl.c.red },

    -- neomake/neomake
    NeomakeWarningSign = { fg = hl.c.yellow },
    NeomakeErrorSign = { fg = hl.c.red },
    NeomakeInfoSign = { fg = hl.c.blue },

    -- plasticboy/vim-markdown (keep consistent with Markdown, above)
    mkdDelimiter = { fg = hl.c.purple },
    mkdHeading = { fg = hl.c.red },
    mkdLink = { fg = hl.c.blue },
    mkdURL = { fg = hl.c.cyan, style = 'underline', cterm = 'underline' },

    -- tpope/vim-fugitive
    diffAdded = { fg = hl.c.green },
    diffRemoved = { fg = hl.c.red },
    diffFile = { fg = hl.c.white, style = 'bold', cterm = 'bold' },
    diffFileId = { fg = hl.c.blue, style = 'bold,reverse', cterm = 'bold,reverse' },
    diffNewFile = { fg = hl.c.white, style = 'bold', cterm = 'bold' },
    diffOldFile = { fg = hl.c.white, style = 'bold', cterm = 'bold' },
    diffIndexLine = { fg = hl.c.white, style = 'bold', cterm = 'bold' },
    diffLine = { fg = hl.c.purple },
    diffNoEOL = { fg = hl.c.purple },
    diffSubname = { fg = hl.c.white },

    -- Git Highlighting
    gitcommitComment = { fg = hl.c.comment_grey },
    gitcommitUnmerged = { fg = hl.c.green },
    gitcommitOnBranch = { },
    gitcommitBranch = { fg = hl.c.purple },
    gitcommitDiscardedType = { fg = hl.c.red },
    gitcommitSelectedType = { fg = hl.c.green },
    gitcommitHeader = { },
    gitcommitUntrackedFile = { fg = hl.c.cyan },
    gitcommitDiscardedFile = { fg = hl.c.red },
    gitcommitSelectedFile = { fg = hl.c.green },
    gitcommitUnmergedFile = { fg = hl.c.yellow },
    gitcommitFile = { },
    gitcommitSummary = { fg = hl.c.white },
    gitcommitOverflow = { fg = hl.c.red },

    -- Nvim-tree support
    NvimTreeFolderIcon = { fg = hl.c.purple },
    NvimTreeFolderName = { fg = hl.c.blue },
    NvimTreeRootFolder = { fg = hl.c.green },
}

hl.after = function()
    -- airblade/vim-gitgutter
    vim.cmd('hi link GitGutterAdd    SignifySignAdd')
    vim.cmd('hi link GitGutterChange SignifySignChange')
    vim.cmd('hi link GitGutterDelete SignifySignDelete')

    vim.cmd('hi link gitcommitNoBranch gitcommitBranch')
    vim.cmd('hi link gitcommitUntracked gitcommitComment')
    vim.cmd('hi link gitcommitDiscarded gitcommitComment')
    vim.cmd('hi link gitcommitSelected gitcommitComment')
    vim.cmd('hi link gitcommitDiscardedArrow gitcommitDiscardedFile')
    vim.cmd('hi link gitcommitSelectedArrow gitcommitSelectedFile')
    vim.cmd('hi link gitcommitUnmergedArrow gitcommitUnmergedFile')

    -- Neovim terminal colors
    vim.g.terminal_color_0  = hl.c.black
    vim.g.terminal_color_1  = hl.c.red
    vim.g.terminal_color_2  = hl.c.green
    vim.g.terminal_color_3  = hl.c.yellow
    vim.g.terminal_color_4  = hl.c.blue
    vim.g.terminal_color_5  = hl.c.purple
    vim.g.terminal_color_6  = hl.c.cyan
    vim.g.terminal_color_7  = hl.c.white
    vim.g.terminal_color_8  = hl.c.visual_grey
    vim.g.terminal_color_9  = hl.c.dark_red
    vim.g.terminal_color_10 = hl.c.dark_green
    vim.g.terminal_color_11 = hl.c.dark_yellow
    vim.g.terminal_color_12 = hl.c.dark_blue
    vim.g.terminal_color_13 = hl.c.dark_purple
    vim.g.terminal_color_14 = hl.c.dark_cyan
    vim.g.terminal_color_15 = hl.c.comment_grey
    vim.g.terminal_color_background = vim.g.terminal_color_0
    vim.g.terminal_color_foreground = vim.g.terminal_color_7

end

return hl