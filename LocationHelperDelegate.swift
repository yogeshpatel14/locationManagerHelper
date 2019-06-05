//
//  LocationHelperDelegate.swift
//  DemoWeather
//
//  Created by Yogesh on 12/01/17.
//  Copyright © 2017 freestone. All rights reserved.
//

import Foundation

protocol LocationHelperDelegate {
    /**
     * this delegate for get location coordination
     */
    func getLatAndLonCurrentLocation(strLat:String, AndLng lng:String);
    func didNotAuthorizeForFetchLocation()
}


