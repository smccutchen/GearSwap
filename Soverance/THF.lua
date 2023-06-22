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
        main="Mandau",
        sub="Vajra",
    }
    sets.weapons[2]={
        main="Mandau",
        sub="Vajra",
    }
    
    sets.JA = {}
--    sets.JA.Conspirator = {body="Raider's Vest +2"}
--    sets.JA.Accomplice = {head="Raider's Bonnet +2"}
--    sets.JA.Collaborator = {head="Raider's Bonnet +2"}
    sets.JA['Perfect Dodge'] = {hands="Plun. Armlets +1"}
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
        ammo="Jukukik Feather",
        head="Pill. Bonnet +1",
        body="Abnoba Kaftan",
        hands="Meg. Gloves +1",
        legs={ name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}},
        feet={ name="Plun. Poulaines +1", augments={'Enhances "Assassin\'s Charge" effect',}},
        neck="Caro Necklace",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Ramuh Ring +1",
        right_ring="Petrov Ring",
        back={ name="Toutatis's Cape", augments={'DEX+9','DEX+2','Weapon skill damage +8%',}},
    }
    sets.WS.SA = {}
    sets.WS.TA = {}
    sets.WS.SATA = {}
    
    sets.WS.Evisceration = {
        ammo="Yetshila",
        head="Adhemar Bonnet",
        body="Abnoba Kaftan",
        hands=crit_hands,
        legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
        feet="Adhe. Gamashes +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
        right_ear="Mache Earring +1",
        left_ring="Begrudging Ring",
        right_ring="Ramuh Ring +1",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }

    sets.WS["Rudra's Storm"] = {
        ammo="Jukukik Feather",
        head="Pill. Bonnet +1",
        body="Abnoba Kaftan",
        hands="Meg. Gloves +1",
        legs={ name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}},
        feet={ name="Plun. Poulaines +1", augments={'Enhances "Assassin\'s Charge" effect',}},
        neck="Caro Necklace",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Ramuh Ring +1",
        right_ring="Petrov Ring",
        back={ name="Toutatis's Cape", augments={'DEX+9','DEX+2','Weapon skill damage +8%',}},
    }
        
    sets.WS.SA["Rudra's Storm"] = set_combine(sets.WS["Rudra's Storm"],{
        ammo="Yetshila",
        head="Adhemar Bonnet",
        body={ name="Herculean Vest", augments={'Accuracy+21','Crit. hit damage +5%','DEX+9',}},
        }
    )
        
    sets.WS.TA["Rudra's Storm"] = set_combine(sets.WS["Rudra's Storm"],{
        ammo="Yetshila",
        head="Adhemar Bonnet",
        body={ name="Herculean Vest", augments={'Accuracy+21','Crit. hit damage +5%','DEX+9',}},
        }
    )

    sets.WS["Mercy Stroke"] = {
        ammo="Jukukik Feather",
        head="Pill. Bonnet +1",
        body="Abnoba Kaftan",
        hands="Meg. Gloves +1",
        legs={ name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}},
        feet={ name="Plun. Poulaines +1", augments={'Enhances "Assassin\'s Charge" effect',}},
        neck="Caro Necklace",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Ramuh Ring +1",
        right_ring="Petrov Ring",
        back={ name="Toutatis's Cape", augments={'DEX+9','DEX+2','Weapon skill damage +8%',}},
    }
    
    
    sets.WS["Mandalic Stab"] = sets.WS["Rudra's Storm"]
        
    sets.WS.SA["Mandalic Stab"] = sets.WS.SA["Rudra's Storm"]
        
    sets.WS.TA["Mandalic Stab"] = sets.WS.TA["Rudra's Storm"]

    sets.WS.Exenterator = {
        ammo="Seething Bomblet +1",
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket +1",
        hands=ta_hands,
        right_ring="Ilabrat Ring",
        ring2="Epona's Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
        waist="Fotia Belt",
        legs="Mummu Kecks +1",
        feet="Adhemar Gamashes +1"
    }
        
    TP_Set_Names = {"Accuracy","Treasure Hunter","Evasion","Damage Taken"}
    sets.TP = {}
        
    sets.TP['Accuracy'] = {
        ammo="Ginsen",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body="Pillager's Vest +2",
        hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet={ name="Plun. Poulaines +1", augments={'Enhances "Assassin\'s Charge" effect',}},
        neck="Lissome Necklace",
        waist="Cetl Belt",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Canny Cape", augments={'DEX+1','AGI+3','"Dual Wield"+3','Crit. hit damage +3%',}},
    }    

    sets.TP['Treasure Hunter'] = set_combine(sets.TP['Accuracy'],{
        hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
        feet="Skulker's Poulaines +1",
    })

    sets.TP['Evasion'] = {
        ammo="Yamarang",
        head="Adhemar Bonnet",
        body="Adhemar Jacket +1",
        hands=ta_hands,
        legs="Mummu Kecks +1",
        feet="Adhe. Gamashes +1",
        neck="Combatant's Torque",
        waist="Kasiri Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Canny Cape", augments={'DEX+5','"Dual Wield"+5',}},
    }
               
    sets.TP['Damage Taken'] = {
        ammo="Staunch Tathlum",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body="Mekosu. Harness",
        hands={ name="Buremte Gloves", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','"Fast Cast"+3',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet={ name="Adhemar Gamashes", augments={'DEX+10','AGI+10','Accuracy+15',}},
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Warden's Ring",
        right_ring="Defending Ring",
        back="Archon Cape",
    }
    
    Idle_Set_Names = {'Default','MDT',"STP","Crafting"}
    sets.Idle = {}
    sets.Idle.Default = {
        ammo="Staunch Tathlum",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body="Mekosu. Harness",
        hands={ name="Buremte Gloves", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','"Fast Cast"+3',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet="Jute Boots +1",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle",
    }
                
    sets.Idle.MDT = {
        ammo="Staunch Tathlum",
        head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body="Mekosu. Harness",
        hands={ name="Buremte Gloves", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','"Fast Cast"+3',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Dual Wield"+3','Accuracy+15','Attack+10',}},
        feet="Jute Boots +1",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Archon Cape",
    }
    
    sets.Idle.STP = {
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

    sets.Idle.Crafting = {
        main="Mandau",
        sub="Toreutic Shield",
        ammo="Per. Lucky Egg",
        head="Shaded Specs.",
        body="Goldsmith's Smock",
        hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
        legs="Pill. Culottes +1",
        feet="Jute Boots +1",
        neck="Goldsm. Torque",
        waist="Sailfi Belt",
        left_ear="Jupiter's Pearl",
        right_ear="Jupiter's Pearl",
        left_ring="Orvail Ring",
        right_ring="Craftmaster's Ring",
        back="Archon Cape",
    }
    
    -- this command sets the default macro book/set when loading this file
    send_command('input /macro book 1;wait .1;input /macro set 1')
    
        
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

    sets.Crafting = {
        main="Caduceus",
        sub="Toreutic Shield",
        ammo="Staunch Tathlum",
        head="Shaded Specs.",
        body="Goldsmith's Smock",
        hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
        legs="Pill. Culottes +1",
        feet="Jute Boots +1",
        neck="Goldsm. Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Orvail Ring",
        right_ring="Craftmaster's Ring",
        back="Shadow Mantle",
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