FROM debian:latest

# Install the application dependencies
RUN apt -y update && apt -y upgrade && apt -y install gcc git tmux fish wget zip build-essential

# Setup TA user
RUN mkdir -p /home/TA
RUN useradd TA
RUN usermod --shell /bin/fish TA
RUN chown TA:TA /home/TA
USER TA

# turn on mousemode for tmux
RUN cd /home/TA
RUN echo "set -g mouse on" > /home/TA/.tmux.conf

# add neovim to path
RUN mkdir -p /home/TA/.config/fish
RUN echo "fish_add_path /home/TA/bin/nvim-linux64/bin/" > /home/TA/.config/fish/config.fish

# install neovim
RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /home/TA/nvim.tar.gz
RUN mkdir -p /home/TA/bin/
RUN tar -C /home/TA/bin -xzf /home/TA/nvim.tar.gz
RUN git clone https://github.com/nvim-lua/kickstart.nvim.git /home/TA/.config/nvim



ENTRYPOINT ["/bin/fish"]
