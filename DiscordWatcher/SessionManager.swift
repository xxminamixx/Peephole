//
//  SessionManager.swift
//  DiscordWatcher
//
//  Created by 南　京兵 on 2018/01/05.
//  Copyright © 2018年 kyohei.minami. All rights reserved.
//

import UIKit
import Alamofire

class SessionManager: NSObject {
    
    static let shared = SessionManager()

    func setting() {
        let const = APIConst()
        Alamofire.request(const.baseURL + const.oauthBasic + const.clientId, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON(completionHandler: { respons in
            
            switch respons.result {
            case .success: break
            case .failure: break
            }
        })
    }
    
}
