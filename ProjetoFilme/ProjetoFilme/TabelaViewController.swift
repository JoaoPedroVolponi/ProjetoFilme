//
//  TabelaViewController.swift
//  ProjetoFilme
//
//  Created by user217328 on 3/29/22.
//


import UIKit

class TabelaViewController : UITableViewController{
    
    let filmes : [String] = ["Tá Dando Onda", "Ataque dos Cães", "Através da Minha Janela","Alerta Vermelho","Army of Thieves"]
    
    let descricaoFilmes = ["Nome do Filme: Tá Dando Onda , Ano de Lançamento: 2007 , Diretor: Chris Buck,Ash Brannon , Gênero: Comédia , Duração: 1h 25m ", "Nome do Filme: Ataque dos Cães,Ano de Lançamento: 2021, Diretor: Jane Campion , Gênero: Faroeste/Drama , Duração: 2h 5m", "Nome do Filme: Através da Minha Janela , Ano de Lançamento : 2022 , Diretor: Marçal Forès , Gênero: Romance , Duração: 1h 56m  ", "Nome do Filme: Alerta Vermelho , Ano de Lançamento: 2021 , Diretor: Rawson Marshall Thurber , Gênero: Ação/Comédia , Duração: 1h 58m  ", "Nome do Filme: Army of Thieves , Ano de Lançamento: 2021 , Diretor: Matthias Schweighöfer , Gênero: Suspense , Duração: 2h 7m "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        
        celula.textLabel?.text = filmes[indexPath.row]
        
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(descricaoFilmes[indexPath.row])
        
        let alerta = UIAlertController(title: filmes[indexPath.row], message: descricaoFilmes[indexPath.row], preferredStyle: .alert)
        
        let confirmar = UIAlertAction(title: "Assistir", style: .default, handler: nil)
        
        alerta.addAction(confirmar)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
