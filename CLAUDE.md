# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages shell configuration, system settings, and development environment setup for macOS. It's built on a modular architecture where each topic (git, zsh, node, etc.) has its own directory with standardized file types.

## Key Commands

### Setup and Installation
- `script/bootstrap` - Initial setup: configures git, creates symlinks, installs dependencies
- `script/install` - Runs all topic-specific install.sh scripts
- `bin/dot` - Maintenance command: updates Homebrew, runs installers, sets macOS defaults
- `bin/dot -e` - Opens dotfiles directory in $EDITOR

### Git Workflow (via aliases in git/aliases.zsh)
- `gl` - git pull --prune
- `gp` - git push origin HEAD  
- `glog` - Pretty git log with graph
- `gac <message>` - git add -A && git commit -m
- `gs` - git status -sb
- `gco` - git checkout
- `gcb` - git copy-branch-name (custom script)

### Custom Utilities (in bin/)
- `git-*` scripts - Extended git functionality (git-nuke, git-unpushed, git-promote, etc.)
- `search <term>` - Search utility
- `todo` - Todo management
- `notify` - System notifications
- `fresh-chrome-with-custom-tz` - Chrome with custom timezone

## Architecture

### File Type Conventions
The dotfiles system uses a convention-based loading system managed by `zsh/zshrc.symlink`:

1. **`*/path.zsh`** - Loaded first to set up PATH variables
2. **`*/*.zsh`** - All other .zsh files loaded for aliases, functions, config
3. **`*/completion.zsh`** - Loaded last after autocomplete initialization
4. **`*.symlink`** - Symlinked to $HOME during bootstrap (e.g., `gitconfig.symlink` → `~/.gitconfig`)
5. **`*/install.sh`** - Executed by `script/install` to set up topic-specific software

### Loading Order
1. `~/.localrc` (if exists) - Private environment variables
2. All `path.zsh` files
3. All other `.zsh` files (except path.zsh and completion.zsh)
4. Autocomplete initialization
5. All `completion.zsh` files

### Key Environment Variables
- `$ZSH` - Points to ~/.dotfiles
- `$PROJECTS` - Default ~/dev for project navigation
- `$EDITOR` - Set to 'vim'

### Topic Structure
Each topic directory follows this pattern:
```
topic/
├── aliases.zsh          # Command aliases
├── path.zsh            # PATH modifications  
├── completion.zsh      # Autocomplete rules
├── install.sh          # Installation script
├── config.zsh          # Configuration
└── *.symlink          # Files to symlink to $HOME
```

## Development Workflow

### Adding New Utilities
1. Create executable scripts in `bin/` - they're automatically added to PATH
2. For shell functions, add to `functions/` directory
3. For aliases, add to appropriate topic's `aliases.zsh`

### Modifying Configurations
1. Edit files in topic directories (not the symlinked versions in $HOME)
2. Most changes take effect immediately due to shell sourcing
3. Run `dot` periodically to update system and dependencies

### Testing Changes
- Source changes: `source ~/.zshrc` 
- Test scripts: Run directly from `bin/` directory
- Verify symlinks: Check that `~/.dotfiles/topic/file.symlink` matches `~/file`

## macOS Integration

The system includes extensive macOS customization:
- `macos/set-defaults.sh` - System preferences automation
- `homebrew/install.sh` - Package manager setup
- Terminal themes and settings in `system/`

## Private Configuration

Use `~/.localrc` for private environment variables, API keys, and machine-specific settings that shouldn't be committed to the repository.