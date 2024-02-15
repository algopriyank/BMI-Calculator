// Displays the result of the BMI calculation
import UIKit

class ResultViewController: UIViewController {
    
    // Declares optional variables to store BMI-related data
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    // Outlets
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets up the displayed BMI value, advice, and background color after the view loads up
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    // Dismisses the result view, allowing users to recalculate their BMI
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
