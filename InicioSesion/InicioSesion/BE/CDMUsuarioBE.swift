//
//  CDMUsuarioBE.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMUsuarioBE: NSObject, NSCoding {
    
    
    var usuario_id                  : String?
    var usuario_name                : String?
    var usuario_lastname            : String?
    var usuario_email               : String?
    var usuario_password            : String?
    
    
    override init() {
        super.init()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        self.usuario_id                 = aDecoder.decodeObject(forKey: "usuario_id")               as? String
        self.usuario_name               = aDecoder.decodeObject(forKey: "usuario_name")             as? String
        self.usuario_lastname           = aDecoder.decodeObject(forKey: "usuario_lastname")         as? String
        self.usuario_email              = aDecoder.decodeObject(forKey: "usuario_email")            as? String
        self.usuario_password           = aDecoder.decodeObject(forKey: "usuario_password")         as? String
        
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.usuario_id,                  forKey: "usuario_id")
        aCoder.encode(self.usuario_name,                forKey: "usuario_name")
        aCoder.encode(self.usuario_lastname,            forKey: "usuario_lastname")
        aCoder.encode(self.usuario_email,               forKey: "usuario_email")
        aCoder.encode(self.usuario_password,            forKey: "usuario_password")

    }

}
