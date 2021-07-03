class Exam < ActiveRecord::Base
    has_many :student_exams
    has_many :students, through: :student_exams

    def insert_feedback(student, grade, comment)
        StudentExam.create(student_id: student.id, grade: grade, teacher_comment: comment)
    end

    def class_average
        StudentExam.average(:grade).where(exam.id: self.id)
    end

    def self.used_exams
        StudentExam.exams
    end
end
