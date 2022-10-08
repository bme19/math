//MATH PROGRAM V 1.0
import Foundation
import Darwin

public struct math {
    
    public init() {
        print("Welcome to the Math Program. Select an option:  \n1. Prime Number Finder \n2. Unit Converter \n3. Factorial Calculator")
        var input:Int?
        input = Int(readLine()!)
        

        if(input == 1){
            primeNums()
        }
        else if(input == 2){
            unitConverter()
        }
        else if(input == 3){
            
            recursiveFactorial()
        }
        else{
            print("None selected. Goodbye.")
        }
    }
}


//TODO: primeNums calculator
func primeNums(){
    let max = 10000;
    print("Prime Number Calculator\nPlease enter a positive, non-zero integer less than " + String(max) + ": ")
    var num = readLine(strippingNewline: true)
    if var n = Int(num!){
        while(n <= 0 || n >= max){
            print("Prime Number Calculator\nPlease enter a positive, non-zero integer less than " + String(max) + ": ")
            num = readLine(strippingNewline: true)
            n = Int(num!)!
        }
        findPrimes(user: n, max: max)
    }
    else{
        print("\nThat was not a valid int. Try again.\n")
        primeNums()
    }
}

//find all prime numbers between user input and max
//save every prime num to a list
//then display how many prime nums there are and print the full list
func findPrimes(user: Int, max: Int){
    var p = [Int]()
    for i in stride(from: user, to: max, by: 1){
        var isPrime = true
//        print("running...")
        for j in stride(from: 2, to: i, by: 1){
            if(i%j == 0){
                isPrime = false
            }
        }
        if isPrime{
            p.append(i)
        }
    }
    let range  = String(user) + " and " + String(max)
    print("There are " + String(p.count) + " prime numbers between " + range)
    print("The list of prime numbers between " + range + " is: \(p)")
    print("Would you like to return to the main menu? (y/n)")
    let user = readLine()!
    if(user == "y"){
        math.init()
    }
    else{
        print("Goodbye.")
    }
}


//TODO: unitConverter
//ask for a number and a unit to convert
//convert from:
//    -centimeters to inches    -ounces to grams
//    -inches to centimeters    -kilograms to pounds
//    -meters to feet           -pounds to kilograms
//    -meters to yards          -kilometers to miles
//    -feet to meters           -miles to kilometers
//    -yards to meters          -celcius to fahrenheit
//    -grams to ounces          -fahrenheit to celcius
func unitConverter(){
    var user = "y"
    var output = Float(0)
    while(user=="y"){
        print("Unit Converter\nEnter a distance, weight, or temperature amount and a unit, separated by a space (ex: 32.44 kg or 72 F) ")
        let str = readLine()
        let input = str!.components(separatedBy: " ")
        if(input.count>1){
            let inputAmount = Float(input[0])
            let inputUnit = input[1]
            if case "cm" = inputUnit{
                output = Float(inputAmount!*0.39370079)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " in")
            }
            if case "in" = inputUnit{
                output = Float(inputAmount!*2.54)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " cm")
            }
            if case "m" = inputUnit{
                print("Would you like to convert that to feet (ft) or yards (yd)? > ")
                let unit = readLine()
                if(unit == "ft"){
                    output = Float(inputAmount!*3.2808399)
                    print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " ft")
                }
                else if(unit == "yd"){
                    output = Float(inputAmount!*1.0936133)
                    print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " yd")
                }
                else{
                    print("Error. Wrong unit. Try again.")
                }
            }
            if case "ft" = inputUnit{
                output = Float(inputAmount!*0.30479947)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " m")
            }
            if case "yd" = inputUnit{
                output = Float(inputAmount!*0.9144)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " m")
            }
            if case "g" = inputUnit{
                output = Float(inputAmount!*0.035273962)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " oz")
            }
            if case "oz" = inputUnit{
                output = Float(inputAmount!*28.349523)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " g")
            }
            if case "kg" = inputUnit{
                output = Float(inputAmount!*2.2046226)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " lb")
            }
            if case "lb" = inputUnit{
                output = Float(inputAmount!*0.45359237)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " kg")
            }
            if case "km" = inputUnit{
                output = Float(inputAmount!*0.62137119)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " mi")
            }
            if case "mi" = inputUnit{
                output = Float(inputAmount!*1.609344)
                print(String(inputAmount!) + " " + inputUnit + " = " + String(output) + " km")
            }
            if case "C" = inputUnit{
                output = Float((inputAmount!*(9/5))+32)
                print(String(inputAmount!) + "º " + inputUnit + " = " + String(output) + "º F")
            }
            if case "F" = inputUnit{
                output = Float((inputAmount!-32)*(5/9))
                print(String(inputAmount!) + "º " + inputUnit + " = " + String(output) + "º C")
            }
        }
        else{
            print("Invalid input. Try again.")
            unitConverter()
        }
        print("Do you want to convert another unit? (y/n)")
        user = readLine()!
    }
    if(user != "y"){
        print("Would you like to return to the main menu? (y/n)")
        user = readLine()!
        if(user == "y"){
            math.init()
        }
        else{
            print("Goodbye.")
        }
    }
}


//TODO: recursiveFactorial
//ask for a positive number, then calculate its factorial recursively
//factorial is calculated by multiplying a number by every postive number below it
//ex: 5! = (1*2*3*4*5) = 120
func recursiveFactorial(){
    print("Factorial Calculator\nPlease enter an integer to see its factorial, or enter 0 to quit.")
    var num = readLine(strippingNewline: true)
    if Double(num!)! < 0{
        if (Double(num!) != nil){
        print("\nThat was not a valid integer. Try again.\n")
        recursiveFactorial()
        }
    }
    else if var n = Double(num!){
        while(n>0){
            print(num! + "! =", recurse(user: n))
            num = readLine(strippingNewline: true)
            n = Double(num!) ?? 0
        }
        if(Int(num!) == 0){
            print("Would you like to return to the main menu? (y/n)")
            var user = readLine()!
            if(user == "y"){
                math.init()
            }
            else{
                print("Goodbye.")
            }
        }
    }
    else{
        print("\nThat was not a valid integer. Try again.\n")
        recursiveFactorial()
    }
}

//0! = 1 and 1! = 1
//else recursively calulate factorial by subtracting from input value until reaching 1
func recurse(user: Double) -> Double{
    if(user==0 || user==1){
        return 1
    }
    else{
        return (user*(recurse(user: user-1)))
    }
}
