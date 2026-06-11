{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      marksman
      markdown-oxide
      lua-language-server
      nixd
      nil
      vscode-json-languageserver
      bash-language-server
      taplo
      tombi
      svelte-language-server
      vscode-css-languageserver
      tinymist
    ];
    languages = {
      language-server = {
        rust-analyzer.config = {
          check = {
            command = "clippy";
          };
          cargo = {
            allFeatures = true;
            buildScripts = {
              enable = true;
            };
          };
          procMacro = {
            enable = true;
          };
          diagnostics = {
            enable = true;
            experimental.enable = true;
          };
          completion = {
            autoimport.enable = true;
            autoself.enable = true;
            postfix.enable = true;
          };
        };
        lua-language-server.config.telemetry = false;
        nixd.args = ["--semantic-tokens=true"];
        bash-language-server.config.bashIde.highlightParsingErrors = true;
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.alejandra;
            args = ["--quiet" "-"];
            language-servers = [
              "nixd"
              {
                name = "nil";
                except-features = ["hover"];
              }
            ];
          };
        }
      ];
    };
    settings = {
      theme = "catppuccin-mocha";
      editor = {
        default-yank-register = "+";
        shell = [
          "nu"
          "-c"
        ];
        gutters = [
          "diagnostics"
          "line-numbers"
          "spacer"
          "diff"
        ];
        scrolloff = 5;
        bufferline = "multiple";
        completion-replace = true;
        completion-trigger-len = 1;
        color-modes = true;
        popup-border = "all";
        end-of-line-diagnostics = "info";
        continue-comments = false;
        auto-save = true;
        true-color = true;
        idle-timeout = 50;
        soft-wrap.enable = true;
        auto-format = true;

        indent-guides = {
          render = true;
          character = "┃";
        };
        inline-diagnostics.cursor-line = "warning";
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
          snippets = true;
          auto-signature-help = true;
          display-signature-help-docs = true;
        };

        search = {
          smart-case = true;
          wrap-around = true;
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
          ];
          center = [
            "diagnostics"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "register"
            "file-type"
            "selections"
            "position-percentage"
            "file-encoding"
          ];
          mode = {
            normal = "N";
            insert = "I";
            select = "S";
          };
        };
      };

      keys = {
        normal = {
          tab = "goto_next_buffer";
          S-tab = "goto_previous_buffer";
          space.x = ":buffer-close";
        };
        insert = {
          Meta-space = "no_op";
        };
      };
    };
  };
}
