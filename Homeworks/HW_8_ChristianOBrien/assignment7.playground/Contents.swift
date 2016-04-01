// Assignment 7 playground

import XCPlayground
import Foundation

// To include SwiftyJSON, download SwiftyJSON.swift from the repository at
//   https://github.com/SwiftyJSON/SwiftyJSON/tree/master/Source
// Then expand the Navigator with CMD+1.
// Drag/drop the file from Finder into the "Sources" folder in the Navigator.

// Let asynchronous code run
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: - TODO 1
//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

let googleURL : String = "https://www.google.com/"
func connectToGoogle(){
    if let url = NSURL(string: googleURL) {
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithURL(url) { (data, _, _) -> Void in
            if let data = data {
                print(data)
            }
        }
        task.resume()
    }
}
connectToGoogle()

// MARK: - TODO 2
//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to  a nonexistant page. Print out the status code and body of the response.

let gaURL : String = "http://generalassemb.ly/foobar.baz"
func connectToGA(){
    if let url = NSURL(string: googleURL) {
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithURL(url) { (data, response, _) -> Void in
            
            if let data = data {
                print(data)
            }
            if let response = response as? NSHTTPURLResponse {
                print(response.statusCode)
            }
        }
        task.resume()
    }
}
connectToGA()

// MARK: - TODO 3
//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

let weatherURL : String = "http://api.openweathermap.org/data/2.5/weather?q=New%20York&units=imperial&APPID=ddf2b16294f8884204a373331e615187"
func connectToWeatherWithDefault(){
    if let url = NSURL(string: weatherURL) {
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            
            if let response = response as? NSHTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                    
                    let name = json.valueForKey("name") as? NSString
                    let main = json.valueForKey("main") as? NSDictionary
                    let temp = main?.valueForKey("temp") as? Float
                    
                    if let name = name {
                        if let temp = temp {
                            print("current temperature in \(name) is \(temp)(F) degrees! ")
                        }
                    }
                    
                } catch {
                    print("invalid json")
                }
                
            } else {
                print("could not get data back")
            }
        }
        task.resume()
    } else {
        print("not a valid url")
    }
}
connectToWeatherWithDefault()

// MARK: - TODO 4
//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

func connectToWeatherWithJSON(){
    if let url = NSURL(string: weatherURL) {
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            
            if let response = response as? NSHTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                let json = JSON(data:data)
                let name = json["name"].string
                let temp = json["main"]["temp"].float
                
                    if let name = name {
                        if let temp = temp {
                            print("current temperature in \(name) is \(temp)(F) degrees! ")
                        }
                    }
                
            } else {
                print("could not get data back")
            }
        }
        task.resume()
    } else {
        print("not a valid url")
    }
}
connectToWeatherWithJSON()