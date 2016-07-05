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
        var neighbors: Int
        
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
        
        let functionRun = buttonPush(dimensions, buttonClicks: buttonClicks, before: before)
        buttonClicks = functionRun.0
        before = functionRun.array
        livingCells = functionRun.trueCount
        textView.text = "There are \(livingCells) living cells!"
        after = before
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
