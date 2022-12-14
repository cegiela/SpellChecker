//
//  CharacterClassListItem.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct CharacterClassListItem: Codable {
    let index, name, url: String
}

struct MockCharacterClassList {
    let count = 12
    let jsonString = """
{
  "count": 12,
  "results": [
    {
      "index": "barbarian",
      "name": "Barbarian",
      "url": "/api/classes/barbarian"
    },
    {
      "index": "bard",
      "name": "Bard",
      "url": "/api/classes/bard"
    },
    {
      "index": "cleric",
      "name": "Cleric",
      "url": "/api/classes/cleric"
    },
    {
      "index": "druid",
      "name": "Druid",
      "url": "/api/classes/druid"
    },
    {
      "index": "fighter",
      "name": "Fighter",
      "url": "/api/classes/fighter"
    },
    {
      "index": "monk",
      "name": "Monk",
      "url": "/api/classes/monk"
    },
    {
      "index": "paladin",
      "name": "Paladin",
      "url": "/api/classes/paladin"
    },
    {
      "index": "ranger",
      "name": "Ranger",
      "url": "/api/classes/ranger"
    },
    {
      "index": "rogue",
      "name": "Rogue",
      "url": "/api/classes/rogue"
    },
    {
      "index": "sorcerer",
      "name": "Sorcerer",
      "url": "/api/classes/sorcerer"
    },
    {
      "index": "warlock",
      "name": "Warlock",
      "url": "/api/classes/warlock"
    },
    {
      "index": "wizard",
      "name": "Wizard",
      "url": "/api/classes/wizard"
    }
  ]
}
"""
}
