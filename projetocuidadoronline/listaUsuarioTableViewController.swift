//
//  listaUsuarioTableViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 01/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import UIKit
import CoreData

class listaUsuarioTableViewController: UITableViewController {
    
    var myuser:Usuarios?
    var dadoscadastrados: [NSManagedObject] = []
    
    var gerennciarObjetos: NSManagedObjectContext!
    
    var fetchResultController: NSFetchedResultsController<Usuarios>!
    var usuariosCadastrados = [Usuarios]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gerennciarObjetos = appDelegate.persistentContainer.viewContext
        
        
        recuperardados()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recuperardados()
       // self.tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.usuariosCadastrados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let usuario = self.usuariosCadastrados[indexPath.row]
        
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath )
  
        
        /*celula.textLabel?.text = usuario.nomeUsuario
        
        celula.textLabel?.text = usuario.email
        
        celula.textLabel?.text = usuario.numeroContato
        
        celula.textLabel?.text = usuario.nomePessoaCuidada*/
        
        celula.textLabel?.text = usuario.nomeUsuario
        
        return celula
        
    }
    
    func confirmarExcluirUsuario (action : UITableViewRowAction, indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: nil,
                                                message: "Deseja realmente excluir?",
                                                preferredStyle: .actionSheet)
        
        let actionSim = UIAlertAction(title: "Sim",
                                      style: .destructive) { (action) in
                                        
                                      let usuario = self.fetchResultController.object(at: indexPath)
                                      self.gerennciarObjetos.delete(usuario)
                                        if let _ = try? self.gerennciarObjetos.save() {
                                            
                                        }
                                      
        }
        
        let actionCancelar = UIAlertAction(title: "Não",
                                           style: .default,
                                           handler: nil)
        
        
        alertController.addAction(actionSim)
        alertController.addAction(actionCancelar)
        
        self.present(alertController,
                      animated: true,
                      completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionCancelar = UITableViewRowAction(style: .destructive,
                                                  title: "Excluir") { (action, indexPath) in
                                                self.confirmarExcluirUsuario(action: action, indexPath: indexPath)
        }
        
        return [actionCancelar]
    }
    
    
    func recuperardados(){
       // var _: Usuarios
        
        /*let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        
        //let requisitarusuarios = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios", into: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) as! Usuarios
        
        do {
            
            let dadosRecuperados = try gerennciarObjetos.fetch( requisicao )
            self.dadoscadastrados = dadosRecuperados as! [NSManagedObject]
            
            self.tableView.reloadData()
            
            
        //   _ = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext as! [Usuarios ]
        
        
        }catch let erro as NSError{
            print("Erro ao listat Usuarios ERRO: \(erro.description)")
            
        }*/
        
        let fetchRequest: NSFetchRequest<Usuarios> = Usuarios.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nomeUsuario", ascending: true)]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                           managedObjectContext: gerennciarObjetos,
                                                           sectionNameKeyPath: nil,
                                                           cacheName: nil)
        fetchResultController.delegate = self
        
        if let _ = try? fetchResultController.performFetch() {
            if let usuarios = fetchResultController.fetchedObjects {
                usuariosCadastrados = usuarios
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension listaUsuarioTableViewController : NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if type == .delete {
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        if let usuarios = controller.fetchedObjects {
            self.usuariosCadastrados = usuarios as! [Usuarios]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
}

