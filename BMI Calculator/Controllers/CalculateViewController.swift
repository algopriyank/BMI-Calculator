//managing the main/first screen

import UIKit

class CalculateViewController: UIViewController {
    
    //// Manages BMI calculations.
    var calculatorBrain = CalculatorBrain()
    // UI elements
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //do any action after the view loads up
    }

    //gets triggered when we move the height slider
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //converting/formating height value into a float with 2 decimal places
        let height = String(format: "%.2f", sender.value)
        //changing the height lable in real time
        heightLable.text = "\(height)m"
    }
    
    //gets triggered when we move the weight slider
    @IBAction func weightSliderchanged(_ sender: UISlider) {
        //converting/formating weight value into a float with 1 decimal places
        let weight = String(format: "%.1f", sender.value)
        //changing the height lable in real time
        weightLable.text = "\(weight)kg"
    }
    
    //gets triggered when we press the calculate button
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        //passes values of height slider and weight slider to the 'calculateBmi' function of calculatorBrain
        calculatorBrain.calculateBmi(height: heightSlider.value, weight: weightSlider.value)
        // Initiate a transition to the result screen.
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // Prepare for transitioning to the result screen and pass BMI-related data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            // Pass calculated BMI value, advice, and color to the ResultViewController.
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}
