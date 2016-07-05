//
//  ViewController.swift
//  Assignment2
//
//  Created by Andrew Barry on 6/29/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import UIKit


let dimensions = 10
var buttonClicks = false
var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
var after = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
//var livingCells = 0




class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class Problem2ViewController: UIViewController {
    
    let dimensions = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 2"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func runButton(sender: AnyObject) {
        print("Button Clicked")
        textView.text = "Button Clicked"
        var beforeCount = 0
        var afterCount = 0
        //var neighbors: Int
        
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
        
        var neighborCounter = 0
        let dims = dimensions
        //let array: Array<Array<Bool>> = before
        
        
        for x in 0..<dimensions {
            for y in 0..<dimensions {
                //neighborCounter = cellNeighbors(dimensions, x: x, y: y, before: before)
                
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
        
        textView.text = "There are \(beforeCount) living cells before. \r\n There are \(afterCount) living cells after."
        
    }

    
}

class Problem3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 3"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func runButton(sender: AnyObject) {
        print("Button Clicked")
        textView.text = "Button Clicked"
        //let livingCells = beforeArray(dimensions)
        //textView.text = "There are \(livingCells.trueCount) living cells!"
        
        let functionRun = step(before)
        //buttonClicks = functionRun.0
        after = functionRun.after
        let livingCellsBefore = functionRun.trueCountBefore
        let livingCellsAfter = functionRun.trueCountAfter
        textView.text = "There are \(livingCellsBefore) living cells before. \r\n There are \(livingCellsAfter) living cells after."
        //before = after
    }
    
    
}
class Problem4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 4"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func runButton(sender: AnyObject) {
    print("Button Clicked")
    textView.text = "Button Clicked"
    let functionRun = step2(before)
    after = functionRun.after
    let livingCellsBefore = functionRun.trueCountBefore
    let livingCellsAfter = functionRun.trueCountAfter
    textView.text = "There are \(livingCellsBefore) living cells before. \r\n There are \(livingCellsAfter) living cells after."
    }
    
    
}
