# SexyLib-Core

## Overview
This is a core module you will need to use any other modules of **SexyLib**.

## Requirements
There are no additional requirements.

## Usage

### Logger
`SexyLib:InitLogger(addonName, colorCode)` - create new logger.
- `addonName` - the name of your addon. It will be displayed in chat for any logger messages.
- `colorCode` - color for the name of your addon. `&3` (dark-aqua) by default. All possible color codes could be seen at the end of this section.

`SexyLib:Logger(addonName)` - retrieve logger for the given addon. If logger wasn't initialized, it will be created with the color code of `&c` (red).
- `addonName` - the name of your addon.

`logger.Settings.debug` - whether to display debug messages of this logger.

`logger.Settings.error` - whether to display error messages of this logger.

`logger.Settings.info` - whether to display info messages of this logger.

`logger:LogDebug(message, ...)` - display debug message.
- `message` - the message itself or pattern for formatting.
- `...` - arguments of formatting.

`logger:LogError(message, ...)` - display error message.
- `message` - the message itself or pattern for formatting.
- `...` - arguments of formatting.

`logger:LogInfo(message, ...)` - display info message.
- `message` - the message itself or pattern for formatting.
- `...` - arguments of formatting.

If **SexyLib-Localization** module is present, two additional methods available for the logger. If that module is not present, method still persist in logger structure, but fallback to previous ones. Also, whether localization module is present, there will be a `logger.supportsLocalization` variable set to `true`.

`logger:LogErrorL(messageKey, ...)` - display localized error message.
- `messageKey` - localization key of the message or of the pattern for formatting.
- `...` - arguments of formatting.

`logger:LogInfoL(messageKey, ...)` - display localized info message.
- `messageKey` - localization key of the message or of the pattern for formatting.
- `...` - arguments of formatting.

#### Color codes
You can use them in messages passed to logger (or in translations) and they will be autoconverted into real colors.
- `&a` - green, #00ff00.
- `&6` - golden, #fac414.
- `&e` - yellow, #fff000.
- `&c` - red, #ff0000.
- `&7` - light-gray, #aaaaaa.
- `&3` - dark-aqua, #30d5c8.
- `&r` - code for resetting all colors.

### Util

`SexyLib:Util()` - get utilities of **SexyLib**.

`util:Colorize(text)` - transform all color codes from logger section into actual colors.
- `text` - string in which color codes must be translated.

`util:Format(message, ...)` - colorize given message and apply formatting whether first argument is a pattern for formatting.
- `message` - the message itself or pattern for formatting.
- `...` - arguments of formatting.

`util:Print(message, ...)` - colorize and format given message, print it to the game chat.
- `message` - the message itself or pattern for formatting.
- `...` - arguments of formatting.

`util:Millis(time)` - if argument is not present, returns time value in millis from some random moment, otherwise returns amount of millis passed from the given argument. May be used for time measurements.
- `time` - if it's present, it must be a return value of this function without any arguments.

`util:Explode(strings, delimiter)` - analogue of PHP's explode() function. May not work with some tricky delimiters.
- `strings` - a string that must be exploded.
- `delimiter` - delimiter with which first argument must be exploded.

`util:Implode(strings, delimiter, fromIndex, toIndex)` - analogue of PHP's implode() function.
- `strings` - table of strings that must be imploded (joined).
- `delimiter` - delimiter with which first argument must be imploded.
- `fromIndex` - defaults to 1; index from which strings from first argument must be imploded. Inclusive.
- `toIndex` - defaults to the size of first argument; index to which strings from first argument must be imploded. Inclusive.

`util:FilterPlayerName(playerName)` - filters player name.
- `playerName` - the name of player to be filtered. If not present, returns current player's name.
- `Returns` name of the player without server name and with first character being uppercased, whilst the rest being lowercased.

`util:IsInGuild()` - check whether current player is in guild. Only the first execution of this method actually invokes WoW API. Then result is being cached and invalidates only on reload actions.

`util:FromRadix(num, radix)` - convert number from the given radix to the radix of ten.
- `num` - number in the given radix that must be converted.
- `radix` - current radix of the number.

`util:ToRadix(num, radixTo, radixFrom)` - convert number from one radix to another. Noticeably slower than the previous one.
- `num` - number that must be converted.
- `radixTo` - radix to which number must be converted.
- `radixFrom` - defaults to 10; current radix of the number.

`util:CopyTable(tabl)` - creates a copy of the given table.
- `tabl` - table to be copied.

`util:NewTimer(callback)` - creates new timer.
- `callback` - callback for frame's `OnUpdate` execution.