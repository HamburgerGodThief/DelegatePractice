//
//  TaipeiRequest.swift
//  GCDPractice
//
//  Created by Hamburger on 2020/1/14.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

enum TaipeiRequest: STRequest {
    
    case firstRequest
    
    case secondRequest
    
    case thirdRequest
    
    var headers: [String : String]? {
        switch self {
        case .firstRequest, .secondRequest, .thirdRequest: return nil
        }
    }
    
    var body: Data? {
        
        switch self {
        case .firstRequest, .secondRequest, .thirdRequest: return nil
        }
        
    }
    
    var method: String {
        
        switch self {
        case .firstRequest, .secondRequest, .thirdRequest: return STHTTPMethod.GET.rawValue
        }
        
    }
    
    var endPoint: String {
        
        switch self {
        case .firstRequest: return "?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=0"
        case .secondRequest: return "?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=10"
        case .thirdRequest: return "?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=20"
        }
    }
}
