//
//  APILibrary.swift
//  GoodBitsStore
//
//  Created by Sukumar Anup Sukumaran on 17/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import Alamofire
import SASLogger
import APILib

typealias JSON = [String: AnyObject]
typealias OJSON = [String : Any?]

protocol FetchFeedDelegate: class {
    func feedFetchService(_ service: APILibraryDelegate, didFetchFeeds feeds: ActivityModel?, withError error: Error?)
}

protocol APILibraryDelegate: class {
    var delegate: FetchFeedDelegate? { get set }
    func fetchFeeds()
}

class APILibrary: NSObject {
    
    typealias BaseAPI = (scheme: String, host: String, path: String)
    typealias Header = (headerVal: String, headerKey: String)
    static let shared = APILibrary()
    var apiComponent: BaseAPI = (scheme: .scheme, host: .host, path: .path)
    
    var delegate: FetchFeedDelegate?
    
}

extension APILibrary: APILibraryDelegate {
    
    
    func fetchFeeds() {
        
        let req = APILib.makeRequest(method: .get, apiComponents: apiComponent, withPathExtension: .pActivity)
        AF.request(req).validate().responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
               self.fetchFeedFailed(withError: response.error!)
               return
            }
            
            guard let data = response.data else { return }
             self.fetchFeedSuccess(withData: data)
    

        }
    }
    
    fileprivate func fetchFeedFailed(withError error: Error) {
        self.delegate?.feedFetchService(self, didFetchFeeds: nil, withError: error)
    }
    
    fileprivate func fetchFeedSuccess(withData data: Data) {
        var activity: ActivityModel?
        do {
        
            activity = try JSONDecoder().decode(ActivityModel.self, from: data)
        } catch (let error) {
            self.fetchFeedFailed(withError: error)
            activity = nil
        }
    
        self.delegate?.feedFetchService(self, didFetchFeeds: activity, withError: nil)
    }
    
    
}

extension APILibrary {
    
    /// The API call to list all the shop names and address and their location.
    /// - Parameters:
    ///   - filterId: The parameter for the api
    ///   - comp: an escaping handler at execute upon API response as type Results
    public func apiActivity( comp: @escaping (Results<ModelResponse>) -> ()) {
       
        let req = APILib.makeRequest(method: .get, apiComponents: apiComponent, withPathExtension: .pActivity)

        dataSetter(req, comp: comp)
    }
       
    
    /// This function creates the data request using Alamofire
    /// - Parameters:
    ///   - req: request created from APILib package
    ///   - comp: an escaping handler at execute upon API response as type Results
    func dataSetter( _ req: URLRequest, comp: @escaping (Results<ModelResponse>) -> ()) {
       
       AF.request(req).validate().responseJSON { (response) in
           
           guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
              comp(.failure(errorStr: response.error!.localizedDescription))
              return
           }
           
           guard let data = response.data else { return }
           
           do {
               let modelResponse = try ModelResponse(data: data)
               comp(.success(modelResponse))
           } catch (let error) {
               comp(.failure(errorStr: error.localizedDescription))
           }
           
       }
    }
       
    /// just to print json response values
    /// - Parameter result: response result type from the Alamofire Framework
    func printJsonResponse(_ result:AFResult<Any>) -> String {

        Logger.p("SASresult = \(result)")

        var jData = ""

        switch result {
        case .success(let data):

            if let jsonData = data as? String {
                jData = "\(jsonData)"
            } else if let jsonData = data as? [JSON] {
                jData = "\(jsonData)"
            } else if let jsonData = data as? JSON {
                jData = "\(jsonData)"
            }else if let jsonData = data as? Bool {
                jData = "\(jsonData)"
            }else {
                jData = "NO DATA FOUND"
            }

        case .failure(let error):
            jData = "ERROR FOUND -> \(error.localizedDescription)"

        }

        return jData

    }
    
}
