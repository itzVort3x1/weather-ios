import Foundation

struct WeatherManager {
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4a53f592b57b9362b062aeb2456ab007&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url){ (data, respnose, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        }catch {
            print(error)
        }
    }
    
}
