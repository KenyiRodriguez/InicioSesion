//
//  CDMLoginViewController.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMLoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var imgLogo                          : UIImageView!
    @IBOutlet weak var constraintCentroContenido        : NSLayoutConstraint!
    @IBOutlet weak var txfUsuario                       : UITextField!
    @IBOutlet weak var txfPassword                      : UITextField!
    @IBOutlet weak var vistaFormulario                  : UIView!
    @IBOutlet weak var actividadCargando                : UIActivityIndicatorView!
    
    var valorInicialConstraintFormulario : CGFloat?
    
    
    
    @IBAction func tapCerrarTeclado(_ sender: AnyObject?) {
        
        self.view.endEditing(true)
    }
    
    
    @IBAction func clickBtnInciarSesion(_ sender: Any?) {
        
        self.tapCerrarTeclado(nil)
        
        let objUsuario = CDMUsuarioBE()
        objUsuario.usuario_email = self.txfUsuario.text
        objUsuario.usuario_password = self.txfPassword.text
        
        
        self.actividadCargando.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        CDMUsuarioBC.iniciarSesion(objUsuario, conCompletionCorrecto: { (objUsuario) in
            
            self.actividadCargando.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            self.dismiss(animated: true, completion: nil)
            
        }, conCompletionIncorrecto: { (mensajeError) in
            
            self.actividadCargando.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "Aceptar", enControlador: self, conCompletion: nil)
        })
    }
    
    
    //MARK: - UITextFieldDelegate
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if self.txfUsuario == textField {
            self.txfPassword.becomeFirstResponder()
        }else{
            self.clickBtnInciarSesion(nil)
        }
        
        return true
    }
    
  
    
    
    //MARK: - Notificación telcado
    
    
    func keyboardWillShown(notification : NSNotification) -> Void{
        
        let kbSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        
        let finalFormulario = self.vistaFormulario.frame.size.height / 2 + self.valorInicialConstraintFormulario!
        let tamanoPantalla = UIScreen.main.bounds.size.height / 2
        let areaDisponible = tamanoPantalla - (kbSize?.height)!
        
        if finalFormulario > areaDisponible {
            
            UIView.animate(withDuration: 0.35, animations: {
                
                self.constraintCentroContenido.constant = self.valorInicialConstraintFormulario! - (finalFormulario - areaDisponible) - 2
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    
    func keyboardWillBeHidden(notification : NSNotification) -> Void {
        
        UIView.animate(withDuration: 0.35, animations: {
            
            self.constraintCentroContenido.constant = self.valorInicialConstraintFormulario!
            self.view.layoutIfNeeded()
        })
    }
    
    
    //MARK: - Controller
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.valorInicialConstraintFormulario = self.constraintCentroContenido.constant
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
