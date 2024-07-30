-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
	include('organizer-lib')

    -- Load and initialize the include file.
    include('Mote-Include.lua')


end

 
function user_setup()
                -- Default macro set/book
        set_macro_page(1, 2)
 
        -- Options: Override default values
        state.OffenseMode:options('Normal', 'Mid', 'Acc')
        state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
        state.CastingMode:options('Normal')
        state.IdleMode:options('Normal', 'Refresh', 'Reraise')
        state.PhysicalDefenseMode:options('PDT')
        state.MagicalDefenseMode:options('MDT')
end
 
 function job_setup()
--    get_combat_weapon()
    gsList = S{'Ragnarok'}
    gaxeList = S{'Bravura'}
 end
-- Define sets and vars used by this job file.
function init_gear_sets()
                --------------------------------------
        -- Start defining the sets
        --------------------------------------
       
        -- Precast Sets
       
        -- Precast sets to enhance JAs

        sets.precast.JA['Berserk'] = {body="Pummeler's Lorica +3", back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, feet= "Agoge Calligae +3"}                    
        sets.precast.JA['Aggressor'] = {body="Agoge Lorica +1"}     
        sets.precast.JA['Warcry'] = {head="Agoge Mask +3"}               
        sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
        sets.buff['Retaliation'] = {hands="Pummeler's Mufflers +1",feet="Boii Calligae"}
        sets.buff['Restraint'] = {hands="Boii Mufflers +1"}

        -- Waltz set (chr and vit)
        sets.precast.Waltz = {
                head="Outrider Mask",neck="Temperance Torque",ear1="Skald Breloque",ear2="Roundel Earring",
                body="Twilight Mail",hands="Outrider Mittens",ring2="Omega Ring",
                waist="Aristo Belt",feet="Chocaliztli Boots"}
               
        -- Don't need any special gear for Healing Waltz.
        sets.precast.Waltz['Healing Waltz'] = {}
 
        -- Fast cast sets for spells
       
        sets.precast.FC = {ear2="Loquacious Earring"}
 
        -- sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
       
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {ammo="Fire Bomblet",
    head="Hecatomb Cap +1",
    body="Hct. Harness +1",
    hands="Hct. Mittens +1",
    legs="Hachiryu Haidate",
    feet="Hct. Leggings +1",
    neck="Fotia Gorget",
    waist="Warrior's Stone",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Rajas Ring",
    back="Cerb. Mantle +1",}

 
        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
       
        -- Midcast Sets
        sets.midcast.FastRecast = {}
               
        -- Specific spells
        sets.midcast.Utsusemi = {}
               

       
        -- Sets to return to when not performing an action.
       
        -- Resting sets
        sets.resting = set_combine(sets.idle, {head="Twilight Helm"})
       
        -- Idle sets
        sets.idle = { ammo="Verthandi's Gem",
    head="Valhalla Helm",
    body="Valhalla Brstplate",
    hands="Dst. Mittens +1",
    legs="Dst. Subligar +1",
    feet="Askar Gambieras",
    neck="Bloodbead Gorget",
    waist="Lieutenant's Sash",
    left_ear="Ethereal Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Shadow Mantle",}

    sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
       

       
        -- Defense sets
        sets.defense.PDT = {}
 
        sets.defense.MDT = {}
 
        sets.Kiting = {feet="Hermes' Sandals +1"}
 
        -- Engaged sets
 
        -- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion


------------------Zadora's Additions------------------

		
--------------Weapon Skill Sets--------------------

    sets.precast.WS['Raging Rush'] = {ammo="Fire Bomblet",
    head="Hecatomb Cap +1",
    body="Hct. Harness +1",
    hands="Hct. Mittens +1",
    legs="Hachiryu Haidate",
    feet="Hct. Leggings +1",
    neck="Fotia Gorget",
    waist="Warrior's Stone",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Rajas Ring",
    back="Cerb. Mantle +1",}


    sets.precast.WS['Rampage'] = {ammo="Fire Bomblet",
    head="Hecatomb Cap +1",
    body="Hct. Harness +1",
    hands="Hct. Mittens +1",
    legs="Hachiryu Haidate",
    feet="Hct. Leggings +1",
    neck="Fotia Gorget",
    waist="Warrior's Stone",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Rajas Ring",
    back="Cerb. Mantle +1",}
    
	--sets.precast.WS['Upheaval'].Acc = {}

    sets.precast.WS['Ukko\'s Fury'] = {ammo="Fire Bomblet",
    head="Hecatomb Cap +1",
    body="Hct. Harness +1",
    hands="Hct. Mittens +1",
    legs="Hachiryu Haidate",
    feet="Hct. Leggings +1",
    neck="Fotia Gorget",
    waist="Warrior's Stone",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Rajas Ring",
    back="Cerb. Mantle +1",}
	

    sets.precast.WS['Full Break'] = {}
    
	sets.precast.WS["Ukko's Fury"].Acc = {}

    sets.precast.WS['Steel Cyclone'] = {}
    sets.precast.WS['Steel Cyclone'].Mid = {}
    sets.precast.WS['Steel Cyclone'].Acc = {}

    sets.precast.WS["King's Justice"] = {ammo="Fire Bomblet",
    head="Hecatomb Cap +1",
    body="Hct. Harness +1",
    hands="Hct. Mittens +1",
    legs="Hachiryu Haidate",
    feet="Hct. Leggings +1",
    neck="Fotia Gorget",
    waist="Warrior's Stone",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Rajas Ring",
    back="Cerb. Mantle +1",}
    sets.precast.WS["King's Justice"].Mid = {}
    sets.precast.WS["King's Justice"].Acc = {}



---------------Great Sword------------------------		
    sets.precast.WS['Resolution'] =   {ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body="Rav. Breastplate",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
   feet="Pumm. Calligae +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Resolution'].Mid =	{}
   
		
        -- Normal melee group
    sets.engaged = { ammo="Fire Bomblet",
    head="Walahra Turban",
    body="Askar Korazin",
    hands="Dusk Gloves +1",
    legs="Ares' Flanchard",
    feet="Ucn. Leggings +1",
    neck="Fortitude Torque",
    waist="Ninurta's Sash",
    left_ear="Hollow Earring",
    right_ear="Brutal Earring",
    left_ring="Blitz Ring",
    right_ring="Rajas Ring",
    back="Cuchulain's Mantle",}
    
	--Conqueror
	sets.engaged.Mid = {ammo="Fire Bomblet",
    head="Walahra Turban",
    body="Armada Hauberk",
    hands="Dusk Gloves +1",
    legs="Byakko's Haidate",
    feet="Ucn. Leggings +1",
    neck="Fortitude Torque",
    waist="Ninurta's Sash",
    left_ear="Hollow Earring",
    right_ear="Brutal Earring",
    left_ring="Blitz Ring",
    right_ring="Rajas Ring",
    back="Cuchulain's Mantle",}
    sets.engaged.Acc = {}

    sets.engaged.GreatAxe = set_combine(sets.engaged,
        {})
    sets.engaged.GreatAxe.Mid = set_combine(sets.engaged.Mid,
        {})
    sets.engaged.GreatAxe.Acc = set_combine(sets.engaged.Acc,
        {})

    sets.engaged.GreatSword = set_combine(sets.engaged,
        {})
    sets.engaged.GreatSword.Mid = set_combine(sets.engaged.Mid,
        {})
    sets.engaged.GreatSword.Acc = set_combine(sets.engaged.Acc,
        {})



end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 function job_precast(spell, action, spellMap, eventArgs)
     custom_aftermath_timers_precast(spell)
 end

 function job_aftercast(spell, action, spellMap, eventArgs)
    custom_aftermath_timers_aftercast(spell)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
    end
 end

 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
-- function job_update(cmdParams, eventArgs)

-- --    get_combat_weapon()
--     display_current_job_state(eventArgs)
-- end
 
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
-- function display_current_job_state(eventArgs)
--         local defenseString = ''
--         if state.DefenseMode.value then
--                 local defMode = state.Defense.PhysicalMode
--                 if state.Defense.Type == 'Magical' then
--                         defMode = state.Defense.MagicalMode
--                 end
 
--                 defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
--         end
 
--         add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..', WS: '..state.WeaponskillMode..', '..defenseString..
--                 'Kiting: '..on_off_names[state.Kiting])
 
 
--         eventArgs.handled = true
-- end

--function get_combat_weapon()
--    if gsList:contains(player.equipment.main) then
--        state.CombatWeapon:set("GreatSword")
--    elseif gaxeList:contains(player.equipment.main) then
--        state.CombatWeapon:set("GreatAxe")
--    else 
--        state.CombatWeapon:reset()
--    end
--end
--Deal with buff state variable eventually!!!!!!!!!!!!!!
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
    -- body
end
--Custom Aftermath timer function called from job_aftercast
function custom_aftermath_timers_precast(spell)
    if spell.type == 'WeaponSkill' then
        info.aftermath = {}

        local am_ws = "Upheaval"
        info.aftermath.weaponskill = am_ws
        info.aftermath.duration = 0
        info.aftermath.level = math.floor(player.tp / 1000)
        if info.aftermath.level == 0 then
            info.aftermath.level = 1
        end

        if spell.english == am_ws and player.equipment.main == 'Chango' then
            if buffactive['Aftermath: Lv.3'] then
                return
            end
            if info.aftermath.level ~= 3 and buffactive['Aftermath: Lv.2'] then
                return
            end
            if info.aftermath.level == 1 then
                info.aftermath.duration = 180
            elseif info.aftermath.level == 2 then
                info.aftermath.duration = 180
            else
                info.aftermath.duration = 180
            end
        end
    end
end

function custom_aftermath_timers_aftercast(spell)
    if not spell.interrupted and spell.type == 'WeaponSkill' and 
        info.aftermath and info.aftermath.weaponskill == spell.english and 
        info.aftermath.duration > 0 then

        local aftermath_name = 'Aftermath: Lv.'..tostring(info.aftermath.level)
        send_command('timers d "Aftermath: Lv.1"')
        send_command('timers d "Aftermath: Lv.2"')
        send_command('timers d "Aftermath: Lv.3"')
        send_command('timers c "'..aftermath_name..'" '..tostring(info.aftermath.duration)..' down abilities/aftermath'..tostring(info.aftermath.level)..'.png')

        info.aftermath = {}
    end
end
---Make rule for Custom Day/Night gear!!!!!!!!!!!
--if world.time >= (18*60) or world.time <= (6*60) then
--return sets.NightSet
--else
--return sets.DaySet
--end