{ pkgs, ... }:
{
  dependencies = with pkgs; [
    # haskell
    haskellPackages.haskell-language-server

    # c++
    # clang_12
    gcc
    cmake
    llvm

    # rust
    rust-analyzer
    delta

    # utils
    bat
    ripgrep
    fd

    # node
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted

    neovim
  ];

  configPath = ./neovim-config;
}
