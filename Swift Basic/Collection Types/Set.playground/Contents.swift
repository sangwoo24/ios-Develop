import UIKit

// set 생성
var set = Set<Int>()

// insert
set.insert(0)

// Array to Set
var num = [1,1,2,2,3,3]
var numToSet = Set(num)

// remove
numToSet.remove(4) //nil
numToSet.remove(0)

// contains
numToSet.contains(0)


// 집합 관련
var union = set.union(numToSet)
var intersection = set.intersection(numToSet)
var subtracting = set.subtracting(numToSet)

// 대칭자 : 둘 중 한 집합에는 속하지만 둘 모두에는 속하지 않는 원소들의 집합
var difference = set.symmetricDifference(numToSet)
