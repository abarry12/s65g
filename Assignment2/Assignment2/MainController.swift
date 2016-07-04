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
var livingCells = 0

func buttonPush (dimensions: Int, buttonClicks: Bool, before: Array<Array<Bool>>) -> (Bool, array: Array<Array<Bool>>, trueCount: Int) {
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


func beforeArray (dimensions: Int, array: Array<Array<Bool>>) -> (before: Array<Array<Bool>>, trueCount: Int) {
    
    //var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue:false))
    var before = array
    var trueCount = 0
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            if arc4random_uniform(3) == 1 {
                before[x][y] = true
                trueCount = trueCount + 1
            }
            else {
                before[x][y] = false
            }
        }
    }
    return (before, trueCount)
}

func afterArray (dimensions: Int, before: Array<Array<Bool>>) -> (after: Array<Array<Bool>>, trueCount: Int) {
    
    var after = before
    var trueCount = 0
    var neighbors: Int
    
    for x in 0..<dimensions {
        for y in 0..<dimensions {
            neighbors = cellNeighbors((dimensions, x: x, y: y, before: before))
            if before[x][y] == true {
                switch neighbors {
                case 2:
                    after[x][y] = true
                    trueCount = trueCount + 1
                case 3:
                    after[x][y] = true
                    trueCount = trueCount + 1
                default:
                    after[x][y] = false
                }
            }
            else {
                switch neighbors {
                case 3:
                    after[x][y] = true
                    trueCount = trueCount + 1
                default:
                    after[x][y] = false
                }
            }
            
        }
    }
    
    return (after, trueCount)
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
                    else if j == -1 {
                        if (i != x || j != y) {
                            if before[x][y + (dims-1)] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                    else if j == dims {
                        if (i != x || j != y) {
                            if before[x][y - (dims-1)] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                }
            }
            else if i == -1 {
                for j in (y-1)...(y+1) {
                    if j >= 0 && j < dims {
                        if (i != x || j != y) {
                            if before[x + (dims-1)][y] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                    else if j == -1 {
                        if (i != x || j != y) {
                            if before[x + (dims-1)][y + (dims-1)] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                    else if j == dims {
                        if (i != x || j != y) {
                            if before[x + (dims-1)][y - (dims-1)] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                }
            }
            else if i == dims {
                for j in (y-1)...(y+1) {
                    if j >= 0 && j < dims {
                        if (i != x || j != y) {
                            if before[x - (dims-1)][y] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                    else if j == -1 {
                        if (i != x || j != y) {
                            if before[x - (dims-1)][y + (dims-1)] == true {
                                neighborCounter += 1
                            }
                        }
                    }
                    else if j == dims {
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
        //textView.text = "Button Clicked"
        //let livingCells = beforeArray(dimensions)
        //textView.text = "There are \(livingCells.trueCount) living cells!"
        
        let functionRun = buttonPush(dimensions, buttonClicks: buttonClicks, before: before)
        buttonClicks = functionRun.0
        before = functionRun.array
        livingCells = functionRun.trueCount
        textView.text = "There are \(livingCells) living cells!"
        after = before
        
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
    }
    
    
}
