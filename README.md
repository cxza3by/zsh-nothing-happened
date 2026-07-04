Доступен [README.md](https://github.com/cxza3by/zsh-nothing-happened/blob/main/RUS.md) на русском.

# zsh-nothing-happened

A minimal and smart ZSH plugin that alerts you when a command executes completely silently (produces no stdout/stderr output). It displays the exit code and a warning icon, so you always know if a process finished successfully or silently failed.

Under the hood, it uses ANSI Device Status Reports (`\e[6n`) to track cursor position before and after execution, making it incredibly lightweight and independent of stream redirections.

## Installation

### Oh My Zsh
1. Clone this repository into your custom plugins directory:
   ```bash
   git clone https://github.com/Caxapok387/zsh-nothing-happened ~/.oh-my-zsh/custom/plugins/zsh-nothing-happened
   ```

3. Add `zsh-nothing-happened` to your plugins array in `~/.zshrc`:
   ```zsh
   plugins=(... zsh-nothing-happened)
   ```
   
4. Restart your terminal: 
   `exec zsh` or `omz reload`

> [!NOTE]
> **Font Requirement:** This plugin uses a warning icon (``) from **Nerd Fonts**. If the icon doesn't display correctly (or appears as a blank square), please make sure you are using a patched terminal font (such as *FiraCode Nerd Font*, *JetBrainsMono Nerd Font*, etc.).

### Manual Installation

###### If you don't use a plugin manager, just clone the repo anywhere and source it inside your `.zshrc`:
```zsh
source /path/to/zsh-nothing-happened/zsh-nothing-happened.plugin.zsh
```

## Contributing
Feel free to open Issues or submit Pull Requests (e.g., if you want to add an `install.sh` or support for other plugin managers like Antigen/Sheldon).
