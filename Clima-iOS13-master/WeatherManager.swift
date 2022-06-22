//
//  WeatherManager.swift
//  Clima
//
//  Created by iOSTeam on 18/06/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDeligate {
    func didUpdateWeather(weatherModel: WeatherModel)
}

struct WeatherManager {
    
    let wheatherURL = "https://api.openweathermap.org/data/2.5/weather"
    let apiKey = "&appid=c66f67ad87fb9cf6b8f300a8d453349b&units=metric"
    var delegate: WeatherManagerDeligate?
    func fetchWheather(cityName: String) {
        let url = "\(wheatherURL)?q=\(cityName)\(apiKey)"
        performRequest(url: url)
    }
    func fetchWheather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let url = "\(wheatherURL)?lat=\(lat)&lon=\(lon)\(apiKey)"
//        print(url)
        performRequest(url: url)
    }
    func performRequest(url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, urlResponse, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(wheatherData: safeData) {
                        delegate?.didUpdateWeather(weatherModel: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(wheatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WheatherData.self, from: wheatherData)
            let conditionID = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let weatherModel = WeatherModel(conditionId: conditionID, cityName: cityName, temperature: temperature)
            return weatherModel
//            print(weatherModel.temperatureString)
            
        } catch {
            print("Begin Error")
            print(error)
            print("End Eror")
            return nil
        }
    }
}
