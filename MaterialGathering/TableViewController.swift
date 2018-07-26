//
//  TableViewController.swift
//  MaterialGathering
//
//  Created by T. Jimbo on 2018/07/26.
//  Copyright © 2018年 TakJim. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var materialTableView: UITableView!
    
    var materials:[Material] = []
    var materialsToShow:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        materialTableView.dataSource = self
        materialTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        
        materialTableView.reloadData()
    }

    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let fetchRequest: NSFetchRequest<Material> = Material.fetchRequest()
            materials = try context.fetch(fetchRequest)
            
            for material in materials {
                materialsToShow.append(material.text!)
            }
        } catch {
            print("Fetching Failed.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialsToShow.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellData = materialsToShow[indexPath.row]
    
        cell.textLabel?.text = "\(cellData)"
    
        return cell
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
