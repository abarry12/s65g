
//
//  Engine.swift
//  Assignment2
//
//  Created by Andrew Barry on 7/5/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import Foundation
import UIKit

//var state: ViewController.CellState = ViewController.CellState.Empty

func step (array: [[ViewController.CellState]], rows: Int, cols: Int) -> ([[ViewController.CellState]], String) {
    //let state = ViewController.CellState()
    //let rows = array.count
    //let cols = array[0].count
    var beforeCount = 0
    var afterCount = 0
    var before = array
    var after = array
    
    for x in 0..<rows {
        for y in 0..<cols {
            if arc4random_uniform(3) == 1 {
                before[x][y] = .Living
                beforeCount += 1
            }
            else {
                before[x][y] = .Empty
            }
        }
    }
    
    //let dims = dimensions
    //let array: Array<Array<Bool>> = before
    
    for x in 0..<rows {
        for y in 0..<cols {
            let neighbors = cellNeighbors(x, y: y, xRows: rows, yCols: cols)
            let neighborCensus = census(before, neighbors: neighbors)
            
            if before[x][y] == .Living || before[x][y] == .Born {
                switch neighborCensus {
                case 2:
                    after[x][y] = .Living
                    afterCount += 1
                case 3:
                    after[x][y] = .Living
                    afterCount += 1
                default:
                    after[x][y] = .Died
                }
            }
            if before[x][y] == .Died || before[x][y] == .Empty {
                switch neighborCensus {
                case 3:
                    after[x][y] = .Born
                    afterCount += 1
                default:
                    after[x][y] = .Empty
                }
            }
            
        }
    }
//}

    /*print("----------")
    
    for x in 0..<rows {
        var output = ""
        for y in 0..<cols {
            output = output.stringByAppendingString(" ")
            output = output.stringByAppendingString(before[x][y] == true ? "1" : "0")
        }
        print(output)
    }
    
    print("----------")
    
    for x in 0..<rows {
        var output = ""
        for y in 0..<cols {
            output = output.stringByAppendingString(" ")
            output = output.stringByAppendingString(after[x][y] == true ? "1" : "0")
        }
        print(output)
    }
*/
    let textView = "There are \(beforeCount) living cells before. \r\n There are \(afterCount) living cells after."
    return (after, textView)
}



func cellNeighbors (x: Int, y: Int, xRows: Int, yCols: Int) -> ([(Int, Int)]) {
    
    let rows = xRows
    let cols = yCols
    let neighbors = [((x+9)%rows,(y+9)%cols), ((x+9)%rows,(y+1)%cols), ((x+9)%rows, y),
                 ((x+1)%rows,(y+9)%cols), ((x+1)%rows,(y+1)%cols), ((x+1)%rows, y),
                 (x,(y+9)%cols), (x,(y+1)%cols)]
    
    return neighbors
}

func census (grid: [[ViewController.CellState]], neighbors: [(Int, Int)]) -> Int {
    var census = 0
    //if let neighbor = neighbors {
        for i in 0..<neighbors.count {
            let nei = neighbors[i]
            switch grid[nei.0][nei.1] {
            case .Living:
                census += 1
            case .Born:
                census += 1
            default:
                census += 0
            }

        }
    //}
    return census
}

