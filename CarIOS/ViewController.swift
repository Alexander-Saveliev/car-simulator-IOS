//
//  ViewController.swift
//  CarSimulator
//
//  Created by Marty on 15.06.17.
//  Copyright © 2017 Marty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let ferrari = Car()
  
  // engine
  @IBOutlet weak var displayEngineStatus: UILabel!
  
  @IBAction func changeEngineStatus(_ sender: UIButton) {
    if ferrari.getEngineStatus() {
      
      if ferrari.turnOffEngine() {
        displayEngineStatus.text      = "OFF"
        displayEngineStatus.textColor = nil
      } else {
        displayEngineStatus.textColor = UIColor.red
      }
      
    } else {
      
      if ferrari.turnOnEngine() {
        displayEngineStatus.text = "ON"
        displayEngineStatus.textColor = nil
      } else {
        displayEngineStatus.textColor = UIColor.red
      }
      
    }
  }
  
  
  //gear
  func dsidplayGear(gear: Int) {
    if ferrari.setGear(withGear: gear) {
      var newGearChar :String!
      
      switch gear {
      case -1:
        newGearChar = "R"
      case 0:
        newGearChar = "N"
      default:
        newGearChar = String(gear)
      }
      
      displayGear.text = newGearChar
      displayGear.textColor = nil
      changeOneGear.value = Double( ferrari.getGear() )
    } else {
      displayGear.textColor = UIColor.red
      changeOneGear.value = Double( ferrari.getGear() )
    }
  }
  
  @IBOutlet weak var displayGear: UILabel!
  @IBOutlet weak var changeOneGear: UIStepper!
  
  @IBAction func changeOneGear(_ sender: UIStepper) {
    let newGear = Int(sender.value)
    dsidplayGear(gear: newGear)
  }
  
  // second type switch gear
  @IBAction func gearR(_ sender: UIButton) {
    dsidplayGear(gear: -1)
  }
  @IBAction func gearN(_ sender: UIButton) {
    dsidplayGear(gear: 0)
  }
  @IBAction func gear1(_ sender: UIButton) {
    dsidplayGear(gear: 1)
  }
  @IBAction func gear2(_ sender: UIButton) {
    dsidplayGear(gear: 2)
  }
  @IBAction func gear3(_ sender: UIButton) {
    dsidplayGear(gear: 3)
  }
  @IBAction func gear4(_ sender: UIButton) {
    dsidplayGear(gear: 4)
  }
  @IBAction func gear5(_ sender: UIButton) {
    dsidplayGear(gear: 5)
  }
  
  // speed
  func displaySpeed(speed: Int) {
    if ferrari.setSpeed(withSpeed: speed) {
      speedometr.text = String( ferrari.getSpeed() )
      speedometr.textColor = nil
    } else {
      speedometr.textColor = UIColor.red
    }
    
    changeOneSpeed.value = Double( ferrari.getSpeed() )
    changeSpeed.value = Float( ferrari.getSpeed() )
  }
  
  @IBOutlet weak var speedometr: UILabel!
  @IBOutlet weak var changeOneSpeed: UIStepper!
  @IBOutlet weak var changeSpeed: UISlider!
  
  @IBAction func setSpeedStep(_ sender: UIStepper) {
    displaySpeed( speed: Int(sender.value) )
  }
  
  @IBAction func setSpeed(_ sender: UISlider) {
    displaySpeed( speed: Int(sender.value) )
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

