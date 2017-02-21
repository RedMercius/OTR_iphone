//
//  SciFiViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class SciFiViewController: UIViewController {

    @IBOutlet weak var btnDimensionX: UIButton!
    @IBOutlet weak var btnXMinusOne: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dimensionXButton_Click(_ sender: UIButton) {
        print("Dimension X ButtonClick!!!!")
    }
    
    @IBAction func xMinusOneButton_Click(_ sender: UIButton) {
        print("XMinusOne ButtonClick!!!!")
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
