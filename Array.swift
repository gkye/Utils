//
//  Extensions+Array.swift
//  Utils
//
//  Created by George Kye on 2017-12-16.
//  Copyright © 2017 George Kye. All rights reserved.
//

import Foundation

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
        self.swapAt(i, j)
      }
    }
  }
  
  public func shuffled() -> Array {
    var shuffledArray = self
    shuffledArray.shuffle()
    return shuffledArray
  }
}
