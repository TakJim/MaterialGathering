//
//  ViewController.swift
//  MaterialGathering
//
//  Created by T. Jimbo on 2018/07/26.
//  Copyright © 2018年 TakJim. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
    var count: Double = 0.0
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var material: Material?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? StatisticsViewController else { return }
        
        destinationViewController.test_data[0] = count
    }


    @IBAction func addButtonTapped(_ sender: Any) {
        let material1Text = firstTextField.text
        let material2Text = secondTextField.text
        let material3Text = thirdTextField.text
        
        if material1Text != "" {
            if material == nil {
                material = Material(context: context)
            }
            if let material = material {
                material.text = material1Text
            }
            
            count += 1
        }
        
        
        if material2Text != "" {
            if material == nil {
                material = Material(context: context)
            }
            if let material = material {
                material.text = material3Text
            }
            
            count += 1
        }
        
        
        if material3Text != "" {
            if material == nil {
                material = Material(context: context)
            }
            if let material = material {
                material.text = material2Text
            }
            
            count += 1
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

