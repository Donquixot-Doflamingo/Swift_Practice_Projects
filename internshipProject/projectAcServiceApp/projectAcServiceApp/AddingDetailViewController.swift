//
//  AddingDetailViewController.swift
//  projectAcServiceApp
//
//  Created by harsh Khandelwal on 16/06/21.
//

// all details of AC are saved to database

import UIKit
import CoreData
import DropDown

class AddingDetailViewController: UIViewController {
// taking all the outlets
    //for dropdown button
    @IBOutlet weak var selectAcType: UIButton!
    @IBOutlet weak var vwDropDown: UIView!
    @IBOutlet weak var dropDownTitle: UILabel!
    //for ac model
    @IBOutlet weak var inputAcModel: UITextField!
    // for serial number
    @IBOutlet weak var inputSerialNumbet: UITextField!
    @IBOutlet weak var purchasedDate: UITextField!
    //for installed place
    @IBOutlet weak var inputInstalledPlace: UITextField!
    //for purchased from
    @IBOutlet weak var inputPurchasedFrom: UITextField!
    
    
    //for saving details in database
    var managedObjectContext : NSManagedObjectContext!
    
    //for dropDown Button
    let dropDown = DropDown()
    let dropDownValues = ["Split AC", "Window AC"]
    var acTypeValue : String = ""
    
    // for purchased date
    let datepicker = UIDatePicker()
    var purchasedDateValue : String = ""
    
    //for rest of the input texts
    
    // to store the input values as i am using inout variables to store the text inputs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
     //to save data to database
    func saveDataForAcDetails(modelNumber : String, serialNumber : String, installedPlace : String, purchasedFrom : String, ACType : String, purchasedDate : String) {
        let acdetails = NSEntityDescription.insertNewObject(forEntityName: "DetailsOfAC", into: managedObjectContext) as! DetailsOfAC
        acdetails.dateofpurchasing = purchasedDateValue
        acdetails.typeAC = acTypeValue
        acdetails.installedin = installedPlace
        acdetails.purchasedfrom = purchasedFrom
        acdetails.serial = serialNumber
        acdetails.model = modelNumber
        do {
            try managedObjectContext.save()
            print("sucessfully saved managedObjectContext state")
        } catch {
            print("could not save managedObjectContext state, details not stored")
        }
        
    }
    
//dropDown Function
    func loadDropDown(){
        dropDownTitle.text = "Select AC Type"
        dropDown.anchorView = vwDropDown
        dropDown.dataSource = dropDownValues
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
        self.dropDownTitle.text = dropDownValues[index]
            self.acTypeValue = dropDownValues[index]
        }
    }
// acTypeButton
    @IBAction func AcTypeDropdown(_ sender: UIButton) {
        loadDropDown()
        dropDown.show()
    }
// inputs for purchased date
    //creating date picker
    func createDatePicker(){
        //for aligning the text
        purchasedDate.textAlignment = .center
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([donebtn], animated: true)
        
        //assign toolbar
        purchasedDate.inputAccessoryView = toolbar
        
        // assign datepicker to the text field
        purchasedDate.inputView = datepicker
        
        //date picker mode
        datepicker.datePickerMode = .date
    }
    //action on done pressed
    @objc func donePressed() {
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        purchasedDate.text = formatter.string(from: datepicker.date)
        purchasedDateValue = formatter.string(from: datepicker.date)
        self.view.endEditing(true)
    }

// saving inputs

// for ADD AC button
    @IBAction func addDetailsBtn(_ sender: UIButton) {
        guard let serialNumber = inputSerialNumbet.text else {
            print("wring input")
            return
        }
        guard let modelNumber = inputAcModel.text else {
            print("wring input")
            return
        }
        guard let purchasedFrom = inputPurchasedFrom.text else {
            print("wring input")
            return
        }
        guard let installedPlace = inputInstalledPlace.text else {
            print("wring input")
            return
        }
        saveDataForAcDetails(modelNumber: modelNumber, serialNumber: serialNumber, installedPlace: installedPlace, purchasedFrom: purchasedFrom, ACType: self.acTypeValue, purchasedDate: self.purchasedDateValue)
    }
    
}
