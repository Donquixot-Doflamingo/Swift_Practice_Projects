//
//  mainPageOfConverter.swift
//  converterApp
//
//  Created by harsh Khandelwal on 22/05/21.
//

import UIKit
import DropDown

class mainPageOfConverter: UIViewController {
    
    @IBOutlet weak var vwDropDown: UIView!
    @IBOutlet weak var lblTitle: UILabel!

    var valueChoosed: ValueChoosed?
    var optionChoose : String = ""
    
    let dropDown = DropDown()
    let optionArray = ["Length", "Volume", "Weight", "Tempreture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueChoosed = ValueChoosed()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        valueChoosed?.optionChoosen = optionChoose
        let step2VC = segue.destination as! nextPageOfConverter
        step2VC.valueChoosed = valueChoosed 
    }
    
    func loadDropDown(){
        lblTitle.text = "Select the converter"
        dropDown.anchorView = vwDropDown
        dropDown.dataSource = optionArray
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.lblTitle.text = self.optionArray[index]
            self.optionChoose = self.optionArray[index]
        }
        print(self.optionChoose, "option chosen")
    }
    
    @IBAction func showOptions(_ sender: UIButton){
        loadDropDown()
        dropDown.show()
}
    @IBAction func nextButton(_ sender: UIButton) {
    }
}
