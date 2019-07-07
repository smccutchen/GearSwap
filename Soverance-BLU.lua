include('organizer-lib')

function get_sets()
    TP_Index = 1
    Idle_Index = 1

    
    ta_hands = {name="Adhemar Wristbands +1"}
    acc_hands = {name="Adhemar Wristbands +1"}
    wsd_hands = {name="Meg. Gloves +1",}
    crit_hands = {name="Adhemar Wristbands +1"}
    dt_hands = { name="Herculean Gloves", augments={'Accuracy+30','Damage taken-4%','STR+9','Attack+4',}}
    waltz_hands = { name="Herculean Gloves", augments={'Accuracy+22','"Waltz" potency +11%','STR+9',}}
    
    sets.weapons = {}
    sets.weapons[1]={
        main="Tizona",
        sub="Almace",
    }
    sets.weapons[2]={
        
    }
    
    sets.JA = {}
    sets.JA['Azure Lore'] = {hands=""}
    sets.JA.Steal = {
        ammo="Barathrum",neck="Pentagalus Charm",hands="Thief's Kote",
        waist="Key Ring Belt",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
    sets.JA.Flee = {feet="Pillager's Poulaines +1"}
    sets.JA.Despoil = {ammo="Barathrum",legs="Raider's Culottes +2",feet="Skulker's Poulaines"}
--    sets.JA.Mug = {head="Assassin's Bonnet +2"}
    sets.JA.Waltz = {head="Anwig Salade",
        neck="Unmoving Collar +1",
        body="Passion Jacket",
        hands=waltz_hands,
        ring1="Valseur's Ring",
        ring2="Carbuncle Ring +1",
        waist="Aristo Belt",
        legs="Desultor Tassets",
        feet="Dance Shoes"
    }
    
    sets.WS = {
        ammo="Ginsen",
        head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Crit.hit rate+3','DEX+9','Accuracy+11','Attack+11',}},
        body="Abnoba Kaftan",
        hands="Jhakri Cuffs +2",
        legs={ name="Herculean Trousers", augments={'Attack+17','Weapon skill damage +4%','AGI+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+27','Weapon skill damage +3%',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Apate Ring",
        right_ring="Petrov Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+2','Weapon skill damage +10%',}},
    }

    sets.WS.Expiacion = {
        ammo="Ginsen",
        head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Crit.hit rate+3','DEX+9','Accuracy+11','Attack+11',}},
        body="Abnoba Kaftan",
        hands="Jhakri Cuffs +2",
        legs={ name="Herculean Trousers", augments={'Attack+17','Weapon skill damage +4%','AGI+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+27','Weapon skill damage +3%',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Apate Ring",
        right_ring="Petrov Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+2','Weapon skill damage +10%',}},
    }
        
    TP_Set_Names = {"Accuracy","Attack","Delay Cap","DT"}
    sets.TP = {}
        
    sets.TP['Accuracy'] = {
        ammo="Falcon Eye",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
        hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet={ name="Adhemar Gamashes", augments={'DEX+10','AGI+10','Accuracy+15',}},
        neck="Clotharius Torque",
        waist="Windbuffet Belt +1",
        left_ear="Heartseeker Earring",
        right_ear="Dudgeon Earring",
        left_ring="Ramuh Ring +1",
        right_ring="Petrov Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10',}},
    }

    sets.TP['Attack'] = {
        ammo="Hasty Pinion +1",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
        hands={ name="Taeon Gloves", augments={'Attack+24','"Dual Wield"+4','Crit. hit damage +2%',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},
        neck="Asperity Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Steelflash Earring",
        right_ear="Bladeborn Earring",
        left_ring="Epona's Ring",
        right_ring="Apate Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10',}},
    }
        
    sets.TP['Delay Cap'] = {
        ammo="Seething Bomblet +1",
        head="Adhemar Bonnet",
        body="Adhemar Jacket +1",
        hands=ta_hands,
        legs="Mummu Kecks +1",
        feet={ name="Herculean Boots", augments={'Accuracy+25','"Triple Atk."+4','DEX+10',}},
        neck="Lissome Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}},
    }
               
    sets.TP['DT'] = {
        ammo="Staunch Tathlum",
        head="Aya. Zucchetto +1",
        body="Mekosu. Harness",
        hands={ name="Herculean Gloves", augments={'Accuracy+7','DEX+6','Quadruple Attack +1','Accuracy+19 Attack+19',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet="Aya. Gambieras +1",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Solemnity Cape",
    }
    
    Idle_Set_Names = {'Normal','DT',"STP"}
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo="Ginsen",
        head="Hashishin Kavuk +1",
        body="Mekosu. Harness",
        hands="Jhakri Cuffs +2",
        legs="Blood Cuisses",
        feet="Jhakri Pigaches +2",
        neck="Clotharius Torque",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Digni. Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dbl.Atk."+10',}},
    }
                
    sets.Idle.DT = {
        ammo="Staunch Tathlum",
        head="Aya. Zucchetto +1",
        body="Mekosu. Harness",
        hands="Jhakri Cuffs +2",
        legs="Blood Cuisses",
        feet="Jhakri Pigaches +2",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Solemnity Cape",
    }
    
    sets.Idle['STP'] = {
        main="Vajra",
        sub="Twashtar",
        ammo="Ginsen",
        head="Meghanada Visor +1",
        body={ name="Herculean Vest", augments={'Accuracy+21','Crit. hit damage +5%','DEX+9',}},
        hands="Adhemar Wristbands +1",
        legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
        feet="Skd. Jambeaux +1",
        neck="Combatant's Torque",
        waist="Goading Belt",
        left_ear="Telos Earring",
        right_ear="Digni. Earring",
        left_ring="Apate Ring",
        right_ring="Rajas Ring",
        back={ name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}},
    }
    
    -- this command sets the default macro book/set when loading this file
    send_command('input /macro book 2;wait .1;input /macro set 1')
    
        
    sets.FastCast = {
        ammo="Impatiens",
        head={ name="Herculean Helm", augments={'"Fast Cast"+6','Mag. Acc.+2',}},
        body={ name="Taeon Tabard", augments={'Accuracy+22','"Fast Cast"+5','Crit. hit damage +3%',}},
        hands="Leyline Gloves",
        legs="Enif Cosciales",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+4',}},
        neck="Orunmila's Torque",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
        left_ring="Rahab Ring",
        right_ring="Weather. Ring +1",
    }
        
    sets.frenzy = {head="Frenzy Sallet"}
    
end

function precast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    elseif spell.type=="WeaponSkill" then
        if sets.WS[spell.english] then equip(sets.WS[spell.english]) end
        if buffactive['sneak attack'] and buffactive['trick attack'] and sets.WS.SATA[spell.english] then equip(sets.WS.SATA[spell.english])
        elseif buffactive['sneak attack'] and sets.WS.SA[spell.english] then equip(sets.WS.SA[spell.english])
        elseif buffactive['trick attack'] and sets.WS.TA[spell.english] then equip(sets.WS.TA[spell.english]) end
    elseif string.find(spell.english,'Waltz') then
        equip(sets.JA.Waltz)
    elseif spell.action_type == "Magic" then
        equip(sets.FastCast)
    end
end

-- this function runs after an action has taken place
function aftercast(spell)
    if player.status=='Engaged' then
        equip(sets.TP[TP_Set_Names[TP_Index]])
    else
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
    elseif new == 'Engaged' then
        equip(sets.TP[TP_Set_Names[TP_Index]])
    end
end

function buff_change(buff,gain_or_loss)
    if buff=="Sneak Attack" then
        soloSA = gain_or_loss
    elseif buff=="Trick Attack" then
        soloTA = gain_or_loss
    -- if hp is greater than 99 and you're hit with sleep, equip the frenzy sallet to wake yourself up
    elseif gain_or_loss and buff == 'Sleep' and player.hp > 99 then
        print('putting on Frenzy sallet!')
        equip(sets.frenzy)
    end
end

-- with an in-game macro, you can call these commands on key press by adding the following line to the macro list:
-- /console gs c cycle TP set
-- /console gs c cycle Idle set
-- press the macro again to cycle through set indexes
function self_command(command)
    if command == 'cycle TP set' then
        TP_Index = TP_Index +1
        if TP_Index > #TP_Set_Names then TP_Index = 1 end
        send_command('@input /echo ----- TP Set changed to '..TP_Set_Names[TP_Index]..' -----')
        equip(sets.TP[TP_Set_Names[TP_Index]])
    elseif command == 'cycle Idle set' then
        Idle_Index = Idle_Index +1
        if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
    end
end