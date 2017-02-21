//
//  ThrillerViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class ThrillerViewController: UIViewController {

    @IBOutlet weak var btnSpeed: UIButton!
    @IBOutlet weak var btnWhistler: UIButton!
    @IBOutlet weak var btnInnerSanctum: UIButton!
    @IBOutlet weak var btnNightBeat: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func speedButton_Click(_ sender: UIButton) {
        print("Speed ButtonClick!!!!")
    }

    @IBAction func whistlerButton_Click(_ sender: UIButton) {
        print("Whistler ButtonClick!!!!")
    }
    
    @IBAction func innerSanctumButton_Click(_ sender: UIButton) {
        print("Inner Sanctum ButtonClick!!!!")
    }
    
    @IBAction func nightBeatButton_Click(_ sender: UIButton) {
        print("Night Beat ButtonClick!!!!")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
