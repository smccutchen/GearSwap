 
function get_sets()
 
    -- idle set: auto-refresh, movement speed, damage reduction
   sets.idle = {
        main={ name="Emissary", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+20','"Refresh"+1',}},
        sub="Culminus",
        ammo="Pemphredo Tathlum",
        head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1",
        legs="Crimson Cuisses",
        feet="Jhakri Pigaches +1",
        neck="Eddy Necklace",
        waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear="Hermetic Earring",
        left_ring="Shadow Ring",
        right_ring="Sheltered Ring",
        back="Shadow Mantle",
   }

    -- fast cast set:  We put this on before the spell is begun, then switch to one of the other sets during cast.
   sets.fc = {
        main={ name="Emissary", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+20','"Refresh"+1',}},
        sub="Culminus",
        ammo="Sapience Orb",
        head="Atro. Chapeau +1",
        body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
        hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+6','VIT+6','Mag. Acc.+14',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
        neck="Weike Torque",
        waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear="Estq. Earring",
        left_ring="Weather. Ring",
        right_ring="Prolix Ring",
        back="Swith Cape +1",
   }

    -- nuke set: +MAB and Int.
   sets.nuke = {
        main={ name="Grioavolr", augments={'Magic burst dmg.+6%','INT+10','Mag. Acc.+11','"Mag.Atk.Bns."+25',}},
		sub="Elder's Grip +1",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +10%','Mag. Acc.+10','"Mag.Atk.Bns."+15',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic Damage +15','INT+4','Mag. Acc.+8','"Mag.Atk.Bns."+7',}},
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs="Gyve Trousers",
		feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
		neck="Eddy Necklace",
		waist="Refoccilation Stone",
		left_ear="Friomisi Earring",
		right_ear="Sortiarius Earring",
        left_ring="Weather. Ring",
		right_ring="Shiva Ring +1",
		back="Toro Cape",
   }

    -- enfeebling set: +Enfeebling Skill and MACC
   sets.enfeebling = {
        main="Arendsi Fleuret",
        sub="Culminus",
        ammo="Pemphredo Tathlum",
        head="Leth. Chappel +1",
        body="Lethargy Sayon +1",
        hands="Leth. Gantherots",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Vitiation Boots +1", augments={'Enhances "Paralyze II" effect',}},
        neck="Weike Torque",
        waist="Ovate Rope",
        left_ear="Lifestorm Earring",
        right_ear="Psystorm Earring",
        left_ring="Globidonta Ring",
        right_ring="Stikini Ring",
        back={ name="Sucellos's Cape", augments={'MND+10','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+4','"Fast Cast"+10',}},
   }

    -- enhancing set: +Enhancing Skill and Mind.
   sets.enhancing = {
        main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','MND+9','Mag. Acc.+13','"Mag.Atk.Bns."+12','Magic Damage +1',}},
        sub="Enki Strap",
        ammo="Hydrocera",
        head="Befouled Crown",
        body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
        hands="Atrophy Gloves +2",
        legs="Atrophy Tights +1",
        feet="Leth. Houseaux +1",
        neck="Melic Torque",
        waist="Luminary Sash",
        left_ear="Lifestorm Earring",
        right_ear="Psystorm Earring",
        left_ring="Weather. Ring",
        right_ring="Sheltered Ring",
        back={ name="Sucellos's Cape", augments={'MND+10','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+4','"Fast Cast"+10',}},       
   }

    -- heal set: +Cure Potency and Mind.
   sets.heal = {
        main={ name="Tamaxchi", augments={'Occ. atk. twice+8','"Regen"+3',}},
        sub="Sors Shield",
        ammo="Hydrocera",
        head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        body={ name="Kaykaus Bliaut", augments={'MP+60','"Cure" potency +5%','"Conserve MP"+6',}},
        hands={ name="Kaykaus Cuffs", augments={'MP+60','"Conserve MP"+6','"Fast Cast"+3',}},
        legs={ name="Kaykaus Tights", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        feet={ name="Kaykaus Boots", augments={'Mag. Acc.+15','"Cure" potency +5%','"Fast Cast"+3',}},
        neck="Nodens Gorget",
        waist="Acerbic Sash +1",
        left_ear="Roundel Earring",
        right_ear="Estq. Earring",
        left_ring="Stikini Ring",
        right_ring="Sirona's Ring",
        back="Pahtli Cape",
   }

    -- dark set: +Dark Skill, MACC, and Int.
   sets.dark = {
        main={ name="Grioavolr", augments={'Magic burst dmg.+6%','INT+10','Mag. Acc.+11','"Mag.Atk.Bns."+25',}},
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head={ name="Merlinic Hood", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +10%','Mag. Acc.+10','"Mag.Atk.Bns."+15',}},
        body="Shango Robe",
        hands="Ea Cuffs",
        legs="Ea Slops",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+11%','CHR+7','Mag. Acc.+15','"Mag.Atk.Bns."+5',}},
        neck="Erra Pendant",
        waist="Yamabuki-no-Obi",
        left_ear="Abyssal Earring",
        right_ear="Estq. Earring",
        left_ring="Evanescence Ring",
        right_ring="Archon Ring",
        back="Toro Cape",
   }

    -- resting set: as much +hMP as possible.
   sets.rest = {
       
   }

    -- our convert set swaps a lot of HP for MP in order to get our max HP and MP as close as possible so that we get the most out of convert.
   sets.convert = {
       ammo        = "Hedgehog Bomb",
       head        = "Zenith Crown +1",
       body        = "Dalmatica +1",
       hands       = "Zenith Mitts +1",
       left_ring   = "Celestial Ring",
       right_ring  = "Celestial Ring",
       legs        = "Mahatma Slops",
       feet        = "Zenith Pumps +1"
   }
    
    -- weapons for melee stance
   sets.melee = {
        --main={ name="Colada", augments={'"Store TP"+4','STR+5','Accuracy+21','Attack+7',}},
        main="Joyeuse",
        sub="Thuellaic Ecu +1",
   }
    
    -- gear for melee stance: haste, accuracy, attack
   sets.engaged = {
        ammo="Ginsen",
        head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
        body="Atrophy Tabard +1",
        hands="Jhakri Cuffs +1",
        legs="Limbo Trousers",
        feet="Jhakri Pigaches +1",
        neck="Weike Torque",
        waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear="Estq. Earring",
        left_ring="Sheltered Ring",
        right_ring="Archon Ring",
        back="Xucau Mantle",
   }
    
   -- weapon skill set
    sets.ws = {
        
   }
    
end

--[[ ******************************************************
 Equip functions - put on the sets we defined above, and
echo a note to our chat log so we know it worked.
****************************************************** --]]

-- all of our equip set macros for RDM must consider whether
-- we have just converted.  we want to keep on our HP-to-MP
-- gear until we use the extra MP.  Otherwise it's wasted!
-- this equips our idle set.
function equip_idle()
    if melee then
       windower.add_to_chat(8,'[Idle - Melee]')
       equip(sets.idle,sets.melee)
   elseif converted then
       windower.add_to_chat(8,'[Idle - Convert]')
       equip(sets.idle,sets.convert)
   else
        windower.add_to_chat(8,'[Idle]')
       equip(sets.idle)
   end
end

-- equip our hMP set for /heal
function equip_rest()
    windower.add_to_chat(8,'[Resting]')
   equip(sets.rest)
end

-- equip our fast cast set
function equip_fc()
   if converted then
       equip(sets.fc,sets.convert)
   else
        equip(sets.fc)
   end
end

-- equip our enhancing set
function equip_enhancing(spell)
    if converted then
       windower.add_to_chat(8,'[Enhancing - Convert]')
       equip(sets.enhancing,sets.convert)
    else     
        -- modify stoneskin   
        if spell.name == 'Stoneskin' then
            windower.add_to_chat(8,'[Enhancing - Stoneskin]')
            equip(sets.enhancing,{
                    neck="Nodens Gorget",
                    head="Umuthi Hat",
                    waist="Siegel Sash"})
        else
            -- modify refresh
            if spell.name == 'Refresh' or spell.name == 'Refresh II' or spell.name == 'Refresh III' then
                windower.add_to_chat(8,'[Enhancing - Refresh]')
                equip(sets.enhancing,{legs="Leth. Fuseau +1"})
            else
                -- modify phalanx
                if spell.name == 'Phalanx' or spell.name == 'Phalanx II' then
                    windower.add_to_chat(8,'[Enhancing - Phalanx]')
                    equip(sets.enhancing,{
                        main="Egeking",
                        sub="Thuellaic Ecu +1"})
                else
                    -- equip base enhancing set
                    equip(sets.enhancing)
                    windower.add_to_chat(8,'[Enhancing]')
                end
            end
        end
    end
end

-- equip our enfeebling set
function equip_enfeebling()
    if converted then
       windower.add_to_chat(8,'[Enfeebling - Convert]')
       equip(sets.enfeebling,sets.convert)
   else
        windower.add_to_chat(8,'[Enfeebling]')
       equip(sets.enfeebling)
   end
end

-- equip our nuke set. if weather or day matches
-- the spell element, put on hachirin-no-obi
function equip_nuke(spell)
    if spell.element == world.day_element then
       windower.add_to_chat(8,'[Nuke - on matching day]')
       equip(sets.nuke,{waist="Hachirin-no-Obi"})
   elseif spell.element == world.weather_element then
       windower.add_to_chat(8,'[Nuke - with matching weather]')
       equip(sets.nuke,{waist="Hachirin-no-Obi"})
   else
        windower.add_to_chat(8,'[Nuke]')
       equip(sets.nuke)
   end
end

-- equip our healing magic set
function equip_heal()
    if converted then
       windower.add_to_chat(8,'[Healing - Convert]')
       equip(sets.heal,sets.convert)
   else
        windower.add_to_chat(8,'[Healing]')
       equip(sets.heal)
   end
end

-- equip our Dark Magic set
function equip_dark()
    windower.add_to_chat(8,'[Dark]')
   equip(sets.dark)
end

-- equip our engaged set
function equip_engaged()
   windower.add_to_chat(8,'[Engaged]')
   equip(sets.engaged)
end

-- equip our ws set
function equip_ws()
   windower.add_to_chat(8,'[WS]')
   equip(sets.ws)
end

-- a catchall equip function that puts on the correct set
-- whether we are engaged or idle, in melee mode or not
function choose_set()
   if player.status == "Engaged" then
       equip_engaged()
   else
        equip_idle()
   end
end

--[[ ******************************************************
 Casting functions - these functions run automatically when
we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]

-- the precast function runs automatically BEFORE we
-- begin casting a spell or job ability.  For our RDM,
-- we use this function primarily to set some status
-- variables to indicate we've entered "converted" mode,
-- which will last until we spend the extra MP.
-- also throws on our fast cast gear for spells.
function precast(spell)
    if converted and player.mp < 804 then
       converting = false
       converted = false
   end
    if spell.name == 'Convert' then
       if not converting then
           converting = true
           windower.add_to_chat(8,'[Convert]')
           cancel_spell()
           equip(sets.convert)
           send_command('wait .5;input /ja Convert <me>')
       else
            converting = false
           converted = true
       end
    elseif (spell.type:contains('Magic') or spell.type:contains('Ninjutsu')) then
       equip_fc()
   elseif spell.type == 'WeaponSkill' then
       equip_ws()
   end
end

-- midcast, we put on our potency gear depending on
-- the type of spell being cast.
function midcast(spell)
    if spell.skill == 'Healing Magic' then
       equip_heal()
   elseif spell.skill == 'Enfeebling Magic' then
       equip_enfeebling()
   elseif spell.skill == 'Enhancing Magic' then
       equip_enhancing(spell)
   elseif spell.skill == 'Elemental Magic' then
       equip_nuke(spell)
   elseif spell.skill == 'Dark Magic' then
       equip_dark()
   end
end

-- after we finish our spell or ability, return to our
-- idle set.
function aftercast(spell)
    if not converting then
       choose_set()
   end
end

-- as usual, we use the status_change function to swap in
-- hMP gear when we rest, and remove it when we stand,
-- engaged set when engaged, and idle when not.
function status_change(new,old)
    if new == 'Resting' then
       equip_rest()
   else
        choose_set()
   end
end

-- the self_command function can be called from
-- a Yush or in-game macro.  I call this function
-- from a keybind in my Yush file, to swap into
-- melee stance.  While in this stance we lock our
-- weapons so that gearswaps won't cause us to lose
-- any TP we might have.
function self_command(m)
    if m == "M" then
       if melee == false then
           melee = true
           choose_set()
           disable('main')
           disable('sub')
       else
            melee = false
           enable('main')
           enable('sub')
           choose_set()
       end
    end
end

--[[ ******************************************************
 Code that runs once, when we first swap to our RDM job
****************************************************** --]]

-- these variables indicate whether we're in the middle of
-- converting, or have already converted and need to stay in
-- our HP to MP gear until we exhaust our extra MP.
converting = false
converted = false
melee = false

-- equip and lockstyle our idle set
send_command('wait 1;gs equip idle;wait 1;input /lockstyle on')