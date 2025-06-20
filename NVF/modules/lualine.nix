{
  pkgs,
  lib,
  ...
}: {
  vim.statusline.lualine = {
    enable = true;
    activeSection = {
      a = [
        ''
          {
            "mode",
            icons_enabled= true,
            separator = {
              left = '',
              right = ''
            },
          }
        ''
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
      b = [
        ''
          {
            "filetype",
            colored = true,
            icon_only = true,
            icon = { align = 'left' }
          }
        ''
        ''
          {
            "filename",
            symbols = {modified = ' ', readonly = ' '},
            separator = {right = ''}
          }
        ''
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
      c = [
        ''
          {
            "diff",
            colored = false,
            diff_color = {
              -- Same color values as the general color option can be used here.
              added    = 'DiffAdd',    -- Changes the diff's added color
              modified = 'DiffChange', -- Changes the diff's modified color
              removed  = 'DiffDelete', -- Changes the diff's removed color you
            },
            symbols = {added = ' ', modified = '~ ', removed = ' '}, -- Changes the diff symbols
            separator = {right = ''}
          }
        ''
      ];
      x = [
        ''
          {
            -- Lsp server name
            function()
              local buf_ft = vim.api.nvim_get_option_value('filetype', {})

              -- List of buffer types to exclude
              local excluded_buf_ft = {"toggleterm", "NvimTree", "neo-tree", "TelescopePrompt"}

              -- Check if the current buffer type is in the excluded list
              for _, excluded_type in ipairs(excluded_buf_ft) do
                if buf_ft == excluded_type then
                  return ""
                end
              end

              -- Get the name of the LSP server active in the current buffer
              local clients = vim.lsp.get_active_clients()
              local msg = 'No Active Lsp'

              -- if no lsp client is attached then return the msg
              if next(clients) == nil then
                return msg
              end

              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end

              return msg
            end,
            icon = ' ',
            separator = {left = ''},
          }
        ''
        ''
          {
            "diagnostics",
            sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
            symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
            colored = true,
            update_in_insert = false,
            always_visible = false,
            diagnostics_color = {
              color_error = { fg = 'red' },
              color_warn = { fg = 'yellow' },
              color_info = { fg = 'cyan' },
            },
          }
        ''
      ];
      y = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
        ''
          {
            'searchcount',
            maxcount = 999,
            timeout = 120,
            separator = {left = ''}
          }
        ''
        ''
          {
            "branch",
            icon = ' •',
            separator = {left = ''}
          }
        ''
        ''
          {
            "progress",
            separator = {left = ''}
          }
        ''
      ];
      z = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''

        ''
          {"location"}
        ''
        ''
          {
            "fileformat",
            color = {fg='black'},
            symbols = {
              unix = '', -- e712
              dos = '',  -- e70f
              mac = '',  -- e711
            },
            separator = {right = ''}
          }
        ''
      ];
    };
  };
}
