FROM registry.fedoraproject.org/fedora-toolbox:latest

# Install system packages
RUN dnf update -y && \
    dnf install -y git fd-find curl ripgrep tree-sitter-cli neovim fzf \
    gcc-c++ make findutils python3-pip nodejs luarocks golang cargo \
    compat-lua compat-lua-devel && \
    dnf clean all

# Install ast-grep globally so it's in /usr/local/bin
RUN cargo install ast-grep --root /usr/local --locked

# Pre-install the Neovim python provider globally
RUN pip install pynvim
