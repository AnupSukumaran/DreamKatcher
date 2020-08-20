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


