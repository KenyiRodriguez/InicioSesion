//
//  CDMClosures.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMClosures: NSObject {

    typealias MensajeError                     = (_ mensajeError : String) -> Void
    typealias MensajeErrorStatus               = (_ mensajeError : String, _ expiroSesion : Bool) -> Void
    typealias Login                            = (_ usuario : CDMUsuarioBE) -> Void
}
