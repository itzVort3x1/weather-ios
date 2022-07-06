import Foundation

struct WeatherManager {
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4a53f592b57b9362b062aeb2456ab007&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        print(urlString)
    }
}
