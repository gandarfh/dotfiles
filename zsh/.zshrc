export GPG_TTY=$(tty)
export GOPATH=$HOME/go
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export DOCKER_HOST=unix:///var/run/docker.sock


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

	HISTFILE=~/.zsh_history # Store history to persist across sessions.

  HISTSIZE=12000
  SAVEHIST=10000
  setopt INC_APPEND_HISTORY
  setopt SHARE_HISTORY


function = 
{
  echo "$@" | bc -l
}



	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  alias calc="="
  alias screenkey="screenkey -p fixed -g 20%x5%-5%-5%"
  alias kubectl="minikube kubectl --"
  alias open="xdg-open"
  alias ltr="lein trampoline repl :headless &"
  alias ghd="gh dash"
	alias ls="exa"
	alias lg="lazygit"
  alias lzd="lazydocker"
	alias cat2="bat --style=auto"
  alias ex="exit"
  alias colors="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"

	# opam configuration
	[[ ! -r /home/jaum/.opam/opam-init/init.zsh ]] || source /home/jaum/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

	### Added by Zinit's installer
	if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})¿%f"
			    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
					    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
							        print -P "%F{33} %F{34}Installation successful.%f%b" || \
											        print -P "%F{160} The clone has failed.%f%b"
															fi

															source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
															autoload -Uz _zinit
															(( ${+_comps} )) && _comps[zinit]=_zinit

															# Load a few important annexes, without Turbo
															# (this is currently required for annexes)


															zinit light zsh-users/zsh-autosuggestions
															zinit light zdharma-continuum/fast-syntax-highlighting
															zinit light zsh-users/zsh-completions


															### End of Zinit's installer chunk

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export PATH=$PATH:$HOME/bin
