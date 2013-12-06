local boomkin = { }

function boomkin.garroshMC(unit)
        if UnitExists(unit) then
                if UnitDebuff(unit,GetSpellInfo(145832))
                        or UnitDebuff(unit,GetSpellInfo(145171))
                        or UnitDebuff(unit,GetSpellInfo(145065))
                        or UnitDebuff(unit,GetSpellInfo(145071))
                then return false else return true end
        else return false end
end

function boomkin.interruptEvents(unit)
  if UnitBuff("player", 31821) then return true end -- Devo
  if not unit then unit = "boss1" end
  local spell = UnitCastingInfo(unit)
  local stop = false
  if spell == GetSpellInfo(138763) then stop = true end
  if spell == GetSpellInfo(137457) then stop = true end
  if spell == GetSpellInfo(143343) then stop = true end -- Thok
  if stop then
    if UnitCastingInfo("player") or UnitChannelInfo("player") then
      RunMacroText("/stopcasting")
      return false
    end
  end
  return true
end

ProbablyEngine.library.register("boomkin", boomkin)