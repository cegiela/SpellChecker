//
//  SpellCheckerTests.swift
//  SpellCheckerTests
//
//  Created by Mat Cegiela on 11/16/22.
//

import XCTest
@testable import SpellChecker

final class SpellCheckerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_characterClassListModel_mapsCorrectlyWithJSON() throws {
        let sut = CharacterClassListMapper()
        let mockData = MockCharacterClassList()
        let data = mockData.jsonString.data(using: .utf8)!
        
        let result = try sut.map(data: data)
        XCTAssertEqual(result.count, mockData.count)
    }
    
    func test_spellListModel_mapsCorrectlyWithJSON() throws {
        let sut = SpellListMapper()
        let mockData = MockSpellList()
        let data = mockData.jsonString.data(using: .utf8)!
        
        let result = try sut.map(data: data)
        XCTAssertEqual(result.count, mockData.count)
    }
    
    func test_spellObject_mapsCorrectlyWithJSON() throws {
        let mockData = MockSpell()
        let data = mockData.jsonString.data(using: .utf8)!
        
        let result = try JSONDecoder().decode(Spell.self, from: data)
        XCTAssertEqual(result.name, mockData.name)
    }
}
