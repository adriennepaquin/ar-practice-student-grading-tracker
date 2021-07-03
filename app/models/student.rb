class Student < ActiveRecord::Base
    has_many :student_exams
    has_many :exams, through: :student_exams

    def self.upper_classmen
        self.where("year >= 3")
    end

    def self.under_classmen
        self.where("year <= 2")
    end

    def self.subject_matter_experts(degree)
        self.where(degree: degree)
    end

    def self.exam_taker_professional
        overachiever = StudentExam.group(:student_id).count.sort_by{|k,v| v}.last[0]
        self.find_by(id: overachiever)
    end

    def overall_average
        StudentExam.where(student_id: self.id).average(:grade).to_i
    end

    def self.rising_star
        averages = self.all.map {|e| e.overall_average}
        self.all[averages.index(averages.max)]
    end

    def self.valedictorian
        seniors = self.where("year = 4")
        senior_average = seniors.map {|e| e.overall_average}
        seniors[senior_average.index(senior_average.max)]
    end
end
