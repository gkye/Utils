import Foundation

//ARRAY

extension Array where Element : Hashable {
    
    public func unique() -> Array {
        var seen: [Element : Bool] = [:]
        
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

extension Array {
    public mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
    
    public func shuffled() -> Array {
        var shuffledArray = self
        shuffledArray.shuffle()
        
        return shuffledArray
    }
}
