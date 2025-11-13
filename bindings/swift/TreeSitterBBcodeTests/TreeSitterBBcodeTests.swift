import XCTest
import SwiftTreeSitter
import TreeSitterBBcode

final class TreeSitterBBcodeTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_bbcode())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading BBcode grammar")
    }
}
