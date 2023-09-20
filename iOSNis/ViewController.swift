//
//  ViewController.swift
//  iOSNis
//
//  Created by Анастасия on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(normalizeGrades())
    }
    
    func normalizeGrades() -> [String: Double] {
        IOSNis.students = [
            Student(grades: [3.51, 10, 9], fullName: "Ушакова Ангелина"),
            Student(grades:[7, 8, 7.5], fullName: "Адхамов Алибек"),
            Student(grades: [9.5, 10, 9.5], fullName: "Манушкина Анастасия"),
            Student(grades: [5, 8, 7], fullName: "Гаврилов Артем"),
            Student(grades: [3, 5.5, 8], fullName: "Васина Дарья")
        ]
        var normalizedGrades: [String: Double] = [:]
        var maxGrade = 0.0
        for student in IOSNis.students {
            if student.getGrade() > maxGrade {
                maxGrade = student.getGrade()
            }
        }
        for student in IOSNis.students {
            if maxGrade == 10 {
                normalizedGrades[student.fullName] = student.getGrade()
            } else {
                normalizedGrades[student.fullName] = student.getGrade() * 10 / maxGrade
            }
        }
        return normalizedGrades
    }
}
