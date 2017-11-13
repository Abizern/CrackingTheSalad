import Foundation

// Paste you frequency distribution solution here when ready

public func frequencyDistributionAnalyse(text: String) -> [String: Int] {
    // return a dictionary with alphabet letters as keys and the count of their appearance in the text as a value
    return text.reduce(into: [String: Int]()) { (result, char) in
        let s = String(char)
        let count = result[s, default: 0]
        result[s] = count + 1
    }
}

public func prepareDataSetForFrequencyDistribution(from analyse: [String: Int]) -> [(key: String, value: Int)] {
    // 🤔
    // return an array of tuples (think about sorting them so both graphs are feed with letters in the same order, i.e.
    return analyse.sorted { $0.value > $1.value }
}
