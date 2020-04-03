local sounds = {
    yes = {
        "bot/ct_affirm.wav",
        "bot/roger.wav"
    },
    whileattack = {
        "bot/fireassis.wav"
    }, 
    imhit = {
        "bot/hitassist.wav",
        "bot/backup.wav",
        "bot/imhit.wav"
    },
    enemyspotted = {
        "bot/ct_enemys.wav"
    },
    start = {
        "bot/letsgo.wav",
        "bot/locknload.wav",
        "bot/moveout.wav",
        "bot/sticktog.wav"
    }, 
    reportin = {
        "bot/reportin.wav"
    },
    reportingin = {
        "bot/reportingin.wav"
    },
    afterattack = {
        "bot/regroup.wav",
        "bot/enemydown.wav",
        "bot/clear.wav"
    },
    throwgrenade = {
        "bot/ct_fireinhole.wav"
    }
}

function getSoundByType(type)
    return sounds[type][math.random(1, #sounds[type])]
end

local Meta = FindMetaTable("Player")

function Meta:emitSoundByType(type, volume)
    self:EmitSound(getSoundByType(type), volume)
end