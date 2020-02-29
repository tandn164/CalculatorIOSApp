//
//  ViewController2.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 2/28/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
            button.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
            button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
            view.addSubview(button)
    
    }

    @objc func thumbsUpButtonPressed() {
            print("thumbs up button pressed")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

