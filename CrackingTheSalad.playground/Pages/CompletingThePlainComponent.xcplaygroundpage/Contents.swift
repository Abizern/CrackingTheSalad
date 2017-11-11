/*:
# Completing The Plain Component

One of the easiest methods to crack the code is to check all 26 possibilities (for English) and use a human to pick the answer 🤖
 
For that we will need a Caesar cipher implementation!
 
- Note:
 You can implement it below and when tests are passing move it to `Sources/CaesarCipher.swift` so you can access it in the next tasks.
 
*/

import UIKit
import XCTest

// Caesar Cipher implementation

public func cipher(_ string: String, offset: Int) -> String {
    let alphabet:[Character] = ["A", "B", "C", "D" , "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let normalisedOffset: Int
    if offset >= 0 {
        normalisedOffset = offset % 26
    } else {
//        normalisedOffset = 26 + offset
        let a = abs(offset) % 26
        normalisedOffset = 26 - a
    }


    let newString = string.map { char -> Character in
        guard let index = alphabet.index(of: char) else { return char }
        var newIndex = index + normalisedOffset
        if newIndex > 25 {
            newIndex = newIndex - 26
        }

        return alphabet[newIndex]
    }

    return String(newString)
}



// Tests
let testSubject = "SWIFT"

// Cipher and decipher 👉 should be the same as at the beginning
XCTAssertEqual(cipher(testSubject, offset: 4), "WAMJX")
XCTAssertEqual(cipher(cipher(testSubject, offset: -4), offset: 4), testSubject)
XCTAssertEqual(cipher(cipher(testSubject, offset: 70), offset: -70), testSubject)

/*:
 
 ## Bruteforce it 💣
 
*/
let superSecretText = "FAUW QGM ZSNW VGFW AL"
(0...25).forEach { print(cipher(superSecretText, offset: $0)) }

// Check all possibilities and show which offset is the answer


// The answer is:  

