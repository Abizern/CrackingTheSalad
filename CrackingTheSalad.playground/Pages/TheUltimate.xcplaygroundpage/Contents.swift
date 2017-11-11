/*:
 # The Ultimate
 
 Let's use frequency and make computer seek for the right offset to crack the cipher 🔥
 */

import Foundation

// Implementation

func breakCaesarCipher(text: String) -> String {
    
    // return decrypted text using frequency distribution and comparing highest or lowest letter frequencies
    // can you think of a way to make it even smarter? Maybe responding with an array of results with percentage of certainty?
    var dictionary = frequencyDistributionAnalyse(text: text)
    dictionary[" "] = 0
    let distribution = prepareDataSetForFrequencyDistribution(from: dictionary)
    let sortedDistribution = distribution.sorted { (a, b) -> Bool in
        return a.value > b.value
    }
    guard let mostFrequent = sortedDistribution.first?.key else { fatalError() }

    let alphabet = ["A", "B", "C", "D" , "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    let likelyIndex = Int(alphabet.index(of: mostFrequent)!)
    let eOffset = Int(alphabet.index(of: "E")!)
    let likelyOffset =  eOffset - likelyIndex
    
    
    return cipher(text, offset: likelyOffset)
}

// Test Data

let cipherText = "XIVRK, XFFU AFS! KYRKJ RCC WFCBJ. KYREB PFL WFI YRIU NFIB REU YFGV KF JVV PFL EVOK KZDV FE REFKYVI JNZWK GLQQCV VMVEK! ZW PFL YRMV REP FKYVI HLVJKZFE GCVRJV IVRTY FLK MZR KNZKKVI"

let result = breakCaesarCipher(text: cipherText)
print(result)

