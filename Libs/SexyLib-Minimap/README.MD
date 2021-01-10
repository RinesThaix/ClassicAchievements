# SexyLib-Minimap

## Overview
This is a module to easily add minimap icon for your addon.

## Requirements
- **SexyLib-Core** is required.

## Usage
`SexyLib:InitMinimap(addonName, iconPath)` - create minimap icon for your addon.
- `addonName` - name of your addon.
- `iconPath` - path to the icon of your minimap icon; defaults to onyxia's head icon.

`SexyLib:Minimap(addonName)` - get minimap API instance for your addon.
- `addonName` - name of your addon.

`minimap:SetTitle(title)` - setup custom title that will be displayed when mouse is hovered over minimap icon for your addon.
- `title` - string or a function that returns string.

`minimap:SetDescription(description)` - setup custom description that will be displayed when mouse is hovered over minimap icon for your addon.
- `description` - table of strings, function that returns table of strings or just a single string (in this case the whole description will be displayed as a single line).

`minimap:SetClickHandler(left, shift, ctrl, handler)` - setup handler that will be called once minimap icon for your addon is clicked.
- `left` - whether you're setting handler for a click made by left mouse button (pass false to handle right mouse button).
- `shift` - whether you're setting handler for a click when shift is being hold.
- `ctrl` - whether you're setting handler for a click when ctrl is being hold.
- `handler` - function without arguments that will be called once click of your specification is performed.