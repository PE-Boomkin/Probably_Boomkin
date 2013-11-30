-- Custom Balance Druid Rotation v0.1
-- Updated on Nov 29th

ProbablyEngine.rotation.register_custom(102, "Boomkin", {

-- Pause Rotation
{ "pause", "modifier.lalt" },

-- Focus Macro
{ "!/focus [target=mouseover]", "modifier.lcontrol" },

-- Barkskin
{ "22812", "modifier.rcontrol" },

-- Renew
{ "108238", "player.health <= 30" },

-- Rejuvenation 
{ "774", {
	"toggle.rejuve",
	"!player.buff(774)",
	"player.health <= 90"
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
{ "106737", {
	"player.spell(106737).exists",
	"player.buff(16886)",
	"player.buff(137590)",
	"player.spell(106737).charges >= 1"
}}, -- Treants
}, "modifier.cooldowns" },
  

-- Starsurge
{ "78674" },

-- Dots Moonfire/Sunfire
{ "8921", { 
	"target.debuff(8921).duration < 2",
	"!target.debuff(145832)",
	"!target.debuff(145171)",
	"!target.debuff(145065)",
	"!target.debuff(145071)"
}},
{ "93402", { 
	"target.debuff(93402).duration < 2",
	"!target.debuff(145832)",
	"!target.debuff(145171)",
	"!target.debuff(145065)",
	"!target.debuff(145071)"
}},
{ "8921", { 
	"mouseover.debuff(8921).duration < 2",
	"!mouseover.debuff(145832)",
	"!mouseover.debuff(145171)",
	"!mouseover.debuff(145065)",
	"!mouseover.debuff(145071)",
	"modifier.multitarget"
}, "mouseover" },
{ "93402", { 
	"mouseover.debuff(93402).duration < 2",
	"!mouseover.debuff(145832)",
	"!mouseover.debuff(145171)",
	"!mouseover.debuff(145065)",
	"!mouseover.debuff(145071)",
	"modifier.multitarget"
}, "mouseover" },
{ "8921", { 
	"focus.debuff(8921).duration < 2",
	"!focus.debuff(145832)",
	"!focus.debuff(145171)",
	"!focus.debuff(145065)",
	"!focus.debuff(145071)"
}, "focus" },
{ "93402", { 
	"focus.debuff(93402).duration < 2",
	"!focus.debuff(145832)",
	"!focus.debuff(145171)",
	"!focus.debuff(145065)",
	"!focus.debuff(145071)"
}, "focus" },

-- Force of Nature - Trash
{ "106737", {
	"player.buff(16886)",
	"player.spell(106737).charges >= 2",
	"!modifier.cooldowns"
}},

-- Dots Moonfire/Sunfire and Starsurge Movement
{ "78674", "player.moving" },
{ "8921", {
	"player.balance.moon",
	"player.moving",
	"!target.debuff(145832)",
	"!target.debuff(145171)",
	"!target.debuff(145065)",
	"!target.debuff(145071)"
}},
{ "93402", {
	"player.balance.sun",
	"player.moving",
	"!target.debuff(145832)",
	"!target.debuff(145171)",
	"!target.debuff(145065)",
	"!target.debuff(145071)"
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

})