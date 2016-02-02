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
        case Equals = "="
        case Empty = "Empty"
    }

    @IBOutlet weak var outputLbl:UILabel!
  
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    
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
        btnSound.play()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
        
    }

    @IBAction func onDividePressed(sender: AnyObject) {
    }

    @IBAction func onMultiplePressed(sender: AnyObject) {
        
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
    }
    @IBAction func onSumPressed(sender: AnyObject) {
        
    }
    @IBAction func onEqualPressed(sender: AnyObject) {
        
    }
}

