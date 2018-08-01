//
//  AlertaViewController.swift
//  InfraMap1.0
//
//  Created by student on 01/08/18.
//  Copyright © 2018 França. All rights reserved.
//

import UIKit

class AlertaViewController: UIViewController {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var foto: UIImageView!
    
    var lat: String?
    var long: String?
    var imagemRecebida: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        latitude.text = lat
        longitude.text = long
        
        foto.image = imagemRecebida
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
