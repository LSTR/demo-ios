
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var display : UILabel!
    
    var userisenteringnumbers = false
    
    @IBAction func enternumber(sender : UIButton){
        let digit = sender.currentTitle!
        if userisenteringnumbers{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userisenteringnumbers = true
        }
    }
    
    var operandStack = Array<Double>()
    @IBAction func enter(){
        userisenteringnumbers = false
        operandStack.append(displayValue)
        print("openStack = \(operandStack)")
    }
    
    var displayValue : Double {
        get{
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userisenteringnumbers = false
        }
    }
    
    @IBAction func clear(){
        displayValue = 0
        display.text = "\(displayValue)"
        
    }
    
    @IBAction func operate(sender : UIButton){
        let operation = sender.currentTitle!
        
        if(userisenteringnumbers){
            enter()
        }
        
        switch operation {
            case "+":performOperation {$0 + $1}
            case "-":performOperation {$0 - $1}
            case "X":performOperation {$0 * $1}
            case "/":performOperation {$0 / $1}
            default: break
        }
    }
    
    func performOperation (operation:(Double,Double) -> Double){
        if(operandStack.count >= 2){
            displayValue  = operation(operandStack.removeLast(),operandStack.removeLast())
            
            enter()
        }
    }
    
//    func performOperation (operation:Double -> Double){
//        if(operandStack.count >= 1){
//            displayValue  = operation(operandStack.removeLast())
//            
//            enter()
//        }
//    }
    
    func add (op1:Double, op2: Double) -> Double{
        return op1+op2;
    }
    
    func substarct (op1:Double, op2: Double) -> Double{
        return op1-op2;
    }
    
    func multiply (op1:Double, op2: Double) -> Double{
        return op1*op2;
    }
    
    func divide (op1:Double, op2: Double) -> Double{
        return op1/op2;
    }
}