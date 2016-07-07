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
        
        let functionRun = step(before)
        //buttonClicks = functionRun.0
        after = functionRun.0
        textView.text = functionRun.textView

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
        
        let functionRun = step(before)
        //buttonClicks = functionRun.0
        after = functionRun.0
        textView.text = functionRun.textView
    }
    
    
}
