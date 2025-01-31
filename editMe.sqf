/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Attacker Waves */

// List_Bandits, List_ParaBandits, List_OPFOR, List_INDEP, List_NATO, List_Viper
HOSTILE_LEVEL_1 = List_Bandits;  // Wave 0 >
HOSTILE_LEVEL_2 = List_OPFOR;    // Wave 5 >
HOSTILE_LEVEL_3 = List_Viper;    // Wave 10 >


//HOSTILE_LEVEL_0 = List_Tier0;    // Wave 0 >
//HOSTILE_LEVEL_1 = List_Tier1;    // Wave 5 >
//HOSTILE_LEVEL_2 = List_Tier2;    // Wave 10 >
//HOSTILE_LEVEL_3 = List_Tier3;    // Wave 15 >

HOSTILE_MULTIPLIER = ("HOSTILE_MULTIPLIER" call BIS_fnc_getParamValue);  // How many hostiles per wave (waveCount x HOSTILE_MULTIPLIER)
HOSTILE_TEAM_MULTIPLIER = ("HOSTILE_TEAM_MULTIPLIER" call BIS_fnc_getParamValue) / 100;   // How many extra units are added per player
PISTOL_HOSTILES = ("PISTOL_HOSTILES" call BIS_fnc_getParamValue);  //What wave enemies stop only using pistols

// List_LocationMarkers, List_AllCities
BULWARK_LOCATIONS = List_AllCities;
BULWARK_RADIUS = ("BULWARK_RADIUS" call BIS_fnc_getParamValue);
BULWARK_MINSIZE = ("BULWARK_MINSIZE" call BIS_fnc_getParamValue);   // Spawn room must be bigger than x square metres
BULWARK_LANDRATIO = ("BULWARK_LANDRATIO" call BIS_fnc_getParamValue);
LOOT_HOUSE_DENSITY = ("LOOT_HOUSE_DENSITY" call BIS_fnc_getParamValue);

PLAYER_STARTWEAPON = if ("PLAYER_STARTWEAPON" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTMAP    = if ("PLAYER_STARTMAP" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTNVG    = if ("PLAYER_STARTNVG" call BIS_fnc_getParamValue == 1) then {true} else {false};

/* Respawn */
RESPAWN_TIME = ("RESPAWN_TIME" call BIS_fnc_getParamValue);
RESPAWN_TICKETS = ("RESPAWN_TICKETS" call BIS_fnc_getParamValue);

/* Loot Blacklist */
LOOT_BLACKLIST = [
    "CUP_item_Money",
    "CUP_item_item_Money",
    "Land_Money_F",
    "EvMoney",
    "CUP_item_Moscow_Bombing_File",
    "CUP_item_item_Moscow_Bombing_File"
];

/* Loot Spawn */
LOOT_WEAPON_POOL    = List_AllWeapons - LOOT_BLACKLIST;    // Classnames of Loot items as an array
LOOT_APPAREL_POOL   = List_AllClothes + List_Vests - LOOT_BLACKLIST;
LOOT_ITEM_POOL      = List_Optics + List_Items - LOOT_BLACKLIST;
LOOT_EXPLOSIVE_POOL = List_Mines - LOOT_BLACKLIST;
LOOT_STORAGE_POOL   = List_Backpacks - LOOT_BLACKLIST;

/* Random Loot */
LOOT_HOUSE_DISTRIBUTION = ("LOOT_HOUSE_DISTRIBUTION" call BIS_fnc_getParamValue);  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = ("LOOT_ROOM_DISTRIBUTION" call BIS_fnc_getParamValue);   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.
LOOT_SUPPLYDROP = ("LOOT_SUPPLYDROP" call BIS_fnc_getParamValue) / 100;        // Radius of supply drop
PARATROOP_COUNT = ("PARATROOP_COUNT" call BIS_fnc_getParamValue);
PARATROOP_CLASS = List_NATO;

/* Points */
SCORE_KILL = ("SCORE_KILL" call BIS_fnc_getParamValue);                 // Every kill
SCORE_HIT = ("SCORE_HIT" call BIS_fnc_getParamValue);                   // Every Bullet hit that doesn't result in a kill
SCORE_DAMAGE_BASE = ("SCORE_DAMAGE_BASE" call BIS_fnc_getParamValue);   // Extra points awarded for damage. 100% = SCORE_DAMAGE_BASE. 50% = SCORE_DAMAGE_BASE/2
SCORE_RANDOMBOX = 950;  // Cost to spin the box

/* Comment out or delete the below support items to prevent the player from buying them */

BULWARK_SUPPORTITEMS = [
    [5,    "test",             "v44xblackfish"],
    [800,  "Recon UAV",             "reconUAV"],
    [1685, "Emergency Teleport",   "telePlode"],
    [1950, "Paratroopers",          "paraDrop"],
    [3525, "Predator Drone",    "droneControl"],
    [4850, "Mind Control Gas",    "mindConGas"],
    [5430, "Missle CAS",           "airStrike"],
    [5930, "Rage Stimpack",         "ragePack"],
    [6666, "ARMAKART TM",           "armaKart"],
    [6942, "Mine Cluster Shell",   "mineField"]
];

/* Objects the Player can buy */

/* Radius prevents hostiles walking through objects and triggers Zombies to attack the object */

/*  Price -Display Name -                    Class Name -                      Rotation When Bought -    Object Radius (meters) *prevents AI glitching through object and triggers suicide bombers*/
BULWARK_BUILDITEMS = [
    [25,      "Long Plank (8m)",             "Land_Plank_01_8m_F",                0,                      4],
    [50,      "Wood Ramp",                   "FootBridge_30_ACR",                 0,                      4],
    [50,      "Junk Barricade",              "Land_Barricade_01_4m_F",            0,                    1.5],
    [50,      "Small Ramp (1m)",             "Land_Obstacle_Ramp_F",            180,                    1.5],
    [75,      "Czech Hedgehog",              "Land_CzechHedgehog_01_new_F",      45,                      3],
    [100,     "Short Sandbag Wall",          "Land_SandbagBarricade_01_half_F",   0,                    1.5],
    [150,     "Sandbag Barricade Hole",      "Land_SandbagBarricade_01_hole_F",   0,                    1.5],
    [150,     "Sandbag Barricade Wall",      "Land_SandbagBarricade_01_F",        0,                    1.5],
    [250,     "Tall Concrete Wall",          "Land_Mil_WallBig_4m_battered_F",    0,                      3],
    [250,     "Portable Light",              "Land_PortableLight_double_F",     180,                      1],
    [400,     "Explosive Barrel",            "plp_ct_ServiceBarrelFlamm",         0,                      1],
    [650,     "H-Barrier (5-blocks)",        "Land_HBarrier_5_F",                 0,                      3],
    [750,     "Ladder",                      "Land_PierLadder_F",                 0,                      1],
    [800,     "Storage box small",           "Box_NATO_Support_F",                0,                      1],
    [950,     "Stairs",                      "Land_GH_Stairs_F",                180,                      4],
    [1000,    "Hallogen Lamp",               "Land_LampHalogen_F",               90,                      1],
    [1000,    "Double H Barrier",            "Land_HBarrierWall4_F",              0,                      4],
    [1000,    "Concrete Platform",           "BlockConcrete_F",                   0,                      8],
    [1000,    "Concrete Ramp",               "Land_RampConcrete_F",               0,                      8],
    [1200,    "Storage box large",           "Box_NATO_AmmoVeh_F",                0,                      1],
    [2500,    "DShKM",                       "rhsgref_ins_DSHKM",                 0,                      1],
    [3000,    "Small Bunker",                "Land_BagBunker_Small_F",          180,                      3],
    [3500,    "Static Machine Gun (raised)", "B_HMG_01_high_F",                   0,                      1],
    [5000,    "Patrol Tower",                "Land_Cargo_Patrol_V3_F",          180,                      0],
    [5000,    "H-Barrier Watchtower",        "Land_HBarrierTower_F",            180,                      5],
    [10000,   "Cargo Tower",                 "Land_Cargo_Tower_V2_F",           180,                      0]
];

/* Time of Day*/
DAY_TIME_FROM = ("DAY_TIME_FROM" call BIS_fnc_getParamValue);
DAY_TIME_TO = ("DAY_TIME_TO" call BIS_fnc_getParamValue);

// Check for sneaky inverted configuration. FROM should always be before TO.
if (DAY_TIME_FROM > DAY_TIME_TO) then {
    DAY_TIME_FROM = DAY_TIME_TO - 2;
};

/* Starter MediKits */
BULWARK_MEDIKITS = ("BULWARK_MEDIKIT" call BIS_fnc_getParamValue);
