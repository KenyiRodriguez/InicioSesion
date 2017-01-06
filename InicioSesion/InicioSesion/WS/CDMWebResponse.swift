//
//  CDMWebResponse.swift
//  Survey
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class CDMWebResponse: NSObject {
    
    var respuestaJSON   : Any?
    var statusCode      : NSInteger?
    var respuestaNSData : Data?
    var error           : NSError?
    var datosCabecera   : NSDictionary?
    var token           : NSString?
    var cookie          : NSString?
    
}
