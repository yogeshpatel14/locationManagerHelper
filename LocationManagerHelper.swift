//
//  LocationManager.swift
//  DemoWeather
//
//  Created by Yogesh on 30/11/16.
//  Copyright © 2016 freestone. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation
import MapKit

class LocationManagerHelper: NSObject, CLLocationManagerDelegate {
    
    var location_manager:CLLocationManager! = CLLocationManager();
    var str_lat:String = "";
    var str_lng:String = "";
    var helper_delegate:LocationHelperDelegate? = nil;
    
    class singleton {
        class var sharedInstance: LocationManagerHelper {
            struct Static {
                static let instance: LocationManagerHelper = LocationManagerHelper()
            }
            return Static.instance
        }
    }
    
    
    func setHelperDelegate(del:LocationHelperDelegate) {
        self.helper_delegate = del;
    }
    
    func loadInit() {
        self.str_lat = "";
        self.str_lng = "";
        self.location_manager = CLLocationManager.init();
        self.location_manager.delegate = self;
        self.location_manager.distanceFilter = kCLDistanceFilterNone;
        self.location_manager.desiredAccuracy = kCLLocationAccuracyBest;
        self.location_manager.requestWhenInUseAuthorization();
        self.location_manager.requestAlwaysAuthorization();
        
    }
    
    
    
    // MARK: - location manager delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break;
            
        case .restricted:
            do {
                if(self.helper_delegate != nil) {
                    self.helper_delegate?.didNotAuthorizeForFetchLocation()
                }
            }
            break;
            
        case .authorizedWhenInUse:
            location_manager.startUpdatingLocation();
            break;
            
        case .authorizedAlways:
            location_manager.startUpdatingLocation();
            break;
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(str_lat.count <= 0 && str_lng.count <= 0) {
            str_lat = String(format: "%f",(manager.location?.coordinate.latitude)!);
            str_lng = String(format: "%f",(manager.location?.coordinate.longitude)!);
            location_manager.delegate = nil;
            location_manager.stopUpdatingLocation();
            if(location_manager.delegate == nil) {
                if(self.helper_delegate != nil) {
                    self.helper_delegate?.getLatAndLonCurrentLocation(strLat: str_lat, AndLng: str_lng);
                }
            }
        }
    }
    
    @objc func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error)")
    }
    
}
