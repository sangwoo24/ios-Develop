import UIKit

// 0으로 초기화된 배열 생성
var num = Array(repeating: 0, count: 5)
var num2 = Array(repeating: 0, count: 5)

// sequence로 배열 생성
var a = Array(0...1)

// 배열 합 가능
print(num + num2)

// 배열 slice
print(num[0..<3])

// empty 확인
num.isEmpty

// insert
num.insert(100, at: 0)

// remove
num.remove(at: 0)

// enumerated
for (index, value) in num.enumerated() {
    print("index: \(index), value: \(value)")
}


