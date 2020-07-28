//
//  ViewController.swift
//  ThemovieDBwithMoya
//
//  Created by TeddyKwak on 2020/07/27.
//  Copyright © 2020 TeddyKwak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableview: UITableView!
    
    var currentMovies: [Movie] = []
    var getNewMovies: [Movie] = []
    var getTopRatedMovies: [Movie] = []
    var filteredMovies = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovies()
    }
    
    func getMovies(){
        API.getNewMovie(page: 1, completion: { movies in
            self.getNewMovies = movies
            self.tableview.reloadData()
        })
        API.getTopTated(page: 1) { movies in
            self.getTopRatedMovies = movies
            self.tableview.reloadData()
        }
    }



}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.getNewMovies.count
        } else {
            return self.getTopRatedMovies.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableview.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            
            cell.textLabel?.text = getNewMovies[indexPath.row].title
            cell.detailTextLabel?.text = DF.format(date: getNewMovies[indexPath.row].releaseDate)
            
            return cell
        }
        let cell = tableview.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
        
        cell.textLabel?.text = getTopRatedMovies[indexPath.row].title
        cell.detailTextLabel?.text = DF.format(date: getTopRatedMovies[indexPath.row].releaseDate)
        
        return cell

    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "getNewMovies"
        }
        return "getTopRatedMovies"
    }
    
}

