# https://stackoverflow.com/questions/19901044/what-is-k-f-in-oh-my-zsh-theme
# https://stackoverflow.com/questions/4466245/customize-zshs-prompt-when-displaying-previous-command-exit-code
# https://zhuanlan.zhihu.com/p/51008087
# https://www.manpagez.com/man/1/zshmisc/

# https://stackoverflow.com/questions/18810483/what-is-the-zsh-equivalent-of-a-bash-script-getting-the-scripts-directory
source ${0:h}/git-prompt.sh

_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

PROMPT='%F{12}%n@%m%f%F{13} $(_fishy_collapsed_wd)$(__git_ps1 " (%s)")%(?.. %F{9}[%?]%f)%F{13}%(!.#.>)%f'

setopt prompt_subst
