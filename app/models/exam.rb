class Exam < ActiveRecord::Base
    has_many :student_exams
    has_many :students, through: :student_exams

    def insert_feedback(student, grade, comment)
        StudentExam.create(student_id: student.id, exam_id: self.id, grade: grade, teacher_comment: comment)
    end

    def class_average
        StudentExam.where(exam_id: self.id).average(:grade).to_i
    end

    def self.used_exams
        StudentExam.all.map {|e| e.exam}.uniq
    end

    def self.lowest_average
        averages = self.all.map {|e| e.class_average}
        self.all[averages.index(averages.min)]
    end

    def self.drop_lowest_average
        low_id = lowest_average.id
        self.destroy(low_id)
        student_exam_ids = StudentExam.where(exam_id: low_id).map {|x| x.id}
        StudentExam.destroy(student_exam_ids)
    end
end
