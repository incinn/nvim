local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

nvim_lsp.tsserver.setup {
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to definition. CTRL+T to go back!!
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to definition. CTRL+T to go back!!
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) 
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) 
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) -- CRTL+Q to put them into quick fix 
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer=0})
    end,
    filetypes = { "typescript", "javascript" },
    cmd = { "typescript-language-server", "--stdio"}
}

nvim_lsp.cssls.setup {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = root_pattern("package.json", ".git") or bufdir,
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    }
}

nvim_lsp.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
}

nvim_lsp.jsonls.setup {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
        provideFormatter = true
    },
    root_dir = util.find_git_ancestor
}

nvim_lsp.angularls.setup {
    cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    root_dir = root_pattern("angular.json")
}
