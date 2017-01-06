//
//  CDMUsuarioBC.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMUsuarioBC: NSObject {

    
    @discardableResult class func iniciarSesion(_ objUsuario : CDMUsuarioBE, conCompletionCorrecto completioCorrecto : @escaping CDMClosures.Login, conCompletionIncorrecto completionIncorrecto : @escaping CDMClosures.MensajeError) -> URLSessionDataTask?{
        
        if objUsuario.usuario_email?.characters.count == 0 {
            completionIncorrecto("You need enter your email")
            return nil
        }
        
        if objUsuario.usuario_password?.characters.count == 0 {
            completionIncorrecto("You need enter your password")
            return nil
        }
        
        
        return CDMWebModel.iniciarSesion(objUsuario, conCompletionCorrecto: { (objUsuario) in
            
            CDMUsuarioBC.guardarSesion(deUsuario: objUsuario)
            completioCorrecto(objUsuario)
            
        }, error: { (mensajeError) in
            
            completionIncorrecto(mensajeError)
        })
        
    }
    
    
    class func guardarSesion(deUsuario objUsuario : CDMUsuarioBE) -> Void {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.objUsuarioSesion = objUsuario
        
        CDMKeyChain.guardarDataEnKeychain(NSKeyedArchiver.archivedData(withRootObject: objUsuario), conCuenta: "CDMLogin", conServicio: "datosUsuario")
    }
    
    
    
    class func obtenerSesionUsuario() -> CDMUsuarioBE?{
        
        let dataUsuario = CDMKeyChain.dataDesdeKeychainConCuenta("CDMLogin", conServicio: "datosUsuario")
    
        if dataUsuario != nil {
            
            let objUsuario = NSKeyedUnarchiver.unarchiveObject(with: dataUsuario!) as! CDMUsuarioBE
            return objUsuario
        }
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.objUsuarioSesion
    }
    
    
    
    class func eliminarSesionUsuario() -> Void{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.objUsuarioSesion = nil;
        
        CDMKeyChain.eliminarKeychain()
    }
    
}
