-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Wlk. Chapeau +1",
    body="Dls. Tabard +1",
    hands="Dusk Gloves +1",
    legs="Nashira Seraweels",
    feet="Dusk Ledelsens +1",
    neck="Orochi Nodowa +1",
    waist="Ninurta's Sash",
    left_ear="Merman's Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Tiphia Sting",
    head="Maat's Cap",
    body="Morrigan's Robe",
    hands="Morrigan's Cuffs",
    legs="Hydra Brais",
    feet="Rutter Sabatons",
    neck="Fotia Gorget",
    waist="Warwolf Belt",
    left_ear="Hollow Earring",
    right_ear="Brutal Earring",
    left_ring="Strigoi Ring",
    right_ring="Mars's Ring",
    back="Cerb. Mantle +1",}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Sturm's Report",
    head="Maat's Cap",
    body="Morrigan's Robe",
    hands="Morrigan's Cuffs",
    legs="Valkyrie's Trews",
    feet="Dls. Boots +1",
    neck="Fotia Gorget",
    waist="Salire Belt",
    left_ear="Moldavite Earring",
    right_ear="Novio Earring",
    left_ring="Galdr Ring",
    right_ring="Tamas Ring",
    back="Gramary Cape",}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Chatoyant Staff",
    sub="Vivid Strap +1",
    ammo="White Tathlum",
    head="Maat's Cap",
    body="Dls. Tabard +1",
    hands="Bricta's Cuffs",
    legs="Wlk. Tights +1",
    feet="Morrigan's Pgch.",
    neck="Fylgja Torque +1",
    waist="Pythia Sash +1",
    left_ear="Roundel Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Celestial Ring",
    back="Dew Silk Cape +1",}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Atrophy Chapeau +1",neck="Colossus's Torque",
        body="Vitivation Tabard",hands="Atrophy Gloves +1",ring1="Prolix Ring",
        back="Estoqueur's Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Estoqueur's Houseaux +2"}

    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}

    sets.midcast.Stoneskin = { main="Mistilteinn",
    sub="Muse Tariqah",
    ammo="White Tathlum",
    head="Maat's Cap",
    body="Mahatma Hpl.",
    hands="Stone Mufflers",
    legs="Mahatma Slops",
    feet="Morrigan's Pgch.",
    neck="Stone Gorget",
    waist="Pythia Sash +1",
    left_ear="Celestial Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Celestial Ring",
    back="Dew Silk Cape +1",}
    
    sets.midcast['Enfeebling Magic'] = {main="Alkalurops",
    sub="Vivid Strap +1",
    ammo="Sturm's Report",
    head="Dls. Chapeau +1",
    body="Wlk. Tabard +1",
    hands="Bricta's Cuffs",
    legs="Nashira Seraweels",
    feet="Morrigan's Pgch.",
    neck="Enfeebling Torque",
    waist="Salire Belt",
    left_ear="Enfeebling Earring",
    right_ear="Celestial Earring",
    left_ring="Karka Ring",
    right_ring="Balrahn's Ring",
    back="Altruistic Cape",}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {main="Chatoyant Staff",
    sub="Vivid Strap +1",
    ammo="Sturm's Report",
    head="Wlk. Chapeau +1",
    body="Morrigan's Robe",
    hands="Morrigan's Cuffs",
    legs="Valkyrie's Trews",
    feet="Goliard Clogs",
    neck="Uggalepih Pendant",
    waist="Witch Sash",
    left_ear="Moldavite Earring",
    right_ear="Novio Earring",
    left_ring="Galdr Ring",
    right_ring="Tamas Ring",
    back="Merciful Cape",}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Weike Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
    sub="Vivid Strap +1",
    ammo="Hedgehog Bomb",
    head="Dls. Chapeau +1",
    body="Mahatma Hpl.",
    hands="Hydra Gloves",
    legs="Yigit Seraweels",
    feet="Goliard Clogs",
    neck="Uggalepih Pendant",
    waist="Duelist's Belt",
    left_ear="Relaxing Earring",
    right_ear="Loquac. Earring",
    left_ring="Celestial Ring",
    right_ring="Celestial Ring",
    back="Invigorating Cape",}
    

    -- Idle sets
    sets.idle = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Dls. Chapeau +1",
    body="Dalmatica +1",
    hands="Dst. Mittens +1",
    legs="Goliard Trews",
    feet="Dst. Leggings +1",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}

    sets.idle.Town = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Dls. Chapeau +1",
    body="Dalmatica +1",
    hands="Dst. Mittens +1",
    legs="Goliard Trews",
    feet="Dst. Leggings +1",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}
    
    sets.idle.Weak = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Dls. Chapeau +1",
    body="Dalmatica +1",
    hands="Dst. Mittens +1",
    legs="Goliard Trews",
    feet="Dst. Leggings +1",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}

    sets.idle.PDT = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Dls. Chapeau +1",
    body="Dalmatica +1",
    hands="Dst. Mittens +1",
    legs="Goliard Trews",
    feet="Dst. Leggings +1",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}

    sets.idle.MDT = {main="Terra's Staff",
    sub="Vivid Strap +1",
    ammo="Fenrir's Stone",
    head="Dls. Chapeau +1",
    body="Dalmatica +1",
    hands="Dst. Mittens +1",
    legs="Goliard Trews",
    feet="Dst. Leggings +1",
    neck="Orochi Nodowa +1",
    waist="Lieutenant's Sash",
    left_ear="Merman's Earring",
    right_ear="Colossus's Earring",
    left_ring="Defending Ring",
    right_ring="Succor Ring",
    back="Umbra Cape",}
    
    
    -- Defense sets
    sets.defense.PDT = {
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Blood Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main="Excalibur",
    sub="Kraken Club",
    ammo="Tiphia Sting",
    head="Walahra Turban",
    body="Hydra Doublet",
    hands="Dusk Gloves +1",
    legs="Nashira Seraweels",
    feet="Dusk Ledelsens +1",
    neck="Ancient Torque",
    waist="Ninurta's Sash",
    left_ear="Hollow Earring",
    right_ear="Brutal Earring",
    left_ring="Sniper's Ring +1",
    right_ring="Mars's Ring",
    back="Cuchulain's Mantle",}

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4)
    end
end

