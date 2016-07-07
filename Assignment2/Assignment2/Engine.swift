//
//  Engine.swift
//  Assignment2
//
//  Created by Andrew Barry on 7/5/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import Foundation
import UIKit

func step (array: Array<Array<Bool>>) -> (Array<Array<Bool>>, textView: String) {
    let dimensions = 10
    var beforeCount = 0
    var afterCount = 0
    var before = array
    var after = array
        
        for x in 0..<dimensions {
            for y in 0..<dimensions {
                if arc4random_uniform(3) == 1 {
                    before[x][y] = true
                    beforeCount += 1
                }
                else {
                    before[x][y] = false
                }
            }
        }
        
        //let dims = dimensions
        //let array: Array<Array<Bool>> = before
        
        for x in 0..<dimensions {
            for y in 0..<dimensions {
                //neighborCounter = cellNeighbors(dimensions, x: x, y: y, before: before)
                
                var neighborCounter = 0
                
                for i in (x-1)...(x+1) {
                    if i == ((x+9)%10) {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                    if i == ((x+1)%10) {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                    if i == x {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[x][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[x][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[x][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                if before[x][y] == true {
                    switch neighborCounter {
                    case 2:
                        after[x][y] = true
                        afterCount += 1
                    case 3:
                        after[x][y] = true
                        afterCount += 1
                    default:
                        after[x][y] = false
                    }
                }
                else {
                    switch neighborCounter {
                    case 3:
                        after[x][y] = true
                        afterCount += 1
                    default:
                        after[x][y] = false
                    }
                }
                
            }
        }
        
        print("----------")
        
        for x in 0..<dimensions {
            var output = ""
            for y in 0..<dimensions {
                output = output.stringByAppendingString(" ")
                output = output.stringByAppendingString(before[x][y] == true ? "1" : "0")
            }
            print(output)
        }
        
        print("----------")
        
        for x in 0..<dimensions {
            var output = ""
            for y in 0..<dimensions {
                output = output.stringByAppendingString(" ")
                output = output.stringByAppendingString(after[x][y] == true ? "1" : "0")
            }
            print(output)
        }
        
        let textView = "There are \(beforeCount) living cells before. \r\n There are \(afterCount) living cells after."
    return (after, textView)
    }



/*
func buttonClick (dimensions: Int, buttonClicks: Bool, before: Array<Array<Bool>>) -> (Bool, array: Array<Array<Bool>>, trueCount: Int) {
    //var buttonClick: Bool = false
    var trueCount: Int = 0
    var array: Array<Array<Bool>> = before
    if buttonClicks == false {
        let firstArray = beforeArray(dimensions, array: before)
        //buttonClick = true
        trueCount = firstArray.trueCount
        array = firstArray.before
    }
    else {
        let secondArray = afterArray(dimensions, before: before)
        //buttonClick = true
        trueCount = secondArray.trueCount
        array = secondArray.after
    }
    return (true, array, trueCount)
}
*/


func step2 (array: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, textView: String) {
    
    let dimensions = 10
    var before = array
    var after = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))

//func beforeArray (dimensions: Int, array: Array<Array<Bool>>) -> (before: Array<Array<Bool>>, trueCount: Int) {
    
    //var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
    var beforeCount = 0
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            if arc4random_uniform(3) == 1 {
                before[x][y] = true
                beforeCount += 1
            }
            else {
                before[x][y] = false
            }
        }
    }

//func afterArray (dimensions: Int, before: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCount: Int) {
    
    after = before
    var afterCount = 0
    var neighbors: Int
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            neighbors = cellNeighbors(dimensions, x: x, y: y, before: before)
            if before[x][y] == true {
                switch neighbors {
                case 2:
                    after[x][y] = true
                    afterCount += 1
                case 3:
                    after[x][y] = true
                    afterCount += 1
                default:
                    after[x][y] = false
                }
            }
            else {
                switch neighbors {
                case 3:
                    after[x][y] = true
                    afterCount += 1
                default:
                    after[x][y] = false
                }
            }
            
        }
    }
    
    let textView = "There are \(beforeCount) living cells before. \r\n There are \(afterCount) living cells after."
    return (after, textView)

}


func cellNeighbors (dimensions: Int, x: Int, y: Int, before: Array<Array<Bool>>) -> (Int) {
    
    var neighborCounter = 0
    
                for i in (x-1)...(x+1) {
                    if i == ((x+9)%10) {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[(x+9)%10][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                    if i == ((x+1)%10) {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[(x+1)%10][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                    if i == x {
                        for j in (y-1)...(y+1) {
                            if j == ((y+9)%10) {
                                if (i != x || j != y) {
                                    if before[x][(y+9)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == ((y+1)%10) {
                                if (i != x || j != y) {
                                    if before[x][(y+1)%10] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                            if j == y {
                                if (i != x || j != y) {
                                    if before[x][y] == true {
                                        neighborCounter += 1
                                    }
                                }
                            }
                        }
                    }
                }
    
    return neighborCounter
}

