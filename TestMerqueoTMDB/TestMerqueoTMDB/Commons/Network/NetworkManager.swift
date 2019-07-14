//
//  NetworkManager.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit
import NetworkExtension

class NetworkManager: NSObject {
    
    //------------------------------------------------------------------------
    //------------------------------------------------------------------------
    
    var controller: UIViewController?
    
    init(controller:UIViewController) {
        super.init()
        self.controller = controller
    }
    
    //let loadingIndicator = LoadingIndicator()
    
    //------------------------------------------------------------------------
    //------------------------------------------------------------------------
    
    /** */
    func GET<T: Codable>(uriApi:String,
                         requiereAuthorization:Bool = true,
                         header:[String:String]?,
                         completion: @escaping (T?, GeneralBasicResponse?) -> ()){
        
        let _uri = String(format: "%@%@", NetworkPath.base_url, uriApi)
        let urlComponents = URLComponents.init(url: URL.init(string: _uri)!, resolvingAgainstBaseURL: true)
        
        
        guard let url = urlComponents?.url else {
            fatalError("Could not create URL from components")
        }
        
        // Build headers
        var _headers:[String:String]? = nil
        _headers = [String:String]()
        _headers!["Content-Type"] = "application/json"
        
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = _headers
        
        //loadingIndicator.show(uiView: controller!)
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) {
            
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            (responseData, response, responseError) in
            //self.loadingIndicator.hide()
            
            print("URI: \(request.mainDocumentURL)")
            print("URI2: \(request.url)")
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            guard responseError == nil else {
                
                print("No sueccess1: %@ ", responseError ?? "")
                
                //- BAD
                do {
                    //let mutableDictionary = self.removeNullFromDict(dict: responseError)
                    let mutableDictionary = responseError
                    print(mutableDictionary ?? "-defaul-")
                    let normalJsonData: Data? = try? JSONSerialization.data(withJSONObject: mutableDictionary)
                    
                    let gotData = try JSONDecoder().decode(GeneralBasicResponse.self, from: normalJsonData!)
                    print("GOTDATA-GET1: \(gotData)")
                    
                    completion(nil,gotData)
                }
                catch let jsonErr {
                    print("NetworkManager - Error serializing json:", jsonErr)
                }
                
                completion(nil,nil)
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                
                let normaliceUTF8 = utf8Representation.removeNULLString()
                let normaliceUTF8_Dict = normaliceUTF8.convertToDictionary() ?? []
                print("--------------------------------------")
                print("Response: %@", utf8Representation)
                print("Response-Normal: %@", normaliceUTF8)
                print("Response-Dict: %@", normaliceUTF8_Dict)
                print("--------------------------------------")
                
                
                if normaliceUTF8_Dict.count > 0,
                    (normaliceUTF8_Dict.first?["status_code"] as? String ?? "") == "7",
                    (normaliceUTF8_Dict.first?["status_code"] as? String ?? "") == "34" {
                    
                    //- BAD
                    do {
                        var normalJsonData: Data? = nil
                        
                        if normaliceUTF8.count == 1 {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict.first as Any)
                        } else {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict)
                        }
                        
                        if let _ = normalJsonData {
                            let gotData = try JSONDecoder().decode(GeneralBasicResponse.self, from: normalJsonData!)
                            print("GOTDATA-GET2: \(gotData)")
                            completion(nil,gotData)
                        } else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                        }
                    }
                    catch let jsonErr {
                        print("NetworkManager - Error serializing json:", jsonErr)
                    }
                    
                }else {
                    
                    //- OK
                    do {
                        
                        var normalJsonData: Data? = nil
                        
                        
                        guard normaliceUTF8.count > 0 else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                            
                            return
                        }
                        
                        
                        if String(normaliceUTF8.first!) == "[" {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict)
                        }else {
                            if normaliceUTF8_Dict.count > 0 {
                                normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict.first)
                            }else {
                                normalJsonData = nil
                            }
                        }
                        
                        if let _ = normalJsonData {
                            let gotData = try JSONDecoder().decode(T.self, from: normalJsonData!)
                            print("GOTDATA-GET3: \(gotData)")
                            completion(gotData, nil)
                        } else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                        }
                    }
                    catch let jsonErr {
                        print("NetworkManager - Error serializing json:", jsonErr)
                    }
                }
            }else {
                print("No sueccess2: %@ ", "")
            }
        }
        task.resume()
    }
    
    
    /** */
    func POST<T: Codable>(uriApi:String, parameters:[String:Any],
                          requiereAuthorization:Bool = true,
                          header:[String:String]?,
                          completion: @escaping (T?,GeneralBasicResponse?) -> ()){
        
        let _uri = String(format: "%@%@", NetworkPath.base_url, uriApi)
        let urlComponents = URLComponents.init(url: URL.init(string: _uri)!, resolvingAgainstBaseURL: true)
        
        guard let url = urlComponents?.url else {
            fatalError("Could not create URL from components")
        }
        
        // Build headers
        var _headers:[String:String]? = nil
        _headers = [String:String]()
        _headers!["Content-Type"] = "application/json"
        
        
        
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //var headers = request.allHTTPHeaderFields ?? [:]
        //headers["Content-Type"] = "application/json"
        //request.allHTTPHeaderFields = headers
        request.allHTTPHeaderFields = _headers
        
        //loadingIndicator.show(uiView: controller!)
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject:parameters)
            
            request.httpBody = jsonData
            
            print("-------------")
            print("JsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            completion(nil, nil)
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) {
            
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            (responseData, response, responseError) in
            //self.loadingIndicator.hide()
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            guard responseError == nil else {
                
                print("No sueccess1: %@ ", responseError ?? "")
                
                //- BAD
                do {
                    //let mutableDictionary = self.removeNullFromDict(dict: responseError)
                    let mutableDictionary = responseError
                    print(mutableDictionary ?? "-default-")
                    let normalJsonData: Data? = try? JSONSerialization.data(withJSONObject: mutableDictionary)
                    
                    let gotData = try JSONDecoder().decode(GeneralBasicResponse.self, from: normalJsonData!)
                    print("GOTDATA-POST1: \(gotData)")
                    completion(nil,gotData)
                }
                catch let jsonErr {
                    print("NetworkManager - Error serializing json:", jsonErr)
                }
                
                completion(nil,nil)
                return
            }
            
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                
                let normaliceUTF8 = utf8Representation.removeNULLString()
                let normaliceUTF8_Dict = normaliceUTF8.convertToDictionary() ?? []
                print("--------------------------------------")
                print("Response: %@", utf8Representation)
                print("Response-Normal: %@", normaliceUTF8)
                print("Response-Dict: %@", normaliceUTF8_Dict)
                print("--------------------------------------")
                
                
                if normaliceUTF8_Dict.count > 0,
                    (normaliceUTF8_Dict.first?["MessageCode"] as? String ?? "") == "bad" {
                    
                    //- BAD
                    do {
                        var normalJsonData: Data? = nil
                        if normaliceUTF8_Dict.count == 1 {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict.first as Any)
                        } else {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict)
                        }
                        
                        if let _ = normalJsonData {
                            let gotData = try JSONDecoder().decode(GeneralBasicResponse.self, from: normalJsonData!)
                            print("GOTDATA-POST2: \(gotData)")
                            completion(nil,gotData)
                        } else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                        }
                    }
                    catch let jsonErr {
                        print("NetworkManager - Error serializing json:", jsonErr)
                    }
                    
                }else {
                    
                    //- OK
                    do {
                        var normalJsonData: Data? = nil
                        
                        guard normaliceUTF8.count > 0 else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                            
                            return
                        }
                        
                        
                        if String(normaliceUTF8.first!) == "[" {
                            normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict)
                        }else {
                            if normaliceUTF8_Dict.count > 0 {
                                normalJsonData = try? JSONSerialization.data(withJSONObject: normaliceUTF8_Dict.first)
                            }else {
                                normalJsonData = nil
                            }
                        }
                        
                        if let _ = normalJsonData {
                            let gotData = try JSONDecoder().decode(T.self, from: normalJsonData!)
                            print("GOTDATA-POST3: \(gotData)")
                            completion(gotData, nil)
                        } else {
                            //- Error Message
                            self.errorMessage()
                            completion(nil, nil)
                        }
                    }
                    catch let jsonErr {
                        print("NetworkManager - Error serializing json:", jsonErr)
                    }
                }
            }else {
                print("No sueccess2: %@ ", "")
            }
        }
        task.resume()
    }
    
    
    
    //- Error Message
    func errorMessage(){
        
        if let _controller = self.controller {
            //_controller.view.showToast(toastMessage: "El servicio no se encuentra disponible", duration: 2.0)
            print("El servicio no se encuentra disponible")
        }
    }
}
