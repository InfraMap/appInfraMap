//
//  ViewController.swift
//  InfraMap1.0
//
//  Created by student on 27/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    
    let annotation = MKPointAnnotation()
    
    @IBOutlet weak var infraMap: MKMapView!
    
    var imagemPassada: UIImage!
    
    @IBOutlet weak var location: UILabel!
    
    var latitudeDoUsuario: Double?
    
    var longitudeDoUsuario: Double?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passaAlerta" {
            if segue.destination is AlertaViewController {
                let nextScene =  segue.destination as! AlertaViewController
                // Pass the selected object to the new view controller.
                nextScene.lat = latitudeDoUsuario!
                nextScene.long = longitudeDoUsuario!
                nextScene.imagemRecebida = imagemPassada
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //quando o app ligar no background
        locationManager.requestAlwaysAuthorization()
        
        // quando o app ligar
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
            self.infraMap.showsUserLocation = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitudeDoUsuario = locValue.latitude
        longitudeDoUsuario = locValue.longitude
        location.text = String(describing: latitudeDoUsuario!)
        print(latitudeDoUsuario!)
        print(longitudeDoUsuario!)
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    //Camera do App
    @IBAction func Camera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
//            ViewController.location.requestLocation()
//            guard let userLocation = ViewController.location.location else {return}
            self.present(imagePicker, animated: true, completion: nil)
            
            
            
            }
    }
    
    //Saving the image taken
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
//            imagemPassada.contentMode = .scaleToFill
            imagemPassada = pickedImage
            
            
        }
        picker.dismiss(animated: true, completion: nil)
        
        infraMap.addAnnotation(annotation)
        
        performSegue(withIdentifier: "passaAlerta", sender: nil)
    }
    
   
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to deliver pizza we need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
}

