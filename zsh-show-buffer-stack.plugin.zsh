export COMMAND_BUFFER_STACK=''
typeset -a buffer_stack_arr

function make-p-buffer-stack() {
  if [[ ! $#buffer_stack_arr -gt 0 ]]; then
    COMMAND_BUFFER_STACK=''
    return
  fi
	COMMAND_BUFFER_STACK="%F{cyan}<Stack:$buffer_stack_arr>%f"
}

function show-buffer-stack() {
  local cmd_str_len=$#LBUFFER
  [[ cmd_str_len -gt 10 ]] && cmd_str_len=10
	buffer_stack_arr=("[$LBUFFER[1,${cmd_str_len}]]" $buffer_stack_arr)
  make-p-buffer-stack
  zle push-line-or-edit
  zle reset-prompt
}

function check-buffer-stack() {
  [[ $#buffer_stack_arr -gt 0 ]] && shift buffer_stack_arr
  make-p-buffer-stack
}

zle -N show-buffer-stack
