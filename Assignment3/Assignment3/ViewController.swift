//
//  ViewController.swift
//  Assignment3
//
//  Created by Andrew Barry on 7/6/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func runButton(sender: AnyObject) {
        print("Button Clicked")
        //textView.text = "Button Clicked"
        let gridView = GridView()
        let functionRun = step(gridView.grid, rows: gridView.rows, cols: gridView.cols)
        //buttonClicks = functionRun.0
        //after = functionRun.0
        //textView.text = functionRun.textView
        //print(functionRun.textView)
    }
    
    @IBAction func tapGrid(sender: UITapGestureRecognizer) {
        
    }
    
    enum CellState: String {
        case Living = "living"
        case Empty = "empty"
        case Born = "born"
        case Died = "died"
        
        func description() -> String {
            return self.rawValue
        }
        
        func toggle(value: CellState) -> CellState {
            switch value {
            case .Living, .Born:
                return .Empty
            case .Empty, .Died:
                return .Living
            }
        }
        
        static func allValues() -> [CellState] {
            return [.Living, .Empty, .Born, .Died]
        }
    }
    
    


}

