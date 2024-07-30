-------------------------------------------------------------------------------------------------------------------
-- Lau's Custom ERA BLM Lua -- Based on 75 Cap Private Server --
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
		Ctrl + = Cycles through the available treasure hunter modes.
		Ctrl + F11 Toggles Resistance & Normal Sets.
		Ctrl + F12 Toggles Idle Sets.
		Alt + Tilde Toggles Magic Burst On/Off

	Treasure hunter modes:
        None - Will never equip TH gear.
        Tag - Will equip Lotus Katana along with Elemental Magic skill gear everytime Magic is cast.
--]]

-- Initialization function for this job file --

function get_sets()
    mote_include_version = 2

    sets.obi = {
        Fire = {waist="Karin Obi"},
        Earth = {waist="Dorin Obi"},
        Water = {waist="Suirin Obi"},
        Wind = {waist="Furin Obi"},
        Ice = {waist="Hyorin Obi"},
        Lightning = {waist="Rairin Obi"},
        Light = {waist="Korin Obi"},
        Dark = {waist="Anrin Obi"}}

    sets.staff = {
        Fire = {main="Fire Staff"},
        Earth = {main="Earth Staff"},
        Water = {main="Water Staff"},
        Wind = {main="Wind Staff"},
        Ice = {main="Aquilo's Staff"},
        Lightning = {main="Jupiter's Staff"},
        Light = {main="Light Staff"},
        Dark = {main="Pluto's Staff"}}

    sets.grips = {
        Fire = {sub="Fire Grip"},
        Earth = {sub="Earth Grip"},
        Water = {sub="Water Grip"},
        Wind = {sub="Wind Grip"},
        Ice = {sub="Ice Grip"},
        Lightning = {sub="Thunder Grip"},
        Light = {sub="Light Grip"},
        Dark = {sub="Dark Grip"}}

    sets.tonban = {
        legs="Sorcerer's Tonban"}

    sets.boots = {
        feet="Marabout Sandals"}

    -- Load and initialize the include file --
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent -- state.Buff vars initialized here will automatically be tracked --

function job_setup()
    include('Mote-TreasureHunter')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job -- Recommend that these be overridden in a sidecar file --
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent -- Can override this function in a sidecar file --

function user_setup()
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'Nuke','NukeRes', 'Dark', 'Debuff', 'Enfeeb', 'Show')
    state.MagicBurst = M(false, 'Magic Burst')

    -- Additional local binds --
    send_command('bind ^= gs c cycle TreasureMode')
    send_command('bind ^` gs c toggle MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change) --

function user_unload()
    send_command('unbind ^`')
    send_command('unbind ^=')
end

-- Define sets and vars used by this job file --

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets --
    --------------------------------------

    ---- Precast Set ----

    sets.precast.FC = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps",
		back= "Veela Cape",}

    ---- Yellowing Set ----

    sets.precast.FC['Elemental Magic'] = {main="Terra's Staff",
    sub="Earth Grip",
    ammo="Tiphia Sting",
    head="Zenith Crown +1",
    body="Dalmatica +1",
    hands="Zenith Mitts +1",
    legs="Zenith Slacks +1",
    feet="Zenith Pumps +1",
    left_ear="Astral Earring",
    right_ring="Serket Ring",
    back="Ixion Cape",}

    ---- Precast Shadows ----

    sets.precast.FC.Utsusemi = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}

    ---- Midcast Sets ----

    sets.TreasureHunter = {
        main="Lotus Katana",
        hands="Wizard's Gloves +1",
        neck="Lemegeton medallion +1",
        ammo="Sturm's Report"}

    sets.midcast.Utsusemi = {
        head="Walahra Turban",
        ear1="Loquacious Earring",
        body="Nashira Manteel",
        feet="Rostrum Pumps"}

    sets.midcast.Cure = {
        main="Chatoyant Staff",sub="Raptor Leather Strap +1",
        body="Nashira Manteel",
        head="Walahra Turban",
        hands="Bricta's Cuffs",
        back="Altruistic Cape",
        legs="Mahatma Slops",
        ring1="Star Ring",
        ring2="Tamas Ring",
        ear1="Celestial Earring",
        ear2="Static Earring",
        feet="Mahatma Pigaches",
        ammo="Phtm. Tathlum",
        neck="Fylgja Torque +1",
        waist="Witch Sash"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        main="Chatoyant Staff",sub="Raptor Leather Strap +1",
        head="Walahra Turban",
        hands="Bricta's Cuffs",
        body="Nashira Manteel",
        back="Merciful Cape",
        legs="Mahatma Slops",
        ring1="Snow Ring",
        ring2="Tamas Ring",
        ear1="Loquacious Earring",
        ear2="Static Earring",
        ammo="Phtm. Tathlum",
        feet="Genie Huaraches",
        neck="Faith Torque",
        waist="Penitent's Rope"}

    sets.midcast.Stoneskin = {main="Alkalurops",
    sub="Vivid Strap +1",
    ammo="Verthandi's Gem",
    head="Maat's Cap",
    body="Mahatma Hpl.",
    hands="Bricta's Cuffs",
    legs="Morrigan's Slops",
    feet="Morrigan's Pgch.",
    neck="Stone Gorget",
    waist="Pythia Sash +1",
    left_ear="Celestial Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Tamas Ring",
    back="Ixion Cape",}

    sets.midcast.IntEnfeebles =  { main="Alkalurops",
    sub="Vivid Strap +1",
    ammo="Verthandi's Gem",
    head="Genie Tiara",
    body="Wzd. Coat +1",
    hands="Oracle's Gloves",
    legs="Genie Lappas",
    feet="Valkyrie's Clogs",
    neck="Enfeebling Torque",
    waist="Witch Sash",
    left_ear="Enfeebling Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Balrahn's Ring",
    back="Altruistic Cape",}

    sets.midcast.MndEnfeebles =  { main="Alkalurops",
    sub="Vivid Strap +1",
    ammo="Verthandi's Gem",
    head="Genie Tiara",
    body="Wzd. Coat +1",
    hands="Oracle's Gloves",
    legs="Genie Lappas",
    feet="Valkyrie's Clogs",
    neck="Enfeebling Torque",
    waist="Witch Sash",
    left_ear="Enfeebling Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Balrahn's Ring",
    back="Altruistic Cape",}

    sets.midcast.ElementalEnfeeble = {
    main="Alkalurops",
    sub="Vivid Strap +1",
    ammo="Phtm. Tathlum",
    head="Maat's Cap",
    body="Mahatma Hpl.",
    hands="Valkyrie's Cuffs",
    legs="Morrigan's Slops",
    feet="Goliard Clogs",
    neck="Prudence Torque",
    waist="Sorcerer's Belt",
    left_ear="Abyssal Earring",
    right_ear="Phtm. Earring +1",
    left_ring="Galdr Ring",
    right_ring="Tamas Ring",
    back="Ixion Cape",}

    sets.midcast['Dark Magic'] = { main="Chatoyant Staff",
    sub="Dark Grip",
    range="Aureole",
    head="Maat's Cap",
    body="Nashira Manteel",
    hands="Src. Gloves +1",
    legs="Wzd. Tonban +1",
    feet="Genie Huaraches",
    neck="Dark Torque",
    waist="Salire Belt",
    left_ear="Abyssal Earring",
    right_ear="Dark Earring",
    left_ring="Omega Ring",
    right_ring="Balrahn's Ring",
    back="Merciful Cape",}

    -- Nuking Sets -- Ctrl + F11 Toggles Resistance & Normal Sets --

    sets.midcast['Elemental Magic'] = {main="Chatoyant Staff",
    sub="Vivid Strap +1",
    range="Aureole",
    head="Maat's Cap",
    body="Morrigan's Robe",
    hands="Morrigan's Cuffs",
    legs="Valkyrie's Trews",
    feet="Goliard Clogs",
    neck="Lmg. Medallion +1",
    waist="Salire Belt",
    left_ear="Moldavite Earring",
    right_ear="Novio Earring",
    left_ring="Galdr Ring",
    right_ring="Sorcerer's Ring",
    back="Ixion Cape",}

    sets.midcast['Elemental Magic'].Resistant = {
    main="Chatoyant Staff",
    sub="Vivid Strap +1",
    range="Aureole",
    head="Src. Petasos +1",
    body="Morrigan's Robe",
    hands="Wzd. Gloves +1",
    legs="Morrigan's Slops",
    feet="Goliard Clogs",
    neck="Lmg. Medallion +1",
    waist="Witch Sash",
    left_ear="Moldavite Earring",
    right_ear="Novio Earring",
    left_ring="Galdr Ring",
    right_ring="Sorcerer's Ring",
    back="Ixion Cape",}

    -- Resting Set --

    sets.resting = {
    main="Chatoyant Staff",
    sub="Vivid Strap +1",
    range="Aureole",
    head="Oracle's Cap",
    body="Mahatma Hpl.",
    hands="Oracle's Gloves",
    legs="Yigit Seraweels",
    feet="Goliard Clogs",
    neck="Gnole Torque",
    waist="Qiqirn Sash +1",
    left_ear="Magnetic Earring",
    right_ear="Relaxing Earring",
    left_ring="Celestial Ring",
    right_ring="Celestial Ring",
    back="Invigorating Cape",}

    -- Idle Set --

    sets.idle = {
    main="Terra's Staff",
    sub="Vivid Strap +1",
    range="Aureole",
    head="Genie Tiara",
    body="Dalmatica +1",
    hands="Merman's Bangles",
    legs="Goliard Trews",
    feet="Herald's Gaiters",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}

    -- Ctrl + F12 Toggles -- To show people my sets. --

    sets.idle.Refresh = {}

    sets.idle.Enfeeb =  {}

    sets.idle.Debuff = {}

    sets.idle.Dark = {}

    sets.idle.Nuke = {}

    sets.idle.NukeRes = {}

    sets.idle.Show = {}


    -- Magic Burst Set -- Alt + Tilde Toggles Magic Burst On/Off --

    sets.magicburst = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events --
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done --

-- Run after the general precast() is done.

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == "Magic" then
        equip(sets.staff[spell.element])
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
        if spell.element == world.weather_element then
            equip(sets.staff[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' and world.day_element == 'Fire' then
        equip(sets.boots)
    end
    if spell.action_type == "Magic" and state.TreasureMode.value == 'Tag' then
        equip(sets.TreasureHunter)
        equip(sets.grips[spell.element])
    end
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magicburst)
    end
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element then
            equip(sets.tonban)
    end
	if spell.skill == 'Elemental Magic' then
			if player.mpp < 51 then
			equip {neck="Uggalepih Pendant"}			
    end
	if spell.skill == 'Dark Magic' and world.day_element == 'Dark' then
			equip {Main="Diabolos's Pole"}
		end
	end	
end
end

function job_aftercast(spell)
    if spell.english == 'Drain' or spell.english == 'Aspir' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is Ready!!! -------')
    end
    if spell.english == 'Stun' then
        send_command('@wait 37;input /echo ------- '..spell.english..' is Ready!!! -------')
    end
    if spell.english == 'Sleep' or spell.english == 'Sleepga' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 57;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
    elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
        send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 87;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
    end
end

function job_state_change(stateField, newValue, oldValue)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events --
-------------------------------------------------------------------------------------------------------------------

-- gain == true if the buff was gained, false if it was lost --

function job_buff_change(buff, gain)
    if buff == 'Silence' and gain == true then
        send_command('@input /item "Echo Drops" <me>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions --
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping --

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

function display_current_job_state(eventArgs)
    msg = msg .. 'Casting'
    msg = msg .. ':     [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ':     [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-- Function to display the current relevant user state when doing an update --

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job --
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change --

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(5, 1)
    elseif player.sub_job == 'SCH' then
        set_macro_page(5, 1)
    elseif player.sub_job == 'WHM' then
        set_macro_page(5, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(5, 1)
    else
        set_macro_page(5, 1)
    end
end