{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      nil
      lua-language-server
      intelephense
      vue-language-server
      prettier
      eslint_d
    ];

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      plenary-nvim
      nvim-treesitter
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      conform-nvim
      lualine-nvim
      nvim-web-devicons
    ];

    initLua = ''
      vim.g.mapleader = " "

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"

      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true

      vim.opt.ignorecase = true
      vim.opt.smartcase = true

      vim.opt.undofile = true
      vim.opt.clipboard = "unnamedplus"
      vim.opt.mouse = "a"
      vim.opt.scrolloff = 8
      vim.opt.updatetime = 250
      vim.opt.completeopt = "menu,menuone,noselect"

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("i", "jk", "<Esc>", opts)
      map("n", "<leader>e", vim.cmd.Ex, opts)
      map("n", "<leader>x", "<cmd>bprevious<bar>bdelete<cr>", opts)
      map("n", "<leader>bf", "<cmd>bnext<cr>", opts)
      map("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
      map("n", "<C-h>", "<C-w>h", opts)
      map("n", "<C-j>", "<C-w>j", opts)
      map("n", "<C-k>", "<C-w>k", opts)
      map("n", "<C-l>", "<C-w>l", opts)

      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
      local tb = require("telescope.builtin")
      map("n", "<leader>ff", tb.find_files, opts)
      map("n", "<leader>fg", tb.live_grep, opts)
      map("n", "<leader>fb", tb.buffers, opts)
      map("n", "<leader>fh", tb.help_tags, opts)

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local bmap = function(mode, key, action, desc)
          vim.keymap.set(mode, key, action, { buffer = bufnr, desc = desc })
        end
        bmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        bmap("n", "gr", vim.lsp.buf.references, "References")
        bmap("n", "K", vim.lsp.buf.hover, "Hover")
        bmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        bmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
      end

      vim.lsp.config("lua_ls", { on_attach, capabilities })
      vim.lsp.config("nil_ls", { on_attach, capabilities })
      vim.lsp.config("intelephense", { on_attach, capabilities })
      vim.lsp.config("volar", { on_attach, capabilities })
      vim.lsp.enable({ "lua_ls", "nil_ls", "intelephense", "volar" })

      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          vue = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          nix = { "nixfmt" },
          php = { "prettier" },
        },
      })
      map("n", "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, opts)

      require("lualine").setup({
        options = { theme = "ayu_dark" },
      })

      vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
        callback = function()
          vim.highlight.on_yank()
        end,
      })
    '';
  };
}
