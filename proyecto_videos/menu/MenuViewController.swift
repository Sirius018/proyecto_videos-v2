import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var btnCursos: UIButton!
    @IBOutlet weak var btnAlumnos: UIButton!
    @IBOutlet weak var btnMisCursos: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func btnCurso(_ sender: UIButton) {
        //performSegue(withIdentifier: "datos", sender: nil)
        
    }
    
    
    @IBAction func btnAlumno(_ sender: UIButton) {
        //performSegue(withIdentifier: "datos", sender: nil)
    }
    
    @IBAction func btnProfesor(_ sender: UIButton) {
        performSegue(withIdentifier: "lkProfesor", sender: nil)
            
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="lkProfesor" {
            let pantallaP=segue.destination as! ProfesorViewController
            //pantallaP.info=bean
        }
    }
    
    
}
