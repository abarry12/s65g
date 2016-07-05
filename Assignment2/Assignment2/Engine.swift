//
//  Engine.swift
//  Assignment2
//
//  Created by Andrew Barry on 7/5/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import Foundation
import UIKit

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

func step (array: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCountBefore: Int, trueCountAfter: Int) {
    let dimensions = 10
    let dims = dimensions
    var before = array
    var after = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
    
    //func beforeArray (dimensions: Int, array: Array<Array<Bool>>) -> (before: Array<Array<Bool>>, trueCount: Int) {
    
    //var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
    var trueCountBefore = 0
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            if arc4random_uniform(3) == 1 {
                before[x][y] = true
                trueCountBefore += 1
            }
            else {
                before[x][y] = false
            }
        }
    }
    //    return (before, trueCount)
    //}
    
    //func afterArray (dimensions: Int, before: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCount: Int) {
    
    //after = before
    var trueCountAfter = 0
    //var neighbors: Int
    var neighborCounter = 0
    
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            for i in (x-1)...(x+1) {
                if i >= 0 && i < dims {
                    for j in (y-1)...(y+1) {
                        if j >= 0 && j < dims {
                            if (i != x || j != y) {
                                if before[x][y] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == -1 {
                            if (i != x || j != y) {
                                if before[x][y + (dims-1)] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == dims {
                            if (i != x || j != y) {
                                if before[x][y - (dims-1)] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                    }
                }
                if i == -1 {
                    for j in (y-1)...(y+1) {
                        if j >= 0 && j < dims {
                            if (i != x || j != y) {
                                if before[x + (dims-1)][y] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == -1 {
                            if (i != x || j != y) {
                                if before[x + (dims-1)][y + (dims-1)] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == dims {
                            if (i != x || j != y) {
                                if before[x + (dims-1)][y - (dims-1)] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                    }
                }
                if i == dims {
                    for j in (y-1)...(y+1) {
                        if j >= 0 && j < dims {
                            if (i != x || j != y) {
                                if before[x - (dims-1)][y] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == -1 {
                            if (i != x || j != y) {
                                if before[x - (dims-1)][y + (dims-1)] == true {
                                    neighborCounter += 1
                                }
                            }
                        }
                        if j == dims {
                            if (i != x || j != y) {
                                if before[x - (dims-1)][y - (dims-1)] == true {
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
                    trueCountAfter += 1
                case 3:
                    after[x][y] = true
                    trueCountAfter += 1
                default:
                    after[x][y] = false
                }
            }
            else {
                switch neighborCounter {
                case 3:
                    after[x][y] = true
                    trueCountAfter += 1
                default:
                    after[x][y] = false
                }
            }
            
        }
    }
    
    return (after, trueCountBefore, trueCountAfter)
}



func step2 (array: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCountBefore: Int, trueCountAfter: Int) {
    let dimensions = 10
    var before = array
    var after = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))

//func beforeArray (dimensions: Int, array: Array<Array<Bool>>) -> (before: Array<Array<Bool>>, trueCount: Int) {
    
    //var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
    var trueCountBefore = 0
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            if arc4random_uniform(3) == 1 {
                before[x][y] = true
                trueCountBefore += 1
            }
            else {
                before[x][y] = false
            }
        }
    }
//    return (before, trueCount)
//}

//func afterArray (dimensions: Int, before: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCount: Int) {
    
    after = before
    var trueCountAfter = 0
    var neighbors: Int
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            neighbors = cellNeighbors(dimensions, x: x, y: y, before: before)
            if before[x][y] == true {
                switch neighbors {
                case 2:
                    after[x][y] = true
                    trueCountAfter += 1
                case 3:
                    after[x][y] = true
                    trueCountAfter += 1
                default:
                    after[x][y] = false
                }
            }
            else {
                switch neighbors {
                case 3:
                    after[x][y] = true
                    trueCountAfter += 1
                default:
                    after[x][y] = false
                }
            }
            
        }
    }
    
    return (after, trueCountBefore, trueCountAfter)
}


func cellNeighbors (dimensions: Int, x: Int, y: Int, before: Array<Array<Bool>>) -> (Int) {
    
    var neighborCounter = 0
    let dims = dimensions
    //let array: Array<Array<Bool>> = before
    
    for i in (x-1)...(x+1) {
        if i >= 0 && i < dims {
            for j in (y-1)...(y+1) {
                if j >= 0 && j < dims {
                    if (i != x || j != y) {
                        if before[x][y] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == -1 {
                    if (i != x || j != y) {
                        if before[x][y + (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == dims {
                    if (i != x || j != y) {
                        if before[x][y - (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
            }
        }
        if i == -1 {
            for j in (y-1)...(y+1) {
                if j >= 0 && j < dims {
                    if (i != x || j != y) {
                        if before[x + (dims-1)][y] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == -1 {
                    if (i != x || j != y) {
                        if before[x + (dims-1)][y + (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == dims {
                    if (i != x || j != y) {
                        if before[x + (dims-1)][y - (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
            }
        }
        if i == dims {
            for j in (y-1)...(y+1) {
                if j >= 0 && j < dims {
                    if (i != x || j != y) {
                        if before[x - (dims-1)][y] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == -1 {
                    if (i != x || j != y) {
                        if before[x - (dims-1)][y + (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
                if j == dims {
                    if (i != x || j != y) {
                        if before[x - (dims-1)][y - (dims-1)] == true {
                            neighborCounter += 1
                        }
                    }
                }
            }
        }
    }
    return neighborCounter
}