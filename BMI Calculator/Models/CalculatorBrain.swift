// Handles all the calculations related to BMI.
import UIKit

//this will be the brain for all calculations performed
struct CalculatorBrain {
    
    // Declares an optional variable `bmi` of type `BMI`
    var bmi: BMI?
    
    // Calculates the BMI based on the provided height and weight
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        // Divides BMI into 3 ranges for underweight, fit, and overweight, respectively
        if bmiValue < 18.5 {    //underweight
            bmi = BMI(value: bmiValue, advide: "comsume more calories", color: .red)
        }
        else if bmiValue < 25 {     //fit
            bmi = BMI(value: bmiValue, advide: "fit as a fiddle!", color: .blue)
        }
        else {      //overweight
            bmi = BMI(value: bmiValue, advide: "workout more often!", color: .orange)
        }
    }
    
    //this method will return the calculated bmi value (string)
    func getBmiValue() -> String {
        
        let bmiDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiDecimal
    }
    
    // Retrieves advice based on the calculated BMI value
    func getAdvice() -> String {
        //bmi?.advide = if 'bmi' is not nil, then access its advice, else return 'nil'
        return bmi?.advide ?? "No advice"   //provides a default value No advice in case the optional bmi?.advice is nil.
    }
    
    // Retrieves the color representation based on the calculated BMI value
    func getColor() -> UIColor {
        return bmi?.color ?? .white //provides a default color white in case the optional bmi?.color is nil.
    }
}
