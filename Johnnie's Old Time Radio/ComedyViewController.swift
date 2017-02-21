//
//  ComedyViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class ComedyViewController: UIViewController {
    
   
    @IBOutlet weak var btnBurnsAllen: UIButton!
    @IBOutlet weak var btnGildersleeves: UIButton!
    @IBOutlet weak var btnFibber: UIButton!
    @IBOutlet weak var btnBobHope: UIButton!
    @IBOutlet weak var btnMartinLewis: UIButton!
    @IBOutlet weak var btnJackBenny: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func burnsAllenButton_Click(_ sender: UIButton) {
        print("BurnsAllenButtonClick!!!!")
    }
    
    @IBAction func gildersleevesButton_Click(_ sender: UIButton) {
        print("Gildersleeves ButtonClick!!!!")
    }
    
    @IBAction func fibberButton_Click(_ sender: UIButton) {
        print("Fibber ButtonClick!!!!")
    }
    
    @IBAction func bobHopeButton_Click(_ sender: UIButton) {
        print("Bob Hope ButtonClick!!!!")
    }
    
    @IBAction func martinLewisButton_Click(_ sender: UIButton) {
        print("Martin Lewis ButtonClick!!!!")
    }
    
    @IBAction func jackBennyButton_Click(_ sender: UIButton) {
        print("Jack Benny ButtonClick!!!!")
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
