local my_attach = require('pn.lsp_attach').my_attach

local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = my_attach,
}
require('jdtls').start_or_attach(config)
