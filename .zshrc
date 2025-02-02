# Greeting
echo "Welcome home"

# Prompt
PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f "
# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# alias
alias ls='ls -lh '
#--color=auto
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history


##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt

# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;Parrot Terminal\a"
preexec () { print -Pn "\e]0;$1 - Parrot Terminal\a" }

# my aliases

# ignores all files except the ones passed as parameters
gitignex() { echo "*\n!$1\n!.gitignore" > .gitignore }

# creates and changes to a new directory
mkcd() { mkdir $1 && cd $1 }

# runs norminette on files beggining with ft on the current directory
checkft() { norminette ft* }

# compiles and runs all files beggining with ft on the current directory
runft() { clear; gcc -Wall -Wextra -Werror ft*; ./a.out }

# compiles and runs all files beggining with ft and main.c on the current directory 
runftProgram() {

	clear
	gcc -Wall -Wextra -Werror ft* main.c && ./a.out

}

# runs norminette and compiles all files beggining with ft on the current directory 
checkNrunft() { clear; norminette ft*; gcc -Wall -Wextra -Werror ft* && ./a.out }

# runs norminette and compiles all files beggining with ft and main.c on the current directory 
checkNrunftProgram() { clear; norminette ft*; gcc -Wall -Wextra -Werror main.c ft* && ./a.out }

# git status but better (no untracked files)
alias gstat='git status -uno'

# update shell with zshrc
alias sh_update='source ~/.zshrc'
