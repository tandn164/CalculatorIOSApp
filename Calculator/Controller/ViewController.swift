//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 2/28/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
class ViewController: UIViewController {

   
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    @IBOutlet weak var buttonDv: UIButton!
    @IBOutlet weak var buttonMtl: UIButton!
    @IBOutlet weak var buttonSb: UIButton!
    @IBOutlet weak var buttonSm: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonP: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var resultText: UITextField!
   
    var colorcong : UIColor?
    var colortru : UIColor?
    var colornhan : UIColor?
    var colorchia : UIColor?
    var colorcongt : UIColor?
    var colortrut : UIColor?
    var colornhant : UIColor?
    var colorchiat : UIColor?
    var x = caculator()
    var countphay = 0
    var prebutton = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        colortru = buttonSb.backgroundColor
        colorchia = buttonDv.backgroundColor
        colorcong = buttonSm.backgroundColor
        colornhan = buttonMtl.backgroundColor
        buttonRound()
    }
    func buttonRound(){
      //  button0.bounds.size.width = 174.5
        print(button1.bounds.size.width)
        
        button0.layer.cornerRadius = 0.25 * 150
        button1.layer.cornerRadius = 0.5 * 75.0
        button2.layer.cornerRadius = 0.5 * 75.0
        button3.layer.cornerRadius = 0.5 * 75.0
        button4.layer.cornerRadius = 0.5 * 75.0
        button5.layer.cornerRadius = 0.5 * 75.0
        button6.layer.cornerRadius = 0.5 * 75.0
        button7.layer.cornerRadius = 0.5 * 75.0
        button8.layer.cornerRadius = 0.5 * 75.0
        button9.layer.cornerRadius = 0.5 * 75.0
        buttonC.layer.cornerRadius = 0.5 * 75.0
        buttonS.layer.cornerRadius = 0.5 * 75.0
        buttonM.layer.cornerRadius = 0.5 * 75.0
        buttonDv.layer.cornerRadius = 0.5 * 75.0
        buttonMtl.layer.cornerRadius = 0.5 * 75.0
        buttonSb.layer.cornerRadius = 0.5 * 75.0
        buttonSm.layer.cornerRadius = 0.5 * 75.0
        buttonE.layer.cornerRadius = 0.5 * 75.0
        buttonP.layer.cornerRadius = 0.5 * 75.0
    }
    func  buttonUnround() {
        button0.layer.cornerRadius = 0.25 * 60.0
        button1.layer.cornerRadius = 0.5 * 30.0
        button2.layer.cornerRadius = 0.5 * 30.0
        button3.layer.cornerRadius = 0.5 * 30.0
        button4.layer.cornerRadius = 0.5 * 30.0
        button5.layer.cornerRadius = 0.5 * 30.0
        button6.layer.cornerRadius = 0.5 * 30.0
        button7.layer.cornerRadius = 0.5 * 30.0
        button8.layer.cornerRadius = 0.5 * 30.0
        button9.layer.cornerRadius = 0.5 * 30.0
        buttonC.layer.cornerRadius = 0.5 * 30.0
        buttonS.layer.cornerRadius = 0.5 * 30.0
        buttonM.layer.cornerRadius = 0.5 * 30.0
        buttonDv.layer.cornerRadius = 0.5 * 30.0
        buttonMtl.layer.cornerRadius = 0.5 * 30.0
        buttonSb.layer.cornerRadius = 0.5 * 30.0
        buttonSm.layer.cornerRadius = 0.5 * 30.0
        buttonE.layer.cornerRadius = 0.5 * 30.0
        buttonP.layer.cornerRadius = 0.5 * 30.0
      
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.currentTitle!
        switch title {
        case "+","-","x",":":
            buttonResetColor()
            buttonchoosed(title)
            if prebutton>="0" && prebutton<="9"
            {
                x.addElement(resultText.text!)
                resultText.text = "\((x.tinh() as NSString).floatValue.clean)"
            }
            prebutton=title
        case "0"..."9":
            buttonResetColor()
            if prebutton == "="
            {
                x = caculator()
                resultText.text = title
                prebutton = title
                break;
            }
            if prebutton == "+" || prebutton == "-" || prebutton == "x" || prebutton == ":"
            {
                resultText.text = "0"
                x.addElement(prebutton)
            }
            deleteZerobegin()
            resultText.text = resultText.text! + title
            prebutton=title
        
        case "AC":
            x = caculator()
            resultText.text = "0"
            prebutton = "0"
        case "=":
            buttonResetColor()
            if prebutton >= "0" && prebutton <= "9"
            {
                x.addElement(resultText.text!)
            } else if prebutton == "+" || prebutton == "-" || prebutton == "x" || prebutton == ":"
            {
                x.addElement(prebutton)
            }
             
            resultText.text = "\((x.tinh() as NSString).floatValue.clean)"
            prebutton = title
        default: break
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            buttonUnround()
            print(1)
        } else {
            print(2)
            buttonUnround()
            buttonRound()
        }
    }
    func buttonchoosed(_ str: String) {
        switch str {
        case "+":
            buttonSm.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            buttonSm.setTitleColor(.orange, for: .normal)
        case "-":
            buttonSb.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            buttonSb.setTitleColor(.orange, for: .normal)
        case "x":
            buttonMtl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            buttonMtl.setTitleColor(.orange, for: .normal)
        case ":":
            buttonDv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            buttonDv.setTitleColor(.orange, for: .normal)
        default:
            break
        }
    }
    func buttonResetColor() {
        buttonMtl.backgroundColor = colornhan
        buttonMtl.setTitleColor(.systemBackground, for: .normal)
        buttonSm.backgroundColor = colortru
        buttonSm.setTitleColor(.systemBackground, for: .normal)
        buttonDv.backgroundColor = colorchia
        buttonDv.setTitleColor(.systemBackground, for: .normal)
        buttonSb.backgroundColor = colorcong
        buttonSb.setTitleColor(.systemBackground, for: .normal)
    }
    func isZerobegin() -> Int?
    {
        let str :String = resultText.text!
        let ch = Array(str)
        if countphay == 0
        {
            if ch[0] == "0"
            {
                return 0
            } else if ch[0] == "-" && ch[1] == "0" {return 1}
        }
        return nil
    }
    func deleteZerobegin() {
        var str :String = resultText.text!
        if let i = isZerobegin() {
            str.remove(at: str.index(str.startIndex, offsetBy: i))
            resultText.text = str
        }
    }
}
