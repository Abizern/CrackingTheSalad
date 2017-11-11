import Foundation

// Paste you cipher solution here when ready

public func cipher(_ string: String, offset: Int) -> String {
    let alphabet:[Character] = ["A", "B", "C", "D" , "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let normalisedOffset: Int
    if offset >= 0 {
        normalisedOffset = offset % 26
    } else {
        //        normalisedOffset = 26 + offset
        let a = (-1 * offset) % 26
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
