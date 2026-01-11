FROM registry.fedoraproject.org/fedora-toolbox:latest

# Install system packages
# Added: ImageMagick (magick), ghostscript (gs), and fish (for fish_indent)
RUN dnf update -y && \
    dnf install -y git fd-find curl ripgrep tree-sitter-cli neovim fzf \
    gcc-c++ make findutils python3-pip nodejs luarocks golang cargo \
    compat-lua compat-lua-devel ImageMagick ghostscript fish && \
    dnf clean all

# Install ast-grep globally via cargo
RUN cargo install ast-grep --root /usr/local --locked

# Pre-install Neovim providers globally
# Added: neovim npm package to fix the Node.js provider warning
RUN pip install pynvim && \
    npm install -g neovim
