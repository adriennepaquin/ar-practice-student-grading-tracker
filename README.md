# Object Relations Practice Code Challenge - Students

## Introduction

For this assignment, we'll be working with on a student grade tracking software.

We have three models: `Student`, `StudentExam`, and `Exam`.

For our purposes, a `Student` has many `StudentExam`s, an `Exam` has many `StudentExam`s, and a `StudentExam` belongs to a `Student` and to an `Exam`.

`Student` - `Exam` is a many to many relationship.


## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This lab does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First, prioritize getting things working. Then, if there is time at the end, refactor your code to adhere to best practices.


## What You Already Have

The starter code has migrations, models, and seed data for the initial `Exam`, `Student`  models. 

You will need to create the model, migration, and seed for the `studentExams` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class methods.

Remember: Active Record give your classes access to a lot of built-in methods! Keep in mind what methods Active Record gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a migration for the `student_exams` table. See section `2.1 Naming Conventions` [at this link here](https://guides.rubyonrails.org/v5.0/active_record_basics.html) for naming conventions when it comes to tables with more than one word in the name. (Tables will all be one word tomorrow on the code challenge, though, so don't stress about this!)

- A `StudentExam` belongs to a `student`, and a `StudentExam` also belongs to an `exam`. In your migration, create any columns your `student_exams` table will need to establish these relationships.
  - The `student_exams` table should also have the following columns:
    -  `grade`, stores an integer
    -  `teacher_comment`, stores a string

After creating your migration, use the `seeds.rb` file to create instances of your `StudentExam` class so you can test your code.

**Once you've set up your `StudentExam` class**, work on building out the following deliverables.

### Object Relationship Methods

Use Active Record association macros and Active Record query methods where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### StudentExam

- `StudentExam#exam`
  - should return the `Exam` instance for this studentExam
- `StudentExam#student`
  - should return the `Student` instance for this studentExam

#### Student

- `Student#studentExams`
  - returns a collection of all `StudentExam` instances for this student
- `Student#exams`
  - returns a collection of all the `Exam` instances this student has taken

#### Exam

- `Exam#studentExams`
  - should return a collection of all `StudentExam` instances for this exam
- `Exam#students`
  - should return a collection of all the `Student` instances that have taken this exam

### Aggregate and Association Methods

#### StudentExam
- `StudentExam#print_details`
  - `puts` a string to the terminal to display the details of the studentExam
  - the string should be formatted like this: `{student name} took the {exam subject} exam receiving a score of {grade}`

- `StudentExam#questions_correct_ratio`
  - returns a string displaying the total number of questions the student got correct over how many questions there were total. Assume the studentExam grade is the percentage the student got correct.
  - the return value should be formatted like this: `"10 questions correct out of 20 questions total"`

#### Exam

- `Exam#insert_feedback(student, grade, comment)`
  - takes a `student` (an instance of the `Student` class), a `grade` (integer), and a `teacher_comment` (string) as arguments, and creates a new `studentExam` in the database associated with the student and the exam
- `Exam#class_average`
  - returns the class average grade for an exam (the average of all the exam's studentExams)
- `Exam.used_exams`
  - returns an array of exams that have been taken by more than 0 students
- `Exam.lowest_average`
  - returns the exam instance that has been used with the lowest class average grade
- `Exam.drop_lowest_average`
  - finds the exam with the lowest class average grade and removes it
  - You'll have to delete all the studentExams belonging to this exam

#### Student

- `Student.upper_classmen`
  - returns an `array` of students who are in their 3rd or 4th year
- `Student.under_classmen`
  - returns an `array` of students who are in their 1st or 2nd year
- `Student.subject_matter_experts(degree)`
  - takes in a degree string (e.g. `"Biology"`)
  - returns an `array` of students who are in that specified degree
- `Student.exam_taker_professional`
  - returns the `Student` instance who has taken the most exams
- `Student#overall_average`
  - returns the average of all of a student's tests
- `Student.rising_star`
  - returns the student instance with the highest overall average
- `Student.valedictorian`
  - returns the student instance in their 4th year with the highest overall average


## Rubric

### Active Record Associations
1. No associations, no foreign key on the table.
2. Associations attempted in the model but are incorrect; foreign key is on a table but in the wrong spot.
3. Relationships properly created. Associations lead to the correct behavior but may have used the wrong macro or manually written out the methods the macro builds for us.
4. Relationships properly created, save minor mistakes in advanced deliverables. May implement advanced query methods with iterators instead of using built-in methods.
5. Relationships properly created. Advanced query methods use appropriate built-in methods.

### Build classes using OO Ruby Syntax

1. Class code has a syntax or runtime error. Code does not run at all, or exits with an error, or most Object-oriented deliverables are not implemented.
2. No syntax errors. Some deliverables function correctly. Mixes up syntax for class and instance methods, refers to variables in the wrong scope, or uses `self` incorrectly, leading to logical errors. Method and variable names do not correspond to their respective behavior or data types. Methods might be duplicated, or code includes unused methods without a clear purpose.
3. Correct class syntax for the deliverables submitted. May be incomplete or missing deliverables. Most code generally expresses intent: method and variable names match their behaviors and data types. Methods are not duplicated. Code does not have unused or methods without a clear purpose.
4. Correct class syntax for all of the submitted code. Code express intent: method and variable names indicate their behavior and data types. Some deliverables might not be complete. No methods are duplicated.
5. Correct class syntax for all deliverables, all deliverables complete. Code expresses intent: method and variable names indicate their behavior and data types, with the correct pluralization. No methods are duplicated. All methods have a clear purpose. Shared functionality is factored out into helper methods. Appropriate use of attr\_\* macros.

### Model relationships using Ruby

1. Submitted code does not relate models to each other through methods or data.
2. Models relate to each other, but incompletely. Relationship methods are missing or have logic errors, store data on the wrong model, or are missing a single source of truth.
3. Models relate to each other as specified in the instructions. Data is stored on the correct models, relationship methods are defined on the right models, and the logic correctly implements the relationships. Aggregate methods using the relationships may be incomplete or have errors.
4. Models relate to each other as specified in the instructions. Aggregate methods work, but might not use helper methods effectively.
5. Models relate to each other as specified in the instructions. Aggregate methods use helper methods effectively.

### Solve problems with collections of data

1. Does not attempt to solve collections problems, or has syntax errors in collection code.
2. Collections methods have runtime or logic errors. Collections methods may use the wrong iterators, have incorrect logic, or many of the collections methods are unimplemented.
3. Some collections methods work correctly, though several might be unimplemented. Code may not use the appropriate built in method for each problem, or duplicate logic instead of using helper methods.
4. All collections methods are implemented and function correctly. Most use appropriate higher-level built-in methods. Methods may duplicate logic instead of using helper methods.
5. All collections methods implemented and function correctly, using appropriate higher-level built-in methods. Shared logic is factored out to helper methods.
