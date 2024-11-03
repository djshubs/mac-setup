## My Mac Setup

This repo contains info on all the apps / tools / settings I use on my Mac.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [What Macbook do I have?](#what-macbook-do-i-have)
- [OS Settings](#os-settings)
  - [Desktop](#desktop)
  - [Finder](#finder)
  - [Dock](#dock)
- [Homebrew](#homebrew)
  - [Homebrew](#homebrew-1)
- [Quick Launching](#quick-launching)
  - [RayCast Homebrew Plugin](#raycast-homebrew-plugin)
- [Window Management](#window-management)
- [Menu Bar Utilities](#menu-bar-utilities)
  - [Hidden Bar](#hidden-bar)
- [Other Apps I Use Daily](#other-apps-i-use-daily)
  - [Docker](#docker)
- [Node.js](#nodejs)
  - [Global Modules](#global-modules)
- [VS Code](#vs-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What Macbook do I have?

I am using a 2023 14" Macbook Pro.

The specs for both machines:

- 2023
  - Apple M3 Pro
- 18GB RAM
- 1TB SSD

Read more about these Macbooks here:

- [2023](https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-m3-pro-12-core-cpu-18-core-gpu-14-late-2023-specs.html)

## OS Settings

These are my preferred settings for `Desktop`, `Finder` and the `Dock`.

### Desktop

I don't like the new Desktop, Stage Manager or Widget features in Sequoia, so I disable them.

- System Preferences
  - Desktop & Dock
    - Desktop & Stage Manager
      - Show Items
        - On Desktop -> uncheck
        - In Stage Manager -> uncheck
      - Click wallpaper to reveal desktop -> Always
      - Stage Manager -> uncheck
        - Show recent apps in stage manager -> check
      - Widgets
        - On Desktop -> check
        - In Stage Manager -> uncheck
      - Default Web browser -> Google Chrome

### Finder

- Finder -> Settings
  - General -> Show these on the desktop -> Select None
    - I try to keep my desktop completely clean.
  - General -> New Finder windows show -> Home Folder
    - I prefer to see my home folder in each new finder window instead of recent documents
  - Advanced -> Show all filename extensions -> Yes
  - Advanced -> Show warning before changing an extension -> No
  - Advanced -> When performing a search -> Search the current folder
- View
  - Show Status Bar
  - Show Path Bar

### Dock

I don't use the Dock at all. It takes up screen space, and I can use RayCast to launch apps and AltTab to switch between apps. I make the dock as small as possible and auto hide it.

- System Preferences
  - Desktop & Dock
    - Size -> Small as possible
    - Position on screen -> Bottom
    - Automatically hide and show the Dock -> Yes
    - Animate opening applications -> No
    - Show suggested and recent apps in the Dock -> Yes

## Homebrew

### Homebrew

[Homebrew](https://brew.sh/) allows us to install tools and apps from the command line.

To install it, open up the built in `Terminal` app and run this command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This will also install the xcode build tools which is needed by many other developer tools.

After Homebrew is done installing, we will use it (via RayCast) to install everything else we need.

## Quick Launching

I recently switched to [RayCast](https://www.raycast.com/) as my spotlight replacement and app launcher.

```sh
brew install raycast
```

You can import settings into RayCast from the [RayCast Config](./raycast-config/) folder. It will be password protected, and the password will be stored in the password manager.

### RayCast Homebrew Plugin

Install the [RayCast Homebrew Plugin](https://www.raycast.com/nhojb/brew) so we can easily install formulae and casks directly from RayCast.

## Window Management

RayCast has this feature built in.

## Menu Bar Utilities

### Hidden Bar

If you have several apps running that have menu bar icons, [Hidden Bar](https://github.com/dwarvesf/hidden) will let you choose which ones should be hidden after a timeout. This cleans things up if you have a ton of background apps running.

Search for `hiddenbar` in RayCast `brew search` or:

```sh
brew install hiddenbar
```

## Other Apps I Use Daily

I've broken up the apps that I use daily into text files `brew-casks.txt` and `brew-formulae.txt` for easy management and installation.

You can install them in one go by placing them all into a text file and then running brew install:

```sh
# This installs all the apps listed in `brew-casks` and `brew-formulaes` listed by new line

cat brew-casks.txt brew-formulae.txt | xargs -n 1 brew install
```

```sh
# or you can install them one file at a time.

xargs brew install < brew-casks.txt
xargs brew install < brew-formulae.txt
```

### Docker

This will be installed as a part of the Other Apps I Use Daily list.

There are multiple results when you search `docker` within `brew`. To install Docker desktop:

```sh
brew install docker
```

## Node.js

I use nvm to manage the installed versions of Node.js on my machine. This allows me to easily switch between Node.js versions depending on the project I'm working in.

See installation instructions [here](https://github.com/nvm-sh/nvm#installing-and-updating).

OR run this command (make sure v0.40.1 is still the latest)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Now that nvm is installed, you can install a specific version of node.js and use it:

```sh
nvm install 22
nvm use 22
node --version
```

### Global Modules

There are a few global node modules I use a lot:

- gitignore
  - Auto generate `.gitignore` files base on the current project type

```
npm install -g gitignore
```

## VS Code

VS Code is my preferred code editor. It will be installed via brew above.

You can view all of my VS Code settings / extensions [here](https://github.com/djshubs/vscode-settings).
