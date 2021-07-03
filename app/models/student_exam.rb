class StudentExam < ActiveRecord::Base
    belongs_to :exam
    belongs_to :student

    def print_details
        puts "#{self.student.name} took the #{self.exam.subject} exam receiving a score of #{self.grade}"
    end

    def questions_correct_ratio
        total = self.exam.total_questions
        grade = self.grade
        correct = grade * total
        "#{correct} questions correct out of #{total} questions total"
    end
end