//
//  main.swift
//  calculator_tool
//
//  Created by t2023-m0059 on 2023/07/20.
//

import Foundation

print("----------계산기----------")
print("첫번째 숫자를 입력해주세요")
var input_firstnumber = readLine()
print("두번째 숫자를 입력해주세요")
var input_secondnumber = readLine()
var FirstNumber: Double = Double(input_firstnumber!) ?? 0
var SecondNumber: Double = Double(input_secondnumber!) ?? 0
print("입력한 숫자는 \(FirstNumber)와 \(SecondNumber)입니다.")

// Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
// Lv2 : Lv1에서 만든 Calculator 클래스에 나머지 연산을 가능하도록 코드를 추가하고, 연산 진행 후 출력하기
class Calculator_Lv1_Lv2 {
    var operations: String?
    func calculate(operation: String, firstNumber: Double, secondNumber: Double ) -> Double {
        
        let operation: String = operation
        var result: Double = 0
        
        switch operation {
        case "add":
            result = firstNumber + secondNumber
        case "subtract":
            result = firstNumber - secondNumber
        case "multiply":
            result = firstNumber * secondNumber
        case "divide":
            if((firstNumber == 0) || (secondNumber == 0)){
                print("둘 중 숫자가 0이므로 계산할 수 없다.")
                return 0
            } else {
                result = firstNumber / secondNumber
            }
        case "remain":
            if((firstNumber == 0) || (secondNumber == 0)){
                print("둘 중 숫자가 0이므로 계산할 수 없다.")
                return 0
            } else {
                result = firstNumber.truncatingRemainder(dividingBy: secondNumber) //firstNumber % secondNumber
            }
        default:
            return 0
        }
        return result
    }
}

var calculator = Calculator_Lv1_Lv2()
var addResult = calculator.calculate(operation: "add", firstNumber: FirstNumber, secondNumber: SecondNumber)
var subtractResult = calculator.calculate(operation: "subtract", firstNumber: FirstNumber, secondNumber: SecondNumber)
var multiplyResult = calculator.calculate(operation: "multiply", firstNumber: FirstNumber, secondNumber: SecondNumber)
var divideResult = calculator.calculate(operation: "divide", firstNumber: FirstNumber, secondNumber: SecondNumber)
var remainderResult = calculator.calculate(operation: "remain", firstNumber: FirstNumber, secondNumber: SecondNumber)

print("---- Lv 1, 2 계산 결과 ----")
print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("-------------------------")

// Lv3 : AddOperation(더하기), SubstractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스를을 만든 후 클래스간의 관계를 고려하여 Calculator 클래스와 관계를 맺기
// - 관계를 맺은 후 필요하다면 Calculator 클래스의 내부코드를 변경하기
//   *나머지 연산자(%) 기능은 제외합니다.
// - Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
//   *hint. 클래스의 책임(단일책임원칙)
class Calculator_Lv3 {
    var firstNumber: Double
    var secondNumber: Double
    
    init(firstNumber: Double, secondNumber: Double){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func cal_result() -> Double {
        return firstNumber + secondNumber
    }
}

class AddOperation_Lv3: Calculator_Lv3{
    override func cal_result() -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation_Lv3: Calculator_Lv3{
    override func cal_result() -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation_Lv3: Calculator_Lv3{
    override func cal_result() -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation_Lv3: Calculator_Lv3{
    override func cal_result() -> Double {
        return firstNumber / secondNumber
    }
}

class RemainderOperation_Lv3: Calculator_Lv3{
    override func cal_result() -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)// Double(Int(firstNumber) % Int(secondNumber))
    }
}

addResult = AddOperation_Lv3(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
subtractResult = SubtractOperation_Lv3(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
multiplyResult = MultiplyOperation_Lv3(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
divideResult = DivideOperation_Lv3(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
remainderResult = RemainderOperation_Lv3(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()

print("------ Lv 3 계산 결과 ------")
print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("-------------------------")

//Lv4 : AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스들을 AbstractOperation라는 클래스명으로 만들어 사용하여 추상화하고 Calculator 클래스의 내부 코드를 변경합니다.
class Calculator_Lv4 {
    var firstNumber: Double
    var secondNumber: Double
    
    init(firstNumber: Double, secondNumber: Double){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
}

class AbstractOpeqration_Lv4: Calculator_Lv4 {
    func cal_result() -> Double{
        return firstNumber + secondNumber
    }
}

class AddOperation_Lv4: AbstractOpeqration_Lv4{
    override func cal_result() -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation_Lv4: AbstractOpeqration_Lv4{
    override func cal_result() -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation_Lv4: AbstractOpeqration_Lv4{
    override func cal_result() -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation_Lv4: AbstractOpeqration_Lv4{
    override func cal_result() -> Double {
        return firstNumber / secondNumber
    }
}

class RemainderOperation_Lv4: AbstractOpeqration_Lv4{
    override func cal_result() -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)// Double(Int(firstNumber) % Int(secondNumber))
    }
}

addResult = AddOperation_Lv4(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
subtractResult = SubtractOperation_Lv4(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
multiplyResult = MultiplyOperation_Lv4(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
divideResult = DivideOperation_Lv4(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()
remainderResult = RemainderOperation_Lv4(firstNumber: FirstNumber, secondNumber: SecondNumber).cal_result()

print("------ Lv 4 계산 결과 ------")
print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("-------------------------")

// 팀원들과 회의 후 최종적으로 Lv 4의 진행 방안.
class AbstractOperation {
    func perform(_ a: Double, _ b: Double) -> Double {
        return 0
    }
}

class AddOperationLv4: AbstractOperation {
    override func perform(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperationLv4: AbstractOperation {
    override func perform(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperationLv4: AbstractOperation {
    override func perform(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperationLv4: AbstractOperation {
    override func perform(_ a: Double, _ b: Double) -> Double {
        if b != 0 {
            return a / b
        } else {
            print("Error: Cannot divide by zero")
            return 0
        }
    }
}

class RemainderOperationLv4: AbstractOperation {
    override func perform(_ a: Double, _ b: Double) -> Double {
        if b != 0 {
            return a.truncatingRemainder(dividingBy: b)
        } else {
            print("Error: Cannot remainder by zero")
            return 0
        }
    }
}

class CalculatorLv4 {
    var operation: AbstractOperation? = nil // AbstractOperation Class를 상속
    
    func setOperation(_ operation: AbstractOperation) {
        self.operation = operation
    }
    
    func calculate(_ a: Double, _ b: Double) -> Double {
        if let operation = operation {
            return operation.perform(a, b)
        } else {
            print("No operation set")
            return 0
        }
    }
}

let calculatorLv4 = CalculatorLv4()

// 계산 전에 setOperation 함수를 사용하여 사용하는 operation을 설정한다.
calculatorLv4.setOperation(AddOperationLv4())
addResult = calculatorLv4.calculate(FirstNumber, SecondNumber)

calculatorLv4.setOperation(SubtractOperationLv4())
subtractResult = calculatorLv4.calculate(FirstNumber, SecondNumber)

calculatorLv4.setOperation(MultiplyOperationLv4())
multiplyResult = calculatorLv4.calculate(FirstNumber, SecondNumber)

calculatorLv4.setOperation(DivideOperationLv4())
divideResult = calculatorLv4.calculate(FirstNumber, SecondNumber)

calculatorLv4.setOperation(RemainderOperationLv4())
remainderResult = calculatorLv4.calculate(FirstNumber, SecondNumber)

print("------ Lv 4 계산 결과 ------")
print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("-------------------------")
