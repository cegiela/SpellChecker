//
//  SpellListItem.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct SpellListItem: Codable {
    let index, name, url: String
}

struct MockSpellList {
    let jsonString = """
{
  "count": 104,
  "results": [
    {
      "index": "druidcraft",
      "name": "Druidcraft",
      "url": "/api/spells/druidcraft"
    },
    {
      "index": "guidance",
      "name": "Guidance",
      "url": "/api/spells/guidance"
    },
    {
      "index": "mending",
      "name": "Mending",
      "url": "/api/spells/mending"
    },
    {
      "index": "produce-flame",
      "name": "Produce Flame",
      "url": "/api/spells/produce-flame"
    },
    {
      "index": "resistance",
      "name": "Resistance",
      "url": "/api/spells/resistance"
    },
    {
      "index": "shillelagh",
      "name": "Shillelagh",
      "url": "/api/spells/shillelagh"
    },
    {
      "index": "animal-friendship",
      "name": "Animal Friendship",
      "url": "/api/spells/animal-friendship"
    },
    {
      "index": "charm-person",
      "name": "Charm Person",
      "url": "/api/spells/charm-person"
    },
    {
      "index": "create-or-destroy-water",
      "name": "Create or Destroy Water",
      "url": "/api/spells/create-or-destroy-water"
    },
    {
      "index": "cure-wounds",
      "name": "Cure Wounds",
      "url": "/api/spells/cure-wounds"
    },
    {
      "index": "detect-magic",
      "name": "Detect Magic",
      "url": "/api/spells/detect-magic"
    },
    {
      "index": "detect-poison-and-disease",
      "name": "Detect Poison and Disease",
      "url": "/api/spells/detect-poison-and-disease"
    },
    {
      "index": "entangle",
      "name": "Entangle",
      "url": "/api/spells/entangle"
    },
    {
      "index": "faerie-fire",
      "name": "Faerie Fire",
      "url": "/api/spells/faerie-fire"
    },
    {
      "index": "fog-cloud",
      "name": "Fog Cloud",
      "url": "/api/spells/fog-cloud"
    },
    {
      "index": "goodberry",
      "name": "Goodberry",
      "url": "/api/spells/goodberry"
    },
    {
      "index": "healing-word",
      "name": "Healing Word",
      "url": "/api/spells/healing-word"
    },
    {
      "index": "jump",
      "name": "Jump",
      "url": "/api/spells/jump"
    },
    {
      "index": "longstrider",
      "name": "Longstrider",
      "url": "/api/spells/longstrider"
    },
    {
      "index": "purify-food-and-drink",
      "name": "Purify Food and Drink",
      "url": "/api/spells/purify-food-and-drink"
    },
    {
      "index": "speak-with-animals",
      "name": "Speak with Animals",
      "url": "/api/spells/speak-with-animals"
    },
    {
      "index": "thunderwave",
      "name": "Thunderwave",
      "url": "/api/spells/thunderwave"
    },
    {
      "index": "animal-messenger",
      "name": "Animal Messenger",
      "url": "/api/spells/animal-messenger"
    },
    {
      "index": "barkskin",
      "name": "Barkskin",
      "url": "/api/spells/barkskin"
    },
    {
      "index": "darkvision",
      "name": "Darkvision",
      "url": "/api/spells/darkvision"
    },
    {
      "index": "enhance-ability",
      "name": "Enhance Ability",
      "url": "/api/spells/enhance-ability"
    },
    {
      "index": "find-traps",
      "name": "Find Traps",
      "url": "/api/spells/find-traps"
    },
    {
      "index": "flame-blade",
      "name": "Flame Blade",
      "url": "/api/spells/flame-blade"
    },
    {
      "index": "flaming-sphere",
      "name": "Flaming Sphere",
      "url": "/api/spells/flaming-sphere"
    },
    {
      "index": "gust-of-wind",
      "name": "Gust of Wind",
      "url": "/api/spells/gust-of-wind"
    },
    {
      "index": "heat-metal",
      "name": "Heat Metal",
      "url": "/api/spells/heat-metal"
    },
    {
      "index": "hold-person",
      "name": "Hold Person",
      "url": "/api/spells/hold-person"
    },
    {
      "index": "lesser-restoration",
      "name": "Lesser Restoration",
      "url": "/api/spells/lesser-restoration"
    },
    {
      "index": "locate-animals-or-plants",
      "name": "Locate Animals or Plants",
      "url": "/api/spells/locate-animals-or-plants"
    },
    {
      "index": "locate-object",
      "name": "Locate Object",
      "url": "/api/spells/locate-object"
    },
    {
      "index": "moonbeam",
      "name": "Moonbeam",
      "url": "/api/spells/moonbeam"
    },
    {
      "index": "pass-without-trace",
      "name": "Pass Without Trace",
      "url": "/api/spells/pass-without-trace"
    },
    {
      "index": "protection-from-poison",
      "name": "Protection from Poison",
      "url": "/api/spells/protection-from-poison"
    },
    {
      "index": "spike-growth",
      "name": "Spike Growth",
      "url": "/api/spells/spike-growth"
    },
    {
      "index": "call-lightning",
      "name": "Call Lightning",
      "url": "/api/spells/call-lightning"
    },
    {
      "index": "conjure-animals",
      "name": "Conjure Animals",
      "url": "/api/spells/conjure-animals"
    },
    {
      "index": "create-food-and-water",
      "name": "Create Food and Water",
      "url": "/api/spells/create-food-and-water"
    },
    {
      "index": "daylight",
      "name": "Daylight",
      "url": "/api/spells/daylight"
    },
    {
      "index": "dispel-magic",
      "name": "Dispel Magic",
      "url": "/api/spells/dispel-magic"
    },
    {
      "index": "plant-growth",
      "name": "Plant Growth",
      "url": "/api/spells/plant-growth"
    },
    {
      "index": "protection-from-energy",
      "name": "Protection From Energy",
      "url": "/api/spells/protection-from-energy"
    },
    {
      "index": "sleet-storm",
      "name": "Sleet Storm",
      "url": "/api/spells/sleet-storm"
    },
    {
      "index": "speak-with-plants",
      "name": "Speak with Plants",
      "url": "/api/spells/speak-with-plants"
    },
    {
      "index": "water-breathing",
      "name": "Water Breathing",
      "url": "/api/spells/water-breathing"
    },
    {
      "index": "water-walk",
      "name": "Water Walk",
      "url": "/api/spells/water-walk"
    },
    {
      "index": "wind-wall",
      "name": "Wind Wall",
      "url": "/api/spells/wind-wall"
    },
    {
      "index": "blight",
      "name": "Blight",
      "url": "/api/spells/blight"
    },
    {
      "index": "confusion",
      "name": "Confusion",
      "url": "/api/spells/confusion"
    },
    {
      "index": "conjure-minor-elementals",
      "name": "Conjure Minor Elementals",
      "url": "/api/spells/conjure-minor-elementals"
    },
    {
      "index": "conjure-woodland-beings",
      "name": "Conjure Woodland Beings",
      "url": "/api/spells/conjure-woodland-beings"
    },
    {
      "index": "control-water",
      "name": "Control Water",
      "url": "/api/spells/control-water"
    },
    {
      "index": "divination",
      "name": "Divination",
      "url": "/api/spells/divination"
    },
    {
      "index": "dominate-beast",
      "name": "Dominate Beast",
      "url": "/api/spells/dominate-beast"
    },
    {
      "index": "freedom-of-movement",
      "name": "Freedom of Movement",
      "url": "/api/spells/freedom-of-movement"
    },
    {
      "index": "giant-insect",
      "name": "Giant Insect",
      "url": "/api/spells/giant-insect"
    },
    {
      "index": "hallucinatory-terrain",
      "name": "Hallucinatory Terrain",
      "url": "/api/spells/hallucinatory-terrain"
    },
    {
      "index": "ice-storm",
      "name": "Ice Storm",
      "url": "/api/spells/ice-storm"
    },
    {
      "index": "locate-creature",
      "name": "Locate Creature",
      "url": "/api/spells/locate-creature"
    },
    {
      "index": "polymorph",
      "name": "Polymorph",
      "url": "/api/spells/polymorph"
    },
    {
      "index": "stone-shape",
      "name": "Stone Shape",
      "url": "/api/spells/stone-shape"
    },
    {
      "index": "stoneskin",
      "name": "Stoneskin",
      "url": "/api/spells/stoneskin"
    },
    {
      "index": "wall-of-fire",
      "name": "Wall of Fire",
      "url": "/api/spells/wall-of-fire"
    },
    {
      "index": "antilife-shell",
      "name": "Antilife Shell",
      "url": "/api/spells/antilife-shell"
    },
    {
      "index": "awaken",
      "name": "Awaken",
      "url": "/api/spells/awaken"
    },
    {
      "index": "commune-with-nature",
      "name": "Commune With Nature",
      "url": "/api/spells/commune-with-nature"
    },
    {
      "index": "conjure-elemental",
      "name": "Conjure Elemental",
      "url": "/api/spells/conjure-elemental"
    },
    {
      "index": "contagion",
      "name": "Contagion",
      "url": "/api/spells/contagion"
    },
    {
      "index": "geas",
      "name": "Geas",
      "url": "/api/spells/geas"
    },
    {
      "index": "greater-restoration",
      "name": "Greater Restoration",
      "url": "/api/spells/greater-restoration"
    },
    {
      "index": "insect-plague",
      "name": "Insect Plague",
      "url": "/api/spells/insect-plague"
    },
    {
      "index": "mass-cure-wounds",
      "name": "Mass Cure Wounds",
      "url": "/api/spells/mass-cure-wounds"
    },
    {
      "index": "planar-binding",
      "name": "Planar Binding",
      "url": "/api/spells/planar-binding"
    },
    {
      "index": "reincarnate",
      "name": "Reincarnate",
      "url": "/api/spells/reincarnate"
    },
    {
      "index": "scrying",
      "name": "Scrying",
      "url": "/api/spells/scrying"
    },
    {
      "index": "tree-stride",
      "name": "Tree Stride",
      "url": "/api/spells/tree-stride"
    },
    {
      "index": "wall-of-stone",
      "name": "Wall of Stone",
      "url": "/api/spells/wall-of-stone"
    },
    {
      "index": "conjure-fey",
      "name": "Conjure Fey",
      "url": "/api/spells/conjure-fey"
    },
    {
      "index": "heal",
      "name": "Heal",
      "url": "/api/spells/heal"
    },
    {
      "index": "heroes-feast",
      "name": "Heroes' Feast",
      "url": "/api/spells/heroes-feast"
    },
    {
      "index": "move-earth",
      "name": "Move Earth",
      "url": "/api/spells/move-earth"
    },
    {
      "index": "sunbeam",
      "name": "Sunbeam",
      "url": "/api/spells/sunbeam"
    },
    {
      "index": "transport-via-plants",
      "name": "Transport via Plants",
      "url": "/api/spells/transport-via-plants"
    },
    {
      "index": "wall-of-thorns",
      "name": "Wall of Thorns",
      "url": "/api/spells/wall-of-thorns"
    },
    {
      "index": "wind-walk",
      "name": "Wind Walk",
      "url": "/api/spells/wind-walk"
    },
    {
      "index": "fire-storm",
      "name": "Fire Storm",
      "url": "/api/spells/fire-storm"
    },
    {
      "index": "mirage-arcane",
      "name": "Mirage Arcane",
      "url": "/api/spells/mirage-arcane"
    },
    {
      "index": "plane-shift",
      "name": "Plane Shift",
      "url": "/api/spells/plane-shift"
    },
    {
      "index": "regenerate",
      "name": "Regenerate",
      "url": "/api/spells/regenerate"
    },
    {
      "index": "reverse-gravity",
      "name": "Reverse Gravity",
      "url": "/api/spells/reverse-gravity"
    },
    {
      "index": "animal-shapes",
      "name": "Animal Shapes",
      "url": "/api/spells/animal-shapes"
    },
    {
      "index": "antipathy-sympathy",
      "name": "Antipathy/Sympathy",
      "url": "/api/spells/antipathy-sympathy"
    },
    {
      "index": "control-weather",
      "name": "Control Weather",
      "url": "/api/spells/control-weather"
    },
    {
      "index": "earthquake",
      "name": "Earthquake",
      "url": "/api/spells/earthquake"
    },
    {
      "index": "feeblemind",
      "name": "Feeblemind",
      "url": "/api/spells/feeblemind"
    },
    {
      "index": "sunburst",
      "name": "Sunburst",
      "url": "/api/spells/sunburst"
    },
    {
      "index": "foresight",
      "name": "Foresight",
      "url": "/api/spells/foresight"
    },
    {
      "index": "shapechange",
      "name": "Shapechange",
      "url": "/api/spells/shapechange"
    },
    {
      "index": "storm-of-vengeance",
      "name": "Storm of Vengeance",
      "url": "/api/spells/storm-of-vengeance"
    },
    {
      "index": "true-resurrection",
      "name": "True Resurrection",
      "url": "/api/spells/true-resurrection"
    }
  ]
}
"""
}
