-- Custom Balance Druid Rotation v0.1
-- Updated on Nov 29th

ProbablyEngine.rotation.register_custom(102, "Boomkin", {

-- Force Moonkin Form - In Combat
{ "!/cancelform", {
	"toggle.moonkin",
	"player.seal = 1"
}},

{ "!/cancelform", {
	"toggle.moonkin",
	"player.seal = 3"
}},

{ "24858", {
	"toggle.moonkin",
	"!player.seal = 5"
}},

-- Pause Rotation
{ "pause", "modifier.lalt" },

-- Pause Rotation - Bear Form
{ "pause", "player.seal = 1" },

-- Pause Rotation - Cat Form
{ "pause", "player.seal = 3" },

-- Focus Macro
{ "!/focus [target=mouseover]", "modifier.lcontrol" },

-- Barkskin
{ "22812", "modifier.rcontrol" },

-- Heart of the Wild + Tranq Modifier (Keep this held till Tranquility casts)
{{
{ "108288", "player.spell(108288).exists" },
{ "740" },
}, "modifier.rshift" },

-- Renewal
{ "108238", {
	"player.spell(108238).exists",
	"player.health <= 30"
}},

-- Rejuvenation 
{ "774", {
	"toggle.rejuve",
	"!player.buff(774)",
	"player.health <= 90"
}},

-- Cenarion Ward
{ "Cenarion Ward", { 
	"player.spell(108238).exists",
	"player.health <= 75" 
}},

-- Healthstone
-- {"#5512", "player.health <= 45"},

-- Hurricane At Mouseover Modifier
{ "16914", "modifier.lshift", "ground" },

-- Starfall
{ "48505", {
	"!player.buff(48505)"
}},

-- Cooldowns
{{
{ "106731", "player.spell(106731).exists" }, -- Incarnation
{ "112071" }, -- Celestial Alignment
{ "26297", "player.spell(26297).exists" }, -- Berserking
{ "110621", "player.spell(110621).exists" }, -- Mirror Images
{ "106737", {
	"player.spell(106737).exists",
	"player.buff(16886)",
	"player.buff(137590)",
	"player.spell(106737).charges >= 1"
}}, -- Treants
}, "modifier.cooldowns" },
  
-- Moonfire Redot Celestial End
{ "8921", {
	"player.buff(112071)",
	"player.buff(112071).duration < 2",
	"@boomkin.garroshMC(target)"
}},

-- Starsurge
{ "78674" },

-- Dots Moonfire/Sunfire
{ "8921", { 
	"target.debuff(8921).duration < 2",
	"@boomkin.garroshMC(target)"
}},
{ "93402", { 
	"target.debuff(93402).duration < 2",
	"@boomkin.garroshMC(target)"
}},
{ "8921", { 
	"mouseover.debuff(8921).duration < 2",
	"@boomkin.garroshMC",
	"modifier.multitarget"
}, "mouseover" },
{ "93402", { 
	"mouseover.debuff(93402).duration < 2",
	"@boomkin.garroshMC",
	"modifier.multitarget"
}, "mouseover" },
{ "8921", { 
	"focus.debuff(8921).duration < 2",
	"@boomkin.garroshMC"
}, "focus" },
{ "93402", { 
	"focus.debuff(93402).duration < 2",
	"@boomkin.garroshMC"
}, "focus" },

-- Force of Nature - Trash
{ "106737", {
	"player.spell(106737).exists",
	"player.buff(16886)",
	"player.spell(106737).charges >= 2",
	"!modifier.cooldowns"
}},

-- Dots Moonfire/Sunfire and Starsurge Movement
{ "78674", "player.moving" },
{ "8921", {
	"player.balance.moon",
	"player.moving",
	"@boomkin.garroshMC(target)"
}},
{ "93402", {
	"player.balance.sun",
	"player.moving",
	"@boomkin.garroshMC(target)"
}},

 -- Starfire/Wrath
{ "2912", {
	"player.buff(112071)",
	"@boomkin.interruptEvents(target)"
}},
{ "2912", {
	"player.balance.sun",
	"@boomkin.interruptEvents(target)"
}},
{ "5176", {
	"player.balance.moon",
	"!player.buff(112071)",
	"@boomkin.interruptEvents(target)"
}},

}, {

-- Focus Macro - Out of Combat
{ "!/focus [target=mouseover]", "modifier.lcontrol" },

}, function()
ProbablyEngine.toggle.create('rejuve', 'Interface\\Icons\\spell_nature_rejuvenation', 'Rejuvenation', 'Toggle Rejuvenation')
ProbablyEngine.toggle.create('moonkin', 'Interface\\Icons\\spell_nature_forceofnature', 'Moonkin Form - Combat', 'Toggle To Force Moonkin Form - In Combat Only')

end)