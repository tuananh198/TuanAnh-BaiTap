//
//  WheatherData.swift
//  Clima
//
//  Created by iOSTeam on 18/06/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WheatherData: Codable {
    var name: String
    var main: Main
    let weather: [Weather]
}

struct Main: Codable {
    var temp: Double
}

struct Weather: Codable {
    let id: Int
}
