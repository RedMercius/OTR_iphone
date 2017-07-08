//
//  WesternViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class WesternViewController: UIViewController {

    @IBOutlet weak var btnFortLaramie: UIButton!
    @IBOutlet weak var btnHopalong: UIButton!
    var showId : String = "Unknown Show ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fortLaramieButton_Click(_ sender: UIButton) {
        print("Fort Laramie ButtonClick!!!!")
        showId = "FortLaramie"
    }
    
    @IBAction func hopalongButton_Click(_ sender: UIButton) {
        print("Hopalong Cassidy ButtonClick!!!!")
        showId = "Hopalong Cassidy"
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let svc = segue.destination as! SelectionTableViewController
        svc.showId = showId
    }

}
