//
//  nextPageOfConverter.swift
//  converterApp
//
//  Created by harsh Khandelwal on 22/05/21.
//

import UIKit
import DropDown

//problem -: Not able to read the dropButton choosed in the previous page

class nextPageOfConverter: UIViewController {
    
    
    var unitOptionArray : [String] = []
    var valueChoosed: ValueChoosed?
    var option : String?
    //dropdown help
    @IBOutlet weak var DropDownUnit1: UIView!
    @IBOutlet weak var converterUnit1: UILabel!
    @IBOutlet weak var DropDownUnit2: UIView!
    @IBOutlet weak var converterUnit2: UILabel!
    //the other fields than drop downs
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    //outlets added
    let dropDown1 = DropDown()
    var input : Double? = 0
    
    // Deciding the optionarray according to the option choosen
    func decidingArray() -> [String] {
        //if not working add _choosedOption : onlyOption in parameters and remove if else case and uncomment
        //self.option = "Length"
        
        if self.option == "Length" {
            unitOptionArray = ["Inches", "Feet", "Yards", "Miles", "Millimeters", "Centimeters", "Meters", "Kilometers"]
            return unitOptionArray
        }
        else if self.option == "Volume" {
            unitOptionArray = ["Teaspoon", "Tablespoon", "Cups", "Quarts", "Gallons", "Milliliters", "Deciliters", "Liters"]
            return unitOptionArray
        }
        else if self.option == "Weight" {
            unitOptionArray = ["Pounds", "Ounces", "Stone", "Milligrams", "Grams", "Kilograms", "Tons"]
            return unitOptionArray
        }
        else if self.option == "Tempreture" {
            unitOptionArray = ["Kelvin", "Celcius", "Farenheit"]
            return unitOptionArray
        }
        else{
            unitOptionArray = ["No", "Aray", "Recieved"]
            return unitOptionArray

        }
    
    }
    //dropDown Options here
    func loadUnitDropDown(_label : UILabel , _view : UIView)  {
        unitOptionArray = decidingArray()
        dropDown1.anchorView = _view
        dropDown1.dataSource = unitOptionArray
        // Top of drop down will be below the anchorView
        dropDown1.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown1.topOffset = CGPoint(x: 0, y:-(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown1.direction = .bottom
        //now deciding the label choosen
        dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            _label.text = unitOptionArray[index]
        }
    }
    
    //To swap the values
    func swapFunc() {
        var unit1 : String? = converterUnit1.text
        var unit2 : String? = converterUnit2.text
        
        swap(&unit1, &unit2)
        
        converterUnit1.text = unit1
        converterUnit2.text = unit2
    }
    
    // stroring Input
    func storeInput(inputNumber : inout Double?) {
        guard let inputText = inputField.text else {
            print("Invalid Input in field")
            return
        }
        inputNumber = Double(inputText)
    }
    
    func calculateTheValues() {
        //if not working add _choosedOption : onlyOption intead of string in parameters
        var result : Double = 0
        storeInput(inputNumber: &input)
        guard let input_ = input else {
            print("Invalid Input")
            return
        }
        //remove all the "" and add . to make then enum
        
        //calculating if the option choosed is length
        if self.option == "Length" {
            //for inches
            if converterUnit1.text == "Inches" {
                if converterUnit2.text == "Feet" {
                    result = input_ / 12
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ / 36
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ / 63360
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 25.4
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ * 2.54
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ / 39.37
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 39370
                }
                else{
                    result = input_
                }
            }
            // for feet
            else if converterUnit1.text == "Feet" {
                if converterUnit2.text == "Inches" {
                    result = input_ * 12
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ / 3
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ / 5280
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 305
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ * 30.48
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ / 3.281
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 3281
                }
                else{
                    result = input_
                }
        }
            //for yards
            else if converterUnit1.text == "Yards" {
                if converterUnit2.text == "Inches" {
                    result = input_ * 36
                }
                else if converterUnit2.text == "Feet"{
                    result = input_ * 3
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ / 1760
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 914
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ * 91.44
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ / 1.094
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 1094
                }
                else{
                    result = input_
                }
            }
            // for miles
            else if converterUnit1.text == "Miles" {
                if converterUnit2.text == "Inches" {
                    result = input_ * 63360
                }
                else if converterUnit2.text == "Feet" {
                    result = input_ * 5280
                }
                else if converterUnit2.text == "Yards" {
                    result = input_ * 1760
                }
                else if converterUnit2.text == "Millimeters" {
                    result = input_ * 1.609e+6
                }
                else if converterUnit2.text == "Centimeters" {
                    result = input_ * 160934
                }
                else if converterUnit2.text == "Meters" {
                    result = input_ * 1609
                }
                else if converterUnit2.text == "Kilometers" {
                    result = input_ *  1.609
                }
                else{
                    result = input_
                }
            }
            // for millimeters
            else if converterUnit1.text ==  "Millimeters"{
                if converterUnit2.text == "Inches" {
                    result = input_ / 25.4
                }
                else if converterUnit2.text == "Feet"{
                    result = input_ / 305
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ / 914
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ /  1.609e+6
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ / 10
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ / 1000
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 1e+6
                }
                else{
                    result = input_
                }
            }
            // for centimeters
            else if converterUnit1.text ==  "Centimeters"{
                if converterUnit2.text == "Inches" {
                    result = input_ / 2.54
                }
                else if converterUnit2.text == "Feet"{
                    result = input_ / 30.48
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ / 91.44
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ /  160934
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 10
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ / 100
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 100000
                }
                else{
                    result = input_
                }
            }
            // for meters
            else if converterUnit1.text ==  "Meters"{
                if converterUnit2.text == "Inches" {
                    result = input_ * 39.37
                }
                else if converterUnit2.text == "Feet"{
                    result = input_ * 3.281
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ * 1.094
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ /  1609
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 1000
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ * 100
                }
                else if converterUnit2.text == "Kilometers"{
                    result = input_ / 1000
                }
                else{
                    result = input_
                }
            }
            // for kilometers
            else if converterUnit1.text ==  "Kilometers"{
                if converterUnit2.text == "Inches" {
                    result = input_ * 39370
                }
                else if converterUnit2.text == "Feet"{
                    result = input_ * 3281
                }
                else if converterUnit2.text == "Yards"{
                    result = input_ * 1094
                }
                else if converterUnit2.text == "Miles"{
                    result = input_ / 1.609
                }
                else if converterUnit2.text == "Millimeters"{
                    result = input_ * 1e+6
                }
                else if converterUnit2.text == "Centimeters"{
                    result = input_ * 100000
                }
                else if converterUnit2.text == "Meters"{
                    result = input_ * 1000
                }
                else{
                    result = input_
                }
            }
        }
        //calculating if the option choosed is volume
        else if self.option == "Volume" {
            // for teaspoon
            if converterUnit1.text == "Teaspoon" {
                if converterUnit2.text == "Tablespoon" {
                    result = input_ / 3
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ / 48.692
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ / 192
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 768
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 4.929
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ / 20.288
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 203
                }
                else{
                    result = input_
                }
            }
            // for tablespoon
            else if converterUnit1.text == "Tablespoon" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 3
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ / 16.231
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ / 64
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 256
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 14.787
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ / 6.763
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 67.628
                }
                else{
                    result = input_
                }
            }
            // for cups
            else if converterUnit1.text == "Cups" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 48.692
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ * 16.231
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ / 3.943
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 15.773
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 240
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ * 2.4
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 4.167
                }
                else{
                    result = input_
                }
            }
            // for Quarts
            else if converterUnit1.text == "Quarts" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 192
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ * 64
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ * 3.943
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 4
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 946
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ * 9.464
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 1.057
                }
                else{
                    result = input_
                }
            }
            // for Gallons
            else if converterUnit1.text == "Gallons" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 768
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ * 256
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ * 15.773
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ * 4
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 3785
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ * 37.854
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ * 3.785
                }
                else{
                    result = input_
                }
            }
            //for milliliters
            else if converterUnit1.text == "Milliliters" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ / 4.929
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ / 14.787
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ / 240
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ / 946
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 3785
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ / 100
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 1000
                }
                else{
                    result = input_
                }
            }
            //for deciliters
            else if converterUnit1.text == "Deciliters" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 20.288
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ * 6.763
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ / 2.4
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ / 9.464
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 37.854
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 100
                }
                else if converterUnit2.text == "Liters"{
                    result = input_ / 10
                }
                else{
                    result = input_
                }
            }
            //for liters
            else if converterUnit1.text == "Liters" {
                if converterUnit2.text == "Teaspoon" {
                    result = input_ * 203
                }
                else if converterUnit2.text == "Tablespoon"{
                    result = input_ * 67.628
                }
                else if converterUnit2.text == "Cups"{
                    result = input_ * 4.167
                }
                else if converterUnit2.text == "Quarts"{
                    result = input_ * 1.057
                }
                else if converterUnit2.text == "Gallons"{
                    result = input_ / 3.785
                }
                else if converterUnit2.text == "Milliliters"{
                    result = input_ * 1000
                }
                else if converterUnit2.text == "Deciliters"{
                    result = input_ * 10
                }
                else{
                    result = input_
                }
            }
        }
        // calculating if the option choosed is weight
        else if self.option == "Weight" {
            // for pounds
            if converterUnit1.text == "Pounds" {
                if converterUnit2.text == "Ounces" {
                    result = input_ * 16
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ / 14
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 453592
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ * 454
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ / 2.205
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 2205
                }
                else{
                    result = input_
                }
            }
            // for Ounces
            else if converterUnit1.text == "Ounces" {
                if converterUnit2.text == "Pounds" {
                    result = input_ / 16
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ / 224
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 28350
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ * 28.35
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ / 35.274
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 35274
                }
                else{
                    result = input_
                }
            }
            // for stones
            else if converterUnit1.text == "Stone" {
                if converterUnit2.text == "Pounds" {
                    result = input_ * 14
                }
                else if converterUnit2.text == "Ounces"{
                    result = input_ * 224
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 6.35e+6
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ * 6350
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ * 6.35
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 157
                }
                else{
                    result = input_
                }
            }
            // for Miligrams
            else if converterUnit1.text == "Milligrams" {
                if converterUnit2.text == "Pounds" {
                    result = input_ / 453592
                }
                else if converterUnit2.text == "Ounces"{
                    result = input_ / 28350
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ / 6.35e+6
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ / 1000
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ / 1e+6
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 1e+9
                }
                else{
                    result = input_
                }
            }
            // for Grams
            else if converterUnit1.text == "Grams" {
                if converterUnit2.text == "Pounds" {
                    result = input_ / 454
                }
                else if converterUnit2.text == "Ounces"{
                    result = input_ / 28.35
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ / 6350
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 1000
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ / 1000
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 1e+6
                }
                else{
                    result = input_
                }
            }
            // for Kilograms
            else if converterUnit1.text == "Kilograms" {
                if converterUnit2.text == "Pounds" {
                    result = input_ / 2.205
                }
                else if converterUnit2.text == "Ounces"{
                    result = input_ * 35.274
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ / 6.35
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 1e+6
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ * 1000
                }
                else if converterUnit2.text == "Tons"{
                    result = input_ / 1000
                }
                else{
                    result = input_
                }
            }
            // for tonnes --
            else if converterUnit1.text == "Tons" {
                if converterUnit2.text == "Pounds" {
                    result = input_ * 2205
                }
                else if converterUnit2.text == "Ounces"{
                    result = input_ * 35274
                }
                else if converterUnit2.text == "Stone"{
                    result = input_ * 157
                }
                else if converterUnit2.text == "Milligrams"{
                    result = input_ * 1e+9
                }
                else if converterUnit2.text == "Grams"{
                    result = input_ * 1e+6
                }
                else if converterUnit2.text == "Kilograms"{
                    result = input_ * 1000
                }
                else{
                    result = input_
                }
            }
        }
        else if self.option == "Tempreture" {
            //For kelvin
            if converterUnit1.text == "Kelvin" {
                if converterUnit2.text == "Celcius" {
                    result = input_ - 273.15
                }
                else if converterUnit2.text == "Farenheit"{
                    result = (input_ - 273.15) * 9/5 + 32
                }
                else{
                    result = input_
                }
            }
            //For Farenheit
            else if converterUnit1.text == "Farenheit"{
                if converterUnit2.text == "Celcius" {
                    result = (input_ - 32) * 5/9
                }
                else if converterUnit2.text == "Kelvin"{
                    result = (input_ - 32) * 5/9 + 273.15
                }
                else{
                    result = input_
                }
            }
            //For Celcius
            else{
                if converterUnit2.text == "Farenheit" {
                    result = (9/5 * input_) + 32
                }
                else if converterUnit2.text == "Kelvin"{
                    result =  input_ + 273.15
                }
                else{
                    result = input_
                }
            }
            
        }
        
        outputLabel.text = String(result)
    }
    // viewDidLoad func - status Working
    override func viewDidLoad() {
        super.viewDidLoad()
        option = valueChoosed?.optionChoosen
        converterUnit2.text = "Select the Unit"
        converterUnit1.text = "Select the Unit"
        // Do any additional setup after loading the view.
    }
    //swap button - status Working
    @IBAction func swapButton(_ sender: UIButton) {
        swapFunc()
        calculateTheValues()
    }
    // deciding the unit 1 - status Working
    @IBAction func unitOptions1(_ sender: UIButton) {
        loadUnitDropDown(_label: converterUnit1, _view: DropDownUnit1)
        dropDown1.show()
    }
    // deciding the unit 2 - status Working
    @IBAction func unitOptions2(_ sender: UIButton) {
        loadUnitDropDown(_label: converterUnit2, _view: DropDownUnit2)
        dropDown1.show()
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        calculateTheValues()
        inputField.isHidden = true
    }
    //start over button - status Working
    @IBAction func startOverButton(_ sender: UIButton) {
        inputField.text?.removeAll()
        converterUnit2.text = "Select the Unit"
        converterUnit1.text = "Select the Unit"
    }
}
