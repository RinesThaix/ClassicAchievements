if SexyLib.Localization and not SexyLib:Localization('Sexy Lib'):IsPresent('network_error_packet_decompression') then
    SexyLib:Localization('Sexy Lib'):Add({
        network_error_packet_decompression = 'Could not decompress network packet: %s.',
        network_error_packet_deserialization = 'Could not deserialize network packet.',
        network_error_channel_prefix_length = 'Network channel %s of addon %s has invalid length.'
    })
end