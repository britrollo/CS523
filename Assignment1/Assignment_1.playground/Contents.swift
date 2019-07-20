//Brianne Trollo
//I pledge my honor that I have abided by the Stevens Honor System.

import UIKit

//Exercise 1
func exerciseOne() -> Double {
    var loan = 1000.0
    var totalPaid = 0.0
    var months = 0
    while loan > 0{
        months = months + 1
        if loan > 500 {
            loan = loan * 1.02
        } else {
            loan = loan * 1.01
        }
        if loan < 100 {
            totalPaid = totalPaid + loan
            print("Final payment: $", String(format: "%.2f", totalPaid))
            print("Total number of months: \(months)")
            loan = loan - loan
        } else {
            loan = loan - 100
            totalPaid = totalPaid + 100
            print("Month \(months), Balance: $", String(format: "%.2f", loan))
        }
    }
    return totalPaid
}

print("---Exercise One---")
exerciseOne()

//Exercise 2
func exerciseTwo(weather:Int, schedule: Int, likeRunning: Int) -> String {
    var output = ""
    if likeRunning >= 4 {
        if schedule > 2 {
            output = "Not going for a Run"
        } else {
            if weather < 45 && weather < 90 {
                output = "Going for a Run"
            } else {
                output = "Not going for a Run"
            }
        }
    } else {
        output = "Not going for a Run"
    }
    print(output)
    return output
}

print("---Exercise Two---")
exerciseTwo(weather: 20, schedule: 0, likeRunning: 3)
exerciseTwo(weather: 20, schedule: 3, likeRunning: 4)
exerciseTwo(weather: 40, schedule: 1, likeRunning: 4)
exerciseTwo(weather: 50, schedule: 1, likeRunning: 5)

//Exercise 3
func exerciseThree() -> (String, Int) {
    var fName = ""
    var fTime = -1
    let runners = [
        "Elena" : 341,
        "Thomas" : 273,
        "Hamilton" : 278,
        "Suzie" : 329,
        "Phil" : 445,
        "Matt" : 402,
        "Alex" : 388,
        "Emma" : 275,
        "John" : 243,
        "James" : 334,
        "Jane" : 412,
        "Emily" : 393,
        "Daniel" : 299,
        "Neda" : 343,
        "Aaron" : 317,
        "Kate" : 265
    ]
    for (name, time) in runners {
        if time < fTime || fTime < 0{
            fTime = time
            fName = name
        }
    }
    print(fName, fTime)
    return (fName, fTime)
}
print("---Exercise Three---")
exerciseThree()