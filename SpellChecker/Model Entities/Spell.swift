//
//  Spell.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct Spell: Codable {
    let id: String
    let higherLevelDescriptions: [String]
    let index, name: String
    let descriptions: [String]
    let range: String
    let components: [String]
    let ritual: Bool
    let duration: String
    let concentration: Bool
    let castingTime: String
    let attackType: String
    let level: Int
    let damage: Damage
    let school: School
    let classes, subclasses: [CharacterClassListItem]
    let url: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case higherLevelDescriptions = "higher_level"
        case descriptions = "desc"
        case index, name, range, components, ritual, duration, concentration
        case castingTime = "casting_time"
        case attackType = "attack_type"
        case level, damage, school, classes, subclasses, url
    }
}

struct School: Codable {
    let index, name, url: String
}

struct Damage: Codable {
    let damageType: DamageType
    let damageAtCharacterLevel: [String: String]

    enum CodingKeys: String, CodingKey {
        case damageType = "damage_type"
        case damageAtCharacterLevel = "damage_at_character_level"
    }
}

struct DamageType: Codable {
    let index, name, url: String
}

struct MockSpell {
    let name = "Produce Flame"
    let jsonString = """
{
  "_id": "63620c73a353df629003ddfd",
  "higher_level": [],
  "index": "produce-flame",
  "name": "Produce Flame",
  "desc": [
    "A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again.",
    "You can also attack with the flame, although doing so ends the spell. When you cast this spell, or as an action on a later turn, you can hurl the flame at a creature within 30 feet of you. Make a ranged spell attack. On a hit, the target takes 1d8 fire damage.",
    "This spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8)."
  ],
  "range": "Self",
  "components": [
    "V",
    "S"
  ],
  "ritual": false,
  "duration": "10 minutes",
  "concentration": false,
  "casting_time": "1 action",
  "level": 0,
  "attack_type": "ranged",
  "damage": {
    "damage_type": {
      "index": "fire",
      "name": "Fire",
      "url": "/api/damage-types/fire"
    },
    "damage_at_character_level": {
      "1": "1d8",
      "5": "2d8",
      "11": "3d8",
      "17": "4d8"
    }
  },
  "school": {
    "index": "conjuration",
    "name": "Conjuration",
    "url": "/api/magic-schools/conjuration"
  },
  "classes": [
    {
      "index": "druid",
      "name": "Druid",
      "url": "/api/classes/druid"
    }
  ],
  "subclasses": [
    {
      "index": "lore",
      "name": "Lore",
      "url": "/api/subclasses/lore"
    }
  ],
  "url": "/api/spells/produce-flame"
}
"""
}
