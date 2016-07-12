//
//  GridView.swift
//  Assignment3
//
//  Created by Andrew Barry on 7/6/16.
//  Copyright © 2016 Andrew Barry. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    //var grid = Array<Array<ViewController.CellState>>()
    
    @IBInspectable var rows: Int = 20 {
        didSet{
                var grid = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: ViewController.CellState.Empty))
                //the view needs to be refreshed
                setNeedsDisplay()
                //var grid = copyGrid

        }

    }

    /*
    var poop: Int = 20 {
        didSet{
            var copyArray = [[ViewController.CellState.self]]
            
        
        }
    }*/

    @IBInspectable var cols: Int = 20 {
        didSet{
                var grid = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: ViewController.CellState.Empty))
                    //the view needs to be refreshed
                    setNeedsDisplay()
        }
    }
        
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.yellowColor()
    @IBInspectable var bornColor: UIColor = UIColor.blueColor()
    @IBInspectable var diedColor: UIColor = UIColor.redColor()
    @IBInspectable var gridColor: UIColor = UIColor.grayColor()
    @IBInspectable var gridWidth: CGFloat = 5.0
    /*
    for x in 0..<rows {
        for y in 0..<cols {
            let thisCell = grid[x][y]
        }
    }
*/
    
    override func drawRect(rect: CGRect) {
        
        var grid = UIBezierPath(rect: rect)
        gridColor.setFill()
        grid.fill()
        
        //set up the width and height variables
        //for the horizontal stroke
        //let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.9
        
        //create the path
        var gridLines = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        gridLines.lineWidth = gridWidth
        
        for i in 0...cols {
            //move the initial point of the path
        //to the start of the horizontal stroke
            gridLines.moveToPoint(CGPoint(
                x:bounds.minX,// - plusWidth/2 + 0.5,
                y:bounds.height/CGFloat(cols) * CGFloat(i) + 0.5))

        
        //add a point to the path at the end of the stroke
        gridLines.addLineToPoint(CGPoint(
            x:bounds.width,// + plusWidth/2 + 0.5,
            y:bounds.height/CGFloat(cols) * CGFloat(i) + 0.5))
        }
        
        for j in 0...rows {
            //Vertical Line
            //move to the start of the vertical stroke
            gridLines.moveToPoint(CGPoint(
                x:bounds.width/CGFloat(rows) * CGFloat(j) + 0.5,
                y:bounds.minY))// - plusWidth/2 + 0.5))
            
            //add the end point to the vertical stroke
            gridLines.addLineToPoint(CGPoint(
                x:bounds.width/CGFloat(rows) * CGFloat(j) + 0.5,
                y:bounds.height))// + plusWidth/2 + 0.5))

        }
                
        //set the stroke color
        UIColor.whiteColor().setStroke()
        
        //draw the stroke
        gridLines.stroke()
        
        
        //Draw the circles on top of graph stroke
        for x in 0..<rows {
            for y in 0..<cols {
            
            var point = CGPoint(x:((bounds.width*CGFloat(x))/CGFloat(rows)) + gridWidth, y:((bounds.height * CGFloat(y)/CGFloat(cols)) + gridWidth))
            //point.x -= (bounds.width/CGFloat(rows)*2)
            //point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: (bounds.width/CGFloat(rows)-(gridWidth*2.0)), height: (bounds.height/CGFloat(cols)-(gridWidth*2.0)))))
                
                //WHY DOESNT THIS WORK? WHY CAN'T I ACCESS MY GRID?
                switch grid[x][y] {
                case .Living: livingColor.setFill()
                case .Born: bornColor.setFill()
                case .Died: diedColor.setFill()
                case .Empty: emptyColor.setFill()
                }
                
                circle.fill()
                
                //setNeedsDisplayInRect(CGRect)
                
            }
        }
        
        
       /* func handleTap(sender: UITapGestureRecognizer) {
            if sender.state == .Ended {
                // handling code
            }
        }
 */
    }

    func convertPointToGrid (point: CGPoint) -> (Int, Int) {

        let xSpacing = (bounds.width)/(CGFloat(rows))
        let ySpacing = (bounds.height)/(CGFloat(cols))
        let xValue = point.x / xSpacing
        let yValue = point.y / ySpacing
        return (Int(xValue),Int(yValue))
        
    }
    
    func processTouch(touch: UITouch) {
        
        let point = touch.locationInView(self)
        var (x,y) = convertPointToGrid(point)
        self.setNeedsDisplay()
        grid[x][y].toggle(grid[x][y])
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            self.processTouch(touch)
        }
    }
    


    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

            
}
 