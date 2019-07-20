//
//  ViewController.swift
//  JSONTableView
//
//  Created by Brianne Trollo on 2/28/19.
//  Copyright © 2019 Brianne Trollo. All rights reserved.
//
// I pledge my honor that I have abided by the Stevens Honor System.
// Brianne Trollo

import UIKit

struct SuperHero: Decodable {
    let heroName: String
    let name: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var superheroArray = [SuperHero]()
    
    let jsonDataURL = "https://patrickhill.nyc/justiceleague.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getJsonFromURL()
        table.delegate = self
        table.dataSource = self
    }
    
    func getJsonFromURL() {
        let url = URL(string: jsonDataURL)
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            do {
                self.superheroArray = try JSONDecoder().decode([SuperHero].self, from: data!)
                print(self.superheroArray)
            } catch let jsonErr {
                print ("an error happened", jsonErr)
            }
            OperationQueue.main.addOperation {                self.table.reloadData()
            }
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let hero = superheroArray[indexPath.row]
        cell.textLabel?.text="\(hero.name)"
        cell.detailTextLabel?.text = "\(hero.heroName)"
        return cell
    }
    

}

@objc func addList (listName: String) {
    let products = [Product]()
    let newList = ListItem(title: listName, productList: products)
    self.data.insert(newList, at:0)
    print("addList:", data)
    let indexPath:IndexPath = IndexPath(row: 0, section: 0)
    print(indexPath)
    mainList.insertRows(at: [indexPath], with: .automatic)
    mainList.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    self.performSegue(withIdentifier: "product", sender: nil)
}
0073852025859
