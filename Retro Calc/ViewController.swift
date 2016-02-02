//
//  ViewController.swift
//  Retro Calc
//
//  Created by Lyle Christianne Jover on 02/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        
        case Divide = "/"
        case Sum = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Empty = "Empty"
    }

    @IBOutlet weak var outputLbl:UILabel!
  
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            
         try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
       
        
        
    }

    @IBAction func numberPressed(btn: UIButton!){
        
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
        
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplePressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
        
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    @IBAction func onSumPressed(sender: AnyObject) {
        processOperation(Operation.Sum)
    }
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            //Run Some Math
            
            //A user selected an operator but then selected another operator without first entering a number
            if runningNumber != ""{
            rightValStr = runningNumber
            runningNumber = ""
            
            if currentOperation == Operation.Multiply{
                result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                
            } else if currentOperation == Operation.Divide {
                
                result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                
            } else if currentOperation == Operation.Subtract {
                
                result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                
            } else if currentOperation == Operation.Sum {
                
                result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                
            }
            }
            
            leftValStr = result
            outputLbl.text = result
            
            currentOperation = op
            
        } else {

            //This is the first time an operator has been pressed.
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op

        }
    }
    
    func playSound(){
       
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()

    }
}

