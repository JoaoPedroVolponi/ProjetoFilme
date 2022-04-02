class TarefaCoreDataUtil{
    
    func listar() -> [TarefaModel] {
        
        var listaTarefa : [TarefaModel] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
    
        // Leitura dos dados
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Tarefa")
        
        do{
            let tarefasConsulta = try context.fetch(requisicao)
            
            for t in tarefasConsulta as! [NSManagedObject] {
                
                //print( t.value(forKey: "descricao") as! String )
                //print( t.value(forKey: "autor") as! String )
                //print( t.value(forKey: "ja_realizado") as! Int )
                
                let tm = TarefaModel()
                
                tm.descricao = t.value(forKey: "descricao") as! String
                tm.autor = t.value(forKey: "autor") as! String
                tm.jaRealizado = t.value(forKey: "ja_realizado") as! Int
                
                listaTarefa.append( tm )
            }
        }catch{
            print("Erro ao consultar as Tarefas")
        }
        return listaTarefa
    }
    
}

// Gravar os dados

/*let tarefa = NSEntityDescription.insertNewObject(forEntityName: "Tarefa", into: context)

tarefa.setValue("Estudar iOS", forKey: "descricao")
tarefa.setValue("Fabrizio", forKey: "autor")
tarefa.setValue(1, forKey: "ja_realizado")

do{
    try context.save()
}catch {
    print("Erro ao salvar a Tarefa")
}*/
