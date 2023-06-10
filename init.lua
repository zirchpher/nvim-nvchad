-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-------------------------------
-- vs-code snippets
-------------------------------

-- snippets para Angular
-- vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/angular"

-- snippets para React (No necesario ya que vienen estos plugins por defecto)
-- vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/react"

-- snippets para Python
-- vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/python"

-------------------------------
-- vs-code snippets
-------------------------------

-- shortcut
local opt = vim.opt

-- encoding
opt.encoding = "utf-8"

-- line number
opt.relativenumber = true -- muestra los número relativos
opt.number = true -- muestra los números de cada línea en pantalla

-- tabs & indentation
opt.tabstop = 2 -- la cantidad de carácteres que se ocupa al hacer tab
opt.shiftwidth = 2 -- el espacio que se usará para indentar una línea. Esta opción afecta los atajos << y >>
opt.expandtab = true -- determina si Neovim debe transformar el carácter Tab en espacios.
opt.autoindent = true -- copia el identado de la línea actual al comenzar una nueva
opt.smartindent = true -- es como 'autoindent' pero también reconoce algunos aumentos/reducciones de sintaxis C
opt.breakindent = true -- Conserva la indentación de las líneas que sólo son visibles cuando wrap es true.

-- wrapping
opt.wrap = false -- pone debajo las líneas que sobrepasan la pantalla

-- folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- search settings
opt.ignorecase = true -- ignorar las letrás mayúsculas cuando realizamos una búsqueda
opt.smartcase = true -- Hace que nuestra búsqueda ignore las letrás mayúsculas a menos que el término que estamos buscando tenga una letra mayúscula
opt.hlsearch = true -- Cuando hacemos una búsqueda resalta los resultados

-- cursor
opt.scrolloff = 8 -- scrool con 8 líneas
opt.mouse = "a" -- habilitar el ratón

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as default register

opt.iskeyword:append "-" -- considerar las palabras "my-string" como una sola palabra
