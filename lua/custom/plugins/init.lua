-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.cmdheight = 0
vim.o.statuscolumn = '%s %l %r'

-- Nvim Tree config
vim.keymap.set('n', '<leader><leader>', function()
  local api = require 'nvim-tree.api'
  api.tree.toggle()
end)

-- Use Shift+Tab to accept Copilot suggestions
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

return {
  'github/copilot.vim',
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {}
    end,
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
    },
  },
  {
    'MysticalDevil/inlay-hints.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('inlay-hints').setup()
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        filters = { git_ignored = false, dotfiles = false },
      }
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup {}
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup {
        show = true,
        handlers = {
          gitsigns = true,
        },
        handle = {
          blend = 0,
          text = ' ',
          color = '#1c1c1c',
          color_nr = 234,
        },
        marks = {
          Search = { color = '#C9A554' },
          Error = { color = '#685742' },
          Warn = { color = '#B36D43' },
          Info = { color = '#5f875f' },
          Hint = { color = '#5f875f' },
          Misc = { color = '#bb7744' },
          Cursor = { color = '#222222', text = ' ' },
        },
      }
    end,
  },
}
