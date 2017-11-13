import Foundation

// Paste you cipher solution here when ready

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
public func cipher(_ string: String, offset: Int) -> String {
    let normalisedOffset: Int
    if offset >= 0 {
        normalisedOffset = offset % 26
    } else {
        let a = abs(offset) % 26
        normalisedOffset = 26 - a
    }

    let newString = string.map { char -> Character in
        guard let index = alphabet.index(of: char) else { return char }
        let newIndex = alphabet.index(index, offsetBy: normalisedOffset)

        return alphabet[newIndex]
    }

    return String(newString)
}
