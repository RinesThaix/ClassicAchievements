# SexyLib-Localization

## Overview
This is a module that allows you to easily implement localizations for your addon.

## Requirements
- **SexyLib-Core** is required.

## Usage

`SexyLib:InitLocalization(addonName, db)` - create new localization.
- `addonName` - name of the addon that you want to localize.
- `db` - database of localizations.

`SexyLib:IsLocalizationPresent(addonName)` - check whether localization for given addon was created.
- `addonName` - name of the addon you want to check for localization.

`SexyLib:Localization(addonName)` - retrieve localization for the given addon.
- `addonName` - name of the addon for which you want to get localization.

`localization:Add(db)` - add additional localizations.
- `db` - table of additional localizations.

`localization:IsPresent(key)` - check whether localization for given key exists.
- `key` - localization key.

`localization:GetRaw(key)` - get "raw" localization for the given key. If it doesn't exist, nil will be returned and error message will be sent to the logger.
- `key` - localization key.

`localization:Get(key, ...)` - get exact localization for the given key and formatting arguments.
- `key` - localization key.
- `...` - formatting arguments if localization is supposed to be a pattern for formatting.