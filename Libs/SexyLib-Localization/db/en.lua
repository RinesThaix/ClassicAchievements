if not SexyLib:IsLocalizationPresent('Sexy Lib') then
    SexyLib:InitLocalization('Sexy Lib', {
        localization_not_present = 'For addon %s there is no localization key %s.'
    })
end