//
//  ViewController.swift
//  FreeMoveButton
//
//  Created by chang he on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let freeBtn = FreeMoveButton(frame: CGRect(x: 0, y: 200, width: 60, height: 60))
        view.addSubview(freeBtn)
        freeBtn.clickCompletCloser = {
            print("clik Me!!!")
        }
        
    }


}

