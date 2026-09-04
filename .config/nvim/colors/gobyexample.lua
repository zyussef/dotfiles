-- Go by Example Dark -- a standalone Neovim colorscheme.
-- Palette adapted from Go by Example's templates/site.css (dark mode).
-- Original work: Mark McGranaghan, https://gobyexample.com/
-- Attribution and license: https://creativecommons.org/licenses/by/3.0/
-- Adaptations: Neovim syntax, Tree-sitter, LSP, UI, and terminal highlights.
-- Install in stdpath("config") .. "/colors/gobyexample.lua".
-- Activate with :colorscheme gobyexample. Requires Neovim 0.9+ and true color.

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "gobyexample"

local c = {
  -- Exact website colors.
  bg = "#282828",          -- Code block background.
  panel = "#1f1f1f",       -- Page background.
  fg = "#dadada",          -- Ordinary code, identifiers, and punctuation.
  keyword = "#af5a54",
  builtin_type = "#b64343",
  number = "#688ec8",
  string = "#718e72",
  comment = "#868686",
  muted = "#898e98",       -- Footer text.
  bright = "#e4e4e4",      -- Links.
  purple = "#8a6ab1",      -- Shell prompt.
  -- Editor-only extensions: selection, separators, diagnostics, and diff.
  line = "#303030",
  selection = "#414141",
  border = "#505050",
  subtle = "#606060",
  warning = "#b59a6b",
  error = "#cf7770",
  add_bg = "#303b31",
  change_bg = "#30394a",
  delete_bg = "#442e2e",
  warn_bg = "#3d382c",
}

local groups = {
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.panel },
  FloatBorder = { fg = c.border, bg = c.panel },
  FloatTitle = { fg = c.bright, bg = c.panel, bold = true },
  FloatFooter = { fg = c.muted, bg = c.panel },
  ColorColumn = { bg = c.line },
  CursorLine = { bg = c.line },
  CursorColumn = { bg = c.line },
  Cursor = { fg = c.bg, bg = c.fg },
  TermCursor = { reverse = true },
  TermCursorNC = { fg = c.bg, bg = c.comment },
  LineNr = { fg = c.subtle },
  CursorLineNr = { fg = c.bright, bold = true },
  SignColumn = { bg = c.bg },
  FoldColumn = { fg = c.comment, bg = c.bg },
  Folded = { fg = c.comment, bg = c.line },
  WinSeparator = { fg = c.border },
  EndOfBuffer = { fg = c.border },
  NonText = { fg = c.subtle },
  Whitespace = { fg = c.border },
  SpecialKey = { fg = c.subtle },
  Conceal = { fg = c.comment },
  Visual = { bg = c.selection },
  Search = { fg = c.fg, bg = c.change_bg },
  IncSearch = { fg = c.panel, bg = c.number },
  CurSearch = { fg = c.panel, bg = c.number, bold = true },
  Substitute = { fg = c.panel, bg = c.string },
  MatchParen = { bg = c.selection, bold = true },
  StatusLine = { fg = c.fg, bg = c.panel },
  StatusLineNC = { fg = c.comment, bg = c.panel },
  WinBar = { fg = c.fg, bg = c.bg },
  WinBarNC = { fg = c.comment, bg = c.bg },
  TabLine = { fg = c.comment, bg = c.panel },
  TabLineFill = { bg = c.panel },
  TabLineSel = { fg = c.bright, bg = c.bg, bold = true },
  Pmenu = { fg = c.fg, bg = c.panel },
  PmenuSel = { fg = c.bright, bg = c.selection },
  PmenuSbar = { bg = c.line },
  PmenuThumb = { bg = c.subtle },
  PmenuMatch = { fg = c.number, bold = true },
  PmenuMatchSel = { fg = c.number, bg = c.selection, bold = true },
  WildMenu = { fg = c.bright, bg = c.selection },
  Title = { fg = c.bright, bold = true },
  Directory = { fg = c.number },
  MoreMsg = { fg = c.string },
  ModeMsg = { fg = c.fg },
  Question = { fg = c.string },
  ErrorMsg = { fg = c.error },
  WarningMsg = { fg = c.warning },
  MsgArea = { fg = c.fg, bg = c.bg },
  MsgSeparator = { fg = c.border, bg = c.panel },
  QuickFixLine = { bg = c.selection },
  qfFileName = { fg = c.number },
  qfLineNr = { fg = c.comment },

  -- Syntax: intentionally neutral identifiers, functions, and operators.
  Comment = { fg = c.comment },
  Constant = { fg = c.fg },
  String = { fg = c.string },
  Character = { fg = c.string },
  Number = { fg = c.number },
  Boolean = { fg = c.keyword },
  Identifier = { fg = c.fg },
  Function = { fg = c.fg },
  Statement = { fg = c.keyword },
  Operator = { fg = c.fg },
  PreProc = { fg = c.keyword },
  Type = { fg = c.builtin_type },
  StorageClass = { fg = c.keyword },
  Structure = { fg = c.keyword },
  Typedef = { fg = c.keyword },
  Special = { fg = c.fg },
  SpecialChar = { fg = c.string },
  Delimiter = { fg = c.fg },
  Underlined = { fg = c.bright, underline = true },
  Ignore = { fg = c.comment },
  Error = { fg = c.error, underline = true },
  Todo = { fg = c.warning, bold = true },
  Added = { fg = c.string },
  Changed = { fg = c.number },
  Removed = { fg = c.error },
  GobyexampleBuiltin = { fg = c.keyword },
  GobyexamplePrompt = { fg = c.purple },
  GobyexampleDeprecated = { strikethrough = true },

  DiffAdd = { bg = c.add_bg },
  DiffChange = { bg = c.change_bg },
  DiffDelete = { fg = c.error, bg = c.delete_bg },
  DiffText = { bg = c.selection, bold = true },
  SpellBad = { sp = c.error, undercurl = true },
  SpellCap = { sp = c.number, undercurl = true },
  SpellLocal = { sp = c.string, undercurl = true },
  SpellRare = { sp = c.purple, undercurl = true },
  LspReferenceText = { bg = c.line },
  LspReferenceRead = { bg = c.line },
  LspReferenceWrite = { bg = c.selection },
  LspSignatureActiveParameter = { bg = c.selection, bold = true },
  LspInlayHint = { fg = c.comment, bg = c.line },
}

for name, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, name, spec)
end

local links = {
  -- Standard syntax and editor aliases.
  Float = "Number", Conditional = "Statement", Repeat = "Statement",
  Label = "Statement", Keyword = "Statement", Exception = "Statement",
  Include = "PreProc", Define = "PreProc", Macro = "PreProc", PreCondit = "PreProc",
  SpecialComment = "Comment", Debug = "Special", Tag = "Identifier",
  lCursor = "Cursor", CursorIM = "Cursor", VertSplit = "WinSeparator",
  VisualNOS = "Visual", CursorLineSign = "SignColumn", CursorLineFold = "FoldColumn",
  LineNrAbove = "LineNr", LineNrBelow = "LineNr",
  PmenuKind = "Pmenu", PmenuKindSel = "PmenuSel",
  PmenuExtra = "Pmenu", PmenuExtraSel = "PmenuSel",
  SnippetTabstop = "Visual", LspReferenceTarget = "LspReferenceText",

  -- Go's built-in regex syntax (works without a Tree-sitter parser).
  goBuiltins = "GobyexampleBuiltin", goBoolean = "Boolean",
  goPredefinedIdentifiers = "Boolean", goType = "Type",
  goDeclaration = "Keyword", goDeclType = "Keyword",

  -- Tree-sitter. User-defined types are neutral; built-in types are red.
  ["@variable"] = "Identifier", ["@variable.builtin"] = "GobyexampleBuiltin",
  ["@variable.parameter"] = "Identifier", ["@variable.member"] = "Identifier",
  ["@variable.parameter.builtin"] = "Identifier",
  ["@constant"] = "Constant", ["@constant.builtin"] = "Boolean",
  ["@constant.macro"] = "Constant", ["@module"] = "Identifier",
  ["@module.builtin"] = "Identifier", ["@label"] = "Label",
  ["@string"] = "String", ["@string.documentation"] = "String",
  ["@string.regexp"] = "String", ["@string.escape"] = "String",
  ["@string.special"] = "String", ["@string.special.url"] = "Underlined",
  ["@character"] = "Character", ["@character.special"] = "Character",
  ["@boolean"] = "Boolean", ["@number"] = "Number", ["@number.float"] = "Float",
  ["@type"] = "Identifier", ["@type.builtin"] = "Type",
  ["@type.definition"] = "Identifier", ["@attribute"] = "Identifier",
  ["@attribute.builtin"] = "GobyexampleBuiltin", ["@property"] = "Identifier",
  ["@function"] = "Function", ["@function.call"] = "Function",
  ["@function.builtin"] = "GobyexampleBuiltin", ["@function.macro"] = "Function",
  ["@function.method"] = "Function", ["@function.method.call"] = "Function",
  ["@constructor"] = "Identifier", ["@operator"] = "Operator",
  ["@keyword"] = "Keyword", ["@keyword.operator"] = "Keyword",
  ["@keyword.function"] = "Keyword", ["@keyword.type"] = "Keyword",
  ["@keyword.import"] = "Keyword", ["@keyword.return"] = "Keyword",
  ["@keyword.repeat"] = "Keyword", ["@keyword.conditional"] = "Keyword",
  ["@keyword.conditional.ternary"] = "Operator",
  ["@keyword.coroutine"] = "Keyword", ["@keyword.modifier"] = "Keyword",
  ["@keyword.exception"] = "Keyword", ["@keyword.debug"] = "Keyword",
  ["@keyword.directive"] = "PreProc",
  ["@punctuation"] = "Delimiter", ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter", ["@punctuation.special"] = "Delimiter",
  ["@comment"] = "Comment", ["@comment.documentation"] = "Comment",
  ["@comment.todo"] = "Todo", ["@comment.error"] = "DiagnosticError",
  ["@comment.warning"] = "DiagnosticWarn", ["@comment.note"] = "DiagnosticInfo",
  ["@markup.heading"] = "Title", ["@markup.link"] = "Underlined",
  ["@markup.link.label"] = "Underlined", ["@markup.link.url"] = "Underlined",
  ["@markup.raw"] = "String", ["@markup.quote"] = "Comment",
  ["@markup.list"] = "Keyword", ["@markup.math"] = "Number",
  ["@diff.plus"] = "Added", ["@diff.minus"] = "Removed", ["@diff.delta"] = "Changed",
  ["@tag"] = "Keyword", ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",

  -- Older Tree-sitter capture names.
  ["@namespace"] = "Identifier", ["@parameter"] = "Identifier",
  ["@field"] = "Identifier", ["@method"] = "Function", ["@method.call"] = "Function",
  ["@float"] = "Float", ["@conditional"] = "Keyword", ["@repeat"] = "Keyword",
  ["@include"] = "Keyword", ["@exception"] = "Keyword",
  ["@storageclass"] = "Keyword", ["@symbol"] = "String",

  -- LSP semantic tokens: keep server-provided tokens in the same palette.
  ["@lsp.type.namespace"] = "Identifier", ["@lsp.type.type"] = "Identifier",
  ["@lsp.type.class"] = "Identifier", ["@lsp.type.enum"] = "Identifier",
  ["@lsp.type.interface"] = "Identifier", ["@lsp.type.struct"] = "Identifier",
  ["@lsp.type.typeParameter"] = "Identifier", ["@lsp.type.parameter"] = "Identifier",
  ["@lsp.type.variable"] = "Identifier", ["@lsp.type.property"] = "Identifier",
  ["@lsp.type.enumMember"] = "Constant", ["@lsp.type.event"] = "Identifier",
  ["@lsp.type.function"] = "Function", ["@lsp.type.method"] = "Function",
  ["@lsp.type.macro"] = "Constant", ["@lsp.type.keyword"] = "Keyword",
  ["@lsp.type.modifier"] = "Keyword", ["@lsp.type.comment"] = "Comment",
  ["@lsp.type.string"] = "String", ["@lsp.type.number"] = "Number",
  ["@lsp.type.regexp"] = "String", ["@lsp.type.operator"] = "Operator",
  ["@lsp.type.decorator"] = "Identifier", ["@lsp.mod.deprecated"] = "GobyexampleDeprecated",
  ["@lsp.typemod.function.defaultLibrary"] = "GobyexampleBuiltin",
  ["@lsp.typemod.type.defaultLibrary"] = "Type",
  ["@lsp.typemod.class.defaultLibrary"] = "Type",
  ["@lsp.typemod.variable.defaultLibrary"] = "GobyexampleBuiltin",

  -- Common plugin groups; harmless when the plugins are absent.
  GitSignsAdd = "Added", GitSignsChange = "Changed", GitSignsDelete = "Removed",
  GitSignsAddNr = "Added", GitSignsChangeNr = "Changed", GitSignsDeleteNr = "Removed",
  GitSignsAddLn = "DiffAdd", GitSignsChangeLn = "DiffChange", GitSignsDeleteLn = "DiffDelete",
  TelescopeNormal = "NormalFloat", TelescopeBorder = "FloatBorder",
  TelescopeTitle = "FloatTitle", TelescopeSelection = "PmenuSel",
  TelescopeMatching = "PmenuMatch", TelescopePromptPrefix = "GobyexamplePrompt",
  CmpItemAbbr = "Identifier", CmpItemAbbrMatch = "PmenuMatch",
  CmpItemAbbrMatchFuzzy = "PmenuMatch", CmpItemAbbrDeprecated = "GobyexampleDeprecated",
  CmpItemMenu = "Comment", CmpItemKind = "Type",
  NvimTreeNormal = "NormalFloat", NvimTreeNormalNC = "NormalFloat",
  NvimTreeFolderName = "Directory", NvimTreeRootFolder = "Title",
  NeoTreeNormal = "NormalFloat", NeoTreeNormalNC = "NormalFloat",
  NeoTreeDirectoryName = "Directory", NeoTreeFloatBorder = "FloatBorder",
  IblIndent = "Whitespace", IblScope = "NonText",
}

for name, target in pairs(links) do
  vim.api.nvim_set_hl(0, name, { link = target })
end

vim.api.nvim_set_hl(0, "@markup.strong", { bold = true })
vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })
vim.api.nvim_set_hl(0, "@markup.strikethrough", { strikethrough = true })

local diagnostics = {
  Error = { c.error, c.delete_bg },
  Warn = { c.warning, c.warn_bg },
  Info = { c.number, c.change_bg },
  Hint = { c.string, c.add_bg },
  Ok = { c.string, c.add_bg },
}
for severity, colors in pairs(diagnostics) do
  local name = "Diagnostic" .. severity
  vim.api.nvim_set_hl(0, name, { fg = colors[1] })
  vim.api.nvim_set_hl(0, "DiagnosticSign" .. severity, { fg = colors[1] })
  vim.api.nvim_set_hl(0, "DiagnosticFloating" .. severity, { fg = colors[1] })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. severity, { fg = colors[1], bg = colors[2] })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualLines" .. severity, { fg = colors[1] })
  vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. severity, { sp = colors[1], undercurl = true })
end
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = c.comment })
vim.api.nvim_set_hl(0, "DiagnosticDeprecated", { strikethrough = true, sp = c.error })

-- ANSI colors for new :terminal buffers. UI-only colors supplement the site palette.
local terminal = {
  c.panel, c.keyword, c.string, c.warning, c.number, c.purple, "#76999a", c.fg,
  c.comment, c.error, "#8da78e", "#c8ae80", "#8ba9d5", "#a58bc4", "#94b5b6", c.bright,
}
for i, color in ipairs(terminal) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
