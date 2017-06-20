//
//  ViewController.swift
//  CarSimulator
//
//  Created by Marty on 15.06.17.
//  Copyright © 2017 Marty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let ferrari = Car()
  
  // MARK: engine
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
  
  
  // MARK: gear
  @IBOutlet weak var gearR: UIButton!
  @IBOutlet weak var gearN: UIButton!
  @IBOutlet weak var gear1: UIButton!
  @IBOutlet weak var gear2: UIButton!
  @IBOutlet weak var gear3: UIButton!
  @IBOutlet weak var gear4: UIButton!
  @IBOutlet weak var gear5: UIButton!
  
  @IBOutlet weak var displayGear: UILabel!
  @IBOutlet weak var changeOneGear: UIStepper!
  
  
  private func displayGear(gear: Int) {
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
  
  @IBAction func changeOneGear(_ sender: UIStepper) {
    let newGear = Int(sender.value)
    displayGear(gear: newGear)
  }
  
  // second type switch gear
  @IBAction func gearR(_ gear: UIButton) {
    switch gear {
    case gearR: displayGear(gear: -1)
    case gearN: displayGear(gear: 0)
    case gear1: displayGear(gear: 1)
    case gear2: displayGear(gear: 2)
    case gear3: displayGear(gear: 3)
    case gear4: displayGear(gear: 4)
    case gear5: displayGear(gear: 5)
    default:    displayGear(gear: 0)
    }
  }
  
  // speed
  private func displaySpeed(speed: Int) {
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

