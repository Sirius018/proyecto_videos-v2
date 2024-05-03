
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtClave.isSecureTextEntry = true 
    }


    @IBAction func btnIniciar(_ sender: UIButton) {
        if txtUsuario.text?.isEmpty ?? true || txtClave.text?.isEmpty ?? true {
                // alerta para ingresar datos
                mostrarAlerta(mensaje: "Por favor ingrese usuario y clave")
            } else {
                let ema, pas:String
                ema = txtUsuario.text ?? ""
                pas = txtClave.text ?? ""
                let alu = Alumno(id: 0, nombre: "", apellido: "", rol: "", email: ema, password: pas)
                let res  = ControladorAlumno().find(bean: alu)
                //
                if res.first?.id != 0 {
                    // todo ok
                    performSegue(withIdentifier: "menu", sender: nil)
                }
            }
        
        
    }
    
    
    
    
    func mostrarAlerta(mensaje: String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
}

