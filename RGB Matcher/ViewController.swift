//
//  ViewController.swift
//  RGB Matcher
//
//  Created by Coskunuzer, Selim on 10/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    var Red: Float = 0.0
    var Green: Float = 0.0
    var Blue: Float = 0.0
    var matchRed : Double = Double.random(in: 1...255)/255.0
    var matchGreen : Double = Double.random(in: 1...255)/255.0
    var matchBlue : Double = Double.random(in: 1...255)/255.0
    var diff : Int = 0
    
    
    @IBOutlet weak var you: UILabel!
    @IBOutlet weak var Match: UILabel!
    
    
    var count = 10
    var timer = Timer()
    @IBOutlet weak var counter: UILabel!
    var reset = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Match.backgroundColor = UIColor(red: matchRed, green: matchGreen, blue: matchBlue, alpha: 1.0)
        Red = RedSlider.value
        Green = GreenSlider.value
        Blue = BlueSlider.value
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timerAction()
    }
    
    
    @IBAction func SliderValueChanged(sender: UISlider) {
        sender.isSelected = true
        Red = RedSlider.value
        you.backgroundColor = UIColor(red: Double(Red), green: Double(Green), blue: Double(Blue), alpha: 1.0)
        difference()
    }
    
    @IBAction func SliderValueChanged2(sender: UISlider) {
        sender.isSelected = true
        Green = GreenSlider.value
        you.backgroundColor = UIColor(red: Double(Red), green: Double(Green), blue: Double(Blue), alpha: 1.0)
        difference()
    }
    
    @IBAction func SliderValueChanged3(sender: UISlider) {
        sender.isSelected = true
        Blue = BlueSlider.value
        you.backgroundColor = UIColor(red: Double(Red), green: Double(Green), blue: Double(Blue), alpha: 1.0)
        difference()
    }
    
    func difference(){
        var RedD = abs(Double(Red) - matchRed)
        var GreenD = abs(Double(Green) - matchGreen)
        var BlueD = abs(Double(Blue) - matchBlue)
        
        diff = Int(sqrt(RedD+GreenD+BlueD)*100)
    }
    
    @objc func timerAction(){
        counter.text = String(count)
        if (count>0){
            count-=1
        }
        if (count==0){
            showAlert()
        }
    }
    
 
    func showAlert() {
        let alertController = UIAlertController(title: "Game Over!", message:
            "Score: " + String(diff), preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action:UIAlertAction!) in
            self.reset = 1
        }))
        if (reset == 1){
            restart()
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func restart(){
        reset = 0
        count = 20
        RedSlider.value = 0
        GreenSlider.value = 0
        BlueSlider.value = 0
        Red = 0
        Green = 0
        Blue = 0
        matchRed = Double.random(in: 1...255)/255.0
        matchGreen = Double.random(in: 1...255)/255.0
        matchBlue = Double.random(in: 1...255)/255.0
        Match.backgroundColor = UIColor(red: matchRed, green: matchGreen, blue: matchBlue, alpha: 1.0)
    }
}

