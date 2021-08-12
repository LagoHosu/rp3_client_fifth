//
//  dataRequest.swift
//  podTest
//
//  Created by Lago on 2021/08/10.
//

import UIKit
import Alamofire

class centerRequest {
    func getCenterData(_ viewController : loginController) {
        let url = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=300&returnType=json&serviceKey=qpblgqSiN9%2Fnp%2Fhw%2FoNDE7GVXN60Oi8SIDA%2Bhf%2Fm%2BGk26gSH69EA%2BTIOGrGlxWaFuwSpg5XtcaGajt65z6argw%3D%3D"
        let params: Parameters = [
            "namespace" : "15077586/v1",
            "page" : 1,
            "perPage" : 300,
            "serviceKey" : "qpblgqSiN9%2Fnp%2Fhw%2FoNDE7GVXN60Oi8SIDA%2Bhf%2Fm%2BGk26gSH69EA%2BTIOGrGlxWaFuwSpg5XtcaGajt65z6argw%3D%3D"
        ]
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: dataResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    //loginController().didSuccess(response)
                    viewController.didSuccess(response)
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
}
