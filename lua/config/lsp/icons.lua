-- LSP icons
local icons = {
    -- Text           = ' (text)',
    Text           = ' (Text) ',
    Method         = ' (Method)',
    Function       = '(Function)',
    -- Constructor   = ' (ctor)',
    Constructor    = '  (Constructor)',
    Field          = ' ﴲ (Field)',
    Variable       = '[](Variable)',
    -- Class          = ' (class)',
    -- Class          = ' (class)',
    Class = '   (Class)',
    -- Interface      = ' (interface)',
    Interface      = ' ﰮ (Interface)',
    Module         = ' (Module)',
    Property       = '(Property)',
    -- Unit           = ' (unit)',
    -- Unit           = ' (unit)',
    -- Unit           = ' (unit)',
    Unit           = ' (Unit)',
    Value          = ' (Value)',
    -- Enum           = '練(enum)',
    -- ﬧ
    Enum           = 'ﬧ (Enum)',
    -- 
    -- 
    EnumMember     = ' (EnumMember)',
    -- Keyword        = ' (keyword)',
    Keyword        = ' (Keyword)',
    -- Snippet        = ' (snippet)',
    Snippet        = '﬌(Snippet)',
    -- Color          =  (color)',
    Color          = ' (Color)',
    File           = ' (File)',
    Folder         = ' (Folder)',
    -- Reference      = ' (ref)',
    Reference      = ' (Reference)',
    -- Constant       = ' (const)',
    -- Constant       = ' (const)',
    -- Constant       = '(const)',
    Constant       = '洞(Const)',
    -- Constant       = 'ﱃ (const)',
    Struct         = ' (Struct)',
    Event          = '(Event)',
    Operator       = '璉(Operator)',
    TypeParameter = '(TypeParameter)',
    -- TypeParameter  = ' (TypeParam)',
}

for kind, symbol in pairs(icons) do
    local kinds = vim.lsp.protocol.CompletionItemKind
    local index = kinds[kind]

    if index ~= nil then
        kinds[index] = symbol
    end
end
