local function setup_jdtls()
    local jdtls = require('jdtls')
    local config = {
        cmd = { 'jdtls' },
        root_dir = require('lspconfig').util.root_pattern('pom.xml', 'gradlew', '.git'),
        -- Добавьте дополнительные настройки по необходимости
    }
    jdtls.start_or_attach(config)
end

-- Автокоманда для запуска jdtls при открытии Java-файлов
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = setup_jdtls,
})
