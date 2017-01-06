//
//  CDMWebTranslator.swift
//  Survey
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class CDMWebTranslator: NSObject {
    
    
    class func translateUsuarioBE(_ objDic : NSDictionary) -> CDMUsuarioBE{
        
        let objBE = CDMUsuarioBE()
        
        objBE.usuario_id                = objDic["id"] as? String
        objBE.usuario_name              = objDic["name"] as? String
        objBE.usuario_lastname          = objDic["name"] as? String
        objBE.usuario_email             = objDic["email"] as? String
        
        return objBE
        
    }
    
}
