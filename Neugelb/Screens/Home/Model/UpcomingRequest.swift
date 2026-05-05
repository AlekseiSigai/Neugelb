//
//  UpcomingRequest.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import NetworkService

struct UpcomingRequest: NetworkRequest {

    let host = AppConfig.baseURL
    let path = "\(AppConfig.apiVersion)/movie/upcoming"
    
    let headers: [String : String]?
    var parameters: URLParameters? = [
        "language": "en-US"
    ]
    
    init(page: Int,
         apiToken: String
    ) {
        parameters?["page"] = page
        
        headers = [
            "Authorization": "Bearer \(apiToken)",
            "accept": "application/json"
        ]
    }
}
