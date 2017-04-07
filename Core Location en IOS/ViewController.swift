//
//  ViewController.swift
//  Core Location en IOS
//
//  Created by alumno on 6/04/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    let manager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //cada cuanto va a tomar la ubicacion mientras mas lejos menos bateria consume
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        manager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnActivarTouch(_ sender: UIButton) {
        
        if CLLocationManager.authorizationStatus() != .authorizedAlways{
            
            manager.requestAlwaysAuthorization();
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            manager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let ubicacion = locations[0]
        let coordenadas = ubicacion.coordinate
        
        textView.text = textView.text + "\n [\(coordenadas.latitude), \(coordenadas.longitude)]  "
        
        //print("\(coordenadas.latitude)", "\(coordenadas.longitude)")
        
        
    }
    
}

