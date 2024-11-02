function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l last_status $status

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l user_symbol "  $USER " 
  set -l user_info $cyan $user_symbol $normal

  set cwd_info (echo $(pwd) | sed "s:$HOME:~:")
  # :")
  set -l user_info $cyan $user_symbol 
  set -l path $blue $my_string

 
  # Display all information
  echo -n -s $user_info $cwd_info

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    if [ (_git_is_dirty) ]
      set git_info $green "($git_branch)"
    else
      set git_info $yellow $git_branch
    end
    echo -n -s ' ' $git_info $normal
  end



  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
  echo -e -n -s $prompt_color '  ' $normal
end
