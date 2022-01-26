//
//  LastPageViewController.swift
//  projectAcServiceApp
//
//  Created by harsh Khandelwal on 16/06/21.
//

import UIKit
import CoreData

class LastPageViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    var managedObjectContext : NSManagedObjectContext!
    var listOfDetails = [DetailsOfAC]()
    var currentData : DetailsOfAC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        fetchDetailsOfAc()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchDetailsOfAc()
        displayDetails()
    }
    
    func fetchDetailsOfAc (){
        
        let fetchRequest : NSFetchRequest<DetailsOfAC> = DetailsOfAC.fetchRequest()
        
        do{
            listOfDetails = try
                managedObjectContext.fetch(fetchRequest)
            print("data fetch successfully from managedObjectContext")
            printDetails()
        } catch {
            print("Could Not fetch data from managedObjectContext")
        }
    }
    
    func printDetails(){
        for details in listOfDetails {
            print(details.typeAC!)
            print(details.model!)
            print(details.serial!)
            print(details.dateofpurchasing!)
            print(details.purchasedfrom!)
            print(details.installedin!)
            print("***********************************")
        }
    }
    
    func displayDetails() {
        for details in listOfDetails {
            Label.text = "\(details.typeAC!) \n \(details.model!) \n \(details.serial!) \n \(details.dateofpurchasing!) \n \(details.purchasedfrom!)\n \(details.installedin!) \(details.typeAC!) \n \(details.model!) \n \(details.serial!) \n \(details.dateofpurchasing!) \n \(details.purchasedfrom!)\n \(details.installedin!)\(details.typeAC!) \n \(details.model!) \n \(details.serial!) \n \(details.dateofpurchasing!) \n \(details.purchasedfrom!)\n \(details.installedin!)"
            }
    }
    
    func acTypeDisplay(){
       
    }
    
    @IBAction func actionAddButton(_ sender: UIButton) {
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//
//        // Pass the selected object to the new view controller.
//    }
   

}
