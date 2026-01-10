require("conform").setup({
    formatters_by_ft = {
        cpp = { "clang_format_cpp" },
        c = { "clang_format_c" },
        typescript = { "prettier_ts" },
        typescriptreact = { "prettier_ts" },
        tsx = { "prettier_ts" },
        javascript = { "prettier_ts" },
        javascriptreact = { "prettier_ts" },
        css = { "prettier_css" },
        scss = { "prettier_css" },
        html = { "prettier_ts" },
        rust = { "rustfmt" },
        python = { "black" },
    },
    formatters = {
        clang_format_cpp = {
            command = "clang-format",
            -- stdin must be true for instant formatting
            stdin = true,
            args = {
                "--style=file",
                -- This is the magic flag. It tells clang-format:
                -- "I am sending you code via stdin, but pretend it is this file."
                -- This allows it to find the Main Include and the correct .clang-format file.
                "--assume-filename",
                "$FILENAME",
            },
        },

        clang_format_c = {
            command = "clang-format",
            stdin = true,
            args = {
                "--style=file",
                "--assume-filename",
                "$FILENAME",
            },
        },
        prettier_ts = {
            command = "/Users/braeden/.local/share/nvim/mason/bin/prettier",
            stdin = false,
            args = { "--write", "--tab-width", "2", "--use-tabs", "--print-width", "80", "--quote", "double", "$FILENAME" },
        },
        prettier_css = {
            command = "/Users/braede/.local/share/nvim/mason/bin/prettier",
            stdin = false,
            args = { "--write", "--tab-width", "2", "--use-tabs", "--print-width", "80", "$FILENAME" },
        },
        rustfmt = {
            command = "rustfmt",
            stdin = false,
            args = { "--edition", "2024", "--config", "max_width=80,hard_tabs=true,tab_spaces=2", "$FILENAME" },
        },
        black = {
            command = "black",
            stdin = false,
            args = { "--line-length", "80", "--skip-string-normalization", "$FILENAME" },
        },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
    log_level = vim.log.levels.DEBUG,
})