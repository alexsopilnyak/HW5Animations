import UIKit


func sum(first: Int) -> ((Int) -> Int) {
  func second(second: Int) -> Int {
   return first + second
  }
  return second(second:)
}

let function = sum(first: 3)(6)


func sumImproved(_ first: Int) -> ((Int) -> Int) {
  return { (second: Int) in
    return second + first
  }
}

sumImproved(3)(9)
