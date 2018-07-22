# zsh-show-buffer-stack

zsh-show-buffer-stack makes the command line stack visible at the prompt.

## Installation

### Using zgen

Include the load command in your .zshrc

```text
zgen load yukiycino-dotfiles/zsh-show-buffer-stack
```

### Using zplug

```text
zplug "yukiycino-dotfiles/zsh-show-buffer-stack"
```

### Using Antigen

```text
antigen bundle yukiycino-dotfiles/zsh-show-buffer-stack
```

## Settings

```text
add-zsh-hook precmd check-buffer-stack
RPROMPT='${COMMAND_BUFFER_STACK}'

bindkey '^q' show-buffer-stack
```

## Usage

```text
Input:
$ some-command

Push: <C-q>
$                                                       <Stack:[some-command]>

Input:
$ some-command2                                         <Stack:[some-command]>

Push: <C-q>
$                                       <Stack:[some-command2] [some-command]>

Input:
$ echo 'hoge'<Enter>                    <Stack:[some-command2] [some-command]>
hoge

Push: <Enter>
$ some-command2                                         <Stack:[some-command]>

Push: <Enter>
$ some-command
```

Read:
* https://gist.github.com/yukirin/7067299
