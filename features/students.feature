Feature: Create, read, update, and delete students

  As a teacher 
  So that I can manage the database of students
  I want to create, read, update, and delete students.

 Background: there is a student in the database
  Given the following students exist:$
  | Student_Name | Parent_Name | Phone_Number | Email                      |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    |
  And I am on the students page

Scenario: Create a student (happy path)
  When I follow "Add New Student"
  And I fill in "Student name" with "Wayne Rooney"
  And I fill in "Parent name" with "Michael Carrick"
  And I press "Save"
  And I follow "Back"
  Then I should be on the students page
  And I should see "Wayne Rooney"

Scenario: Create a student (happy path)
  When I follow "Add New Student"
  And I fill in "Student name" with "Wayne Rooney"
  And I fill in "Parent name" with "Michael Carrick"
  And I fill in "Phone number" with "5551234567"
  And I fill in "Email" with "grinnell@grinnell.edu"
  And I press "Save"
  And I follow "Back"
  Then I should be on the students page
  And I should see "Wayne Rooney"

Scenario: Read a student (happy path)
  When I follow "Show Khoa Nguyen"
  Then I should be on the details page for "Khoa Nguyen"
  And I should see "teamfirealarm@gmail.com"

Scenario: Update a student (happy path)
  Given I am on the details page for "Khoa Nguyen"
  When I follow "Edit"
  And I fill in "Student name" with "Thu Nguyen"
  And I press "Save"
  Then I should be on the details page for "Thu Nguyen"


Scenario: Delete a student (happy path)
  Given I am on the details page for "Khoa Nguyen"
  When I follow "Delete"
  #Need javascript support to finish testing this scenario!
  And I confirm the popup
  When I should be on the students page
  And I should not see "Khoa Nguyen"


Scenario: Enter an entry without student name (sad path)
  When I follow "Add New Student"
  And I fill in "Parent name" with "Luke Shaw"
  And I press "Save"
  And I follow "Back"
  Then I should not be on the students page
  Then I should be on the new page
  And we should see "Student Name can't be blank"