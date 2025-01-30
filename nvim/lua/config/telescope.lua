require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--follow",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line_number",
            "--column",
            "--smart-case",
        }
    }
}
