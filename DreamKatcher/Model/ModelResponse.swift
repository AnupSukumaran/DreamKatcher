//
//  ModelResponse.swift
//  
//
//  Created by Manu Puthoor on 10/03/20.
//

import Foundation
import UIKit


public class ModelResponse: NSObject, Codable {
    
    var activityModel:ActivityModel?
    
    public init(data: Data) throws {
        super.init()
        activityModel = try? JSONDecoder().decode(ActivityModel.self, from: data)
    }

}
