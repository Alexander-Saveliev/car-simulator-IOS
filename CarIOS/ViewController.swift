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
  
  @IBAction func changeEngineStatus(_: UIButton) {
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
  @IBOutlet weak var gearR: UIButton!
  @IBOutlet weak var gearN: UIButton!
  @IBOutlet weak var gear1: UIButton!
  @IBOutlet weak var gear2: UIButton!
  @IBOutlet weak var gear3: UIButton!
  @IBOutlet weak var gear4: UIButton!
  @IBOutlet weak var gear5: UIButton!
  
  
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
  @IBAction func gearR(_ gear: UIButton) {
    switch gear {
    case gearR: dsidplayGear(gear: -1)
    case gearN: dsidplayGear(gear: 0)
    case gear1: dsidplayGear(gear: 1)
    case gear2: dsidplayGear(gear: 2)
    case gear3: dsidplayGear(gear: 3)
    case gear4: dsidplayGear(gear: 4)
    case gear5: dsidplayGear(gear: 5)
    default:    dsidplayGear(gear: 0)
    }
  }
  
  // speed
  func displaySpeed(speed: Int) {
    if ferrari.setSpeed(withSpeed: speed) {
      speedometr.text = String( ferrari.getSpeed() )
      speedometr.textColor = nil
    } else {
      speedometr.textColor = UIColor.red
    }
    
    changeOneSpeed.value      = Double( ferrari.getSpeed() )
    changeSpeed.value         = Float( ferrari.getSpeed() )
    displaySpeed.pointerAngle = CGFloat( ferrari.getSpeed() )
  }
  
  
  @IBOutlet weak var displaySpeed: Speedometer!
  @IBOutlet weak var speedometr: UILabel!
  @IBOutlet weak var changeOneSpeed: UIStepper!
  @IBOutlet weak var changeSpeed: UISlider!
  
  @IBAction func setSpeedStep(_ speedStepper: UIStepper) {
    displaySpeed( speed: Int(speedStepper.value) )
  }
  
  @IBAction func setSpeed(_ speedSlider: UISlider) {
    displaySpeed( speed: Int(speedSlider.value) )
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

