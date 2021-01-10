# SexyLib-Network

## Overview
This is a module that allows you to easily work with addon-messages inside your addon.

### Channels
Whilst using this module, you can create various channels for you addon, each of them can have own handler, ingame-channel filter (i.e. you can make channel working only with `GUILD`/`WHISPER`).

### Callbacks
You can not only send some data to other users of your addon, but also send network-callbacks, which can respond with callbacks.

## Requirements
- **SexyLib-Core** is required.
- **LibStub** is required.
- **AceSerializer-3.0** is required.
- **AceComm-3.0** is required.
- **AceAddon-3.0** is required.
- **LibCompress** is required.
- **SexyLib-Localization** is optional, but recommended.

## Usage

`SexyLib:InitNetwork(addonName, prefixLength, defaultCallbacksTimeout, blacklistCheckingFunc)` - creates new network API instance to work from your addon.
- `addonName` - name of your addon.
- `prefixLength` - to minimize the traffic sent, there's a limitation in design of this module that requires you to specify maximum length of your channel names. This argument is exactly that value.
- `defaultCallbacksTimeout` - defaults to 2 (seconds); for how much time senders of callbacks without specified timeout will wait for any response.
- `blacklistCheckingFunc` - function that receives playerName and must return true whether network shall ignore any network packets from the given player. Defaults to nil (so there's no blacklisting at all).

`SexyLib:Network(addonName)` - retrieve network API instance for the given addon.
- `addonName` - name of the addon for which you're willing to retrieve network API instance.

`network:NewChannel(channelPrefix, ingameChannel, func)` - register new channel within your network.
- `channelPrefix` - unique name of your channel. Must be of length you specified with network API instance initialization. You may not use channel name consisting only of zeroes.
- `ingameChannel` - defaults to nil; whether you want to limit this channel by specific ingame-channel only, pass it there.
- `func` - handler for any messages that're being received via this channel. Function that accepts the following arguments:
  - `sender` - nickname of the player that sent the message.
  - `data` - data of the message itself.
  - `callbackID` - equals to zero whether message received doesn't await any response back. Otherwise can be used for responsing (read below).
  - `ingameChannel` - ingame-channel from which this message came.

`network:Send(techChannel, ingameChannel, target, data, messageType)` - send network message.
- `techChannel` - name of your channel to which message will be sent.
- `ingameChannel` - ingame-channel to which message will be sent.
- `target` - if previous argument is set to `WHISPER`, this is a field to pass a player name; otherwise it must be nil.
- `data` - data of the message itself.
- `messageType` - defaults to `BULK`. Can be one of `BULK`, `NORMAL`, `ALERT`. If you need more information about this field, there's nothing more than a reading on the Internet.

`network:SendWithCallback(techChannel, target, data, callback, timeout, timeoutHandler)` - send network message with callback. There's no ingame-channel specification, because you can send data with callback only via whispering.
- `techChannel` - name of your channel to which message will be sent.
- `target` - nickname of the received of your message.
- `data` - data of the message itself.
- `callback` - function that will be executed once response is received. Accepts the following arguments:
  - `sender` - nickname of the player that sent the response.
  - `data` - data of the response message.
- `timeout` - amount of time (in seconds) for which you will wait a response. Defaults to the value passed with this network API instance initialization.
- `timeoutHandler` - function without any arguments that will be executed whether timeout for response awaiting happened. Defaults to nil.

`network:ResponseCallback(target, data, callbackID)` - send a response to received message that awaits it. Must be used within channel's message handlers.
- `target` - nickname of the response receiver.
- `data` - data of the response message.
- `callbackID` - argument that is being passed to the channel's message handler.