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
    var showId : String = "Unknown Show ID"
    
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
        showId = "BurnsAndAllen"
    }
    
    @IBAction func gildersleevesButton_Click(_ sender: UIButton) {
        print("Gildersleeves ButtonClick!!!!")
        showId = "Gildersleeves"
    }
    
    @IBAction func fibberButton_Click(_ sender: UIButton) {
        print("Fibber ButtonClick!!!!")
        showId = "Fibber and Mcgee"
    }
    
    @IBAction func bobHopeButton_Click(_ sender: UIButton) {
        print("Bob Hope ButtonClick!!!!")
        showId = "Bob Hope"
    }
    
    @IBAction func martinLewisButton_Click(_ sender: UIButton) {
        print("Martin Lewis ButtonClick!!!!")
        showId = "MartinAndLewis"
    }
    
    @IBAction func jackBennyButton_Click(_ sender: UIButton) {
        print("Jack Benny ButtonClick!!!!")
        showId = "JackBenny"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // let selectionTableView = SelectionTableView()
        let svc = segue.destination as! SelectionTableViewController
        svc.showId = showId
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
