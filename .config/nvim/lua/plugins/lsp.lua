vim.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

require('lspconfig').ansiblels.setup{ on_attach=on_attach }
require('lspconfig').bashls.setup{ on_attach=on_attach }
require('lspconfig').clangd.setup{ on_attach=on_attach, filetypes = { "c", "cpp", "objc", "objcpp", "ino" } }
require('lspconfig').dockerls.setup{ on_attach=on_attach }
require('lspconfig').jsonls.setup{ on_attach=on_attach }
require('lspconfig').pyright.setup{ on_attach=on_attach }
require('lspconfig').texlab.setup{ on_attach=on_attach }
require('lspconfig').vimls.setup{ on_attach=on_attach }
require('lspconfig').yamlls.setup{ on_attach=on_attach }
