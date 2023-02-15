////
////  main.swift
////  BaekJoon#5430
////
////  Created by 김병엽 on 2023/02/16.
////
/// Reference: https://velog.io/@aurora_97/백준-5430번-AC-Swift

import Foundation

func solution() {

    let testCase = Int(readLine()!)!

    for _ in 0..<testCase {

        let cmd = readLine()!
        let n = Int(readLine()!)!
        let arr = readLine()!.dropLast().dropFirst().split(separator: ",").map { Int(String($0))! }

        var head = 0, tail = n - 1
        var isReversed = false
        var isError = false

        for i in cmd {

            if i == "D" {
                if head > tail {
                    isError = true
                    break
                }
                if isReversed {
                    tail -= 1
                } else {
                    head += 1
                }
            } else {
                isReversed.toggle()
            }
        }

        if isError {
            print("error")
        } else if head > tail {
            print("[]")
        } else {
            let ans = arr[head...tail].map{String($0)}.joined(separator: ",")
            let reverseAns = arr[head...tail].reversed().map{String($0)}.joined(separator: ",")
            if isReversed {
                print("["+reverseAns+"]")
            } else {
                print("["+ans+"]")
            }
        }
    }

}

solution()
