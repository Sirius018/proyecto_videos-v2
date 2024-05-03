
import UIKit
import Alamofire

class ProfesorViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tvProfesor: UITableView!
    var arregloProfesores:[Profesor]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarProfesores()
        tvProfesor.dataSource=self
        tvProfesor.rowHeight=120
        
        NotificationCenter.default.addObserver(self, selector: #selector(actualizarListaProfesores), name: Notification.Name("ProfesorGuardado"), object: nil)
    }
    
    @objc func actualizarListaProfesores() {
            cargarProfesores()
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloProfesores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let v2=tvProfesor.dequeueReusableCell(withIdentifier: "item") as! ItemProfesorTableViewCell
        v2.lblIdProfesor .text="CODIGO : "+String(arregloProfesores[indexPath.row].idProfesor)
        v2.lblNombreProfesor.text="NOMBRE : "+arregloProfesores[indexPath.row].nombreProfesor
        return v2
        
    }
    func cargarProfesores(){
            AF.request("https://api-moviles-2.onrender.com/profesores")
                .responseDecodable(of: [Profesor].self){ x in
                    guard let info=x.value else {return}
                    self.arregloProfesores=info
                    self.tvProfesor.reloadData()
                }
    }
    
    @IBAction func btnVolver(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func btnNuevoProfesor(_ sender: UIButton) {
        performSegue(withIdentifier: "lkNuevoProfesor", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pantallaP=segue.destination as! NuevoProfesorViewController
    }
    
}
