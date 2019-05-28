class ContactMailer < ApplicationMailer
  default from: "yourcourse.3572300@gmail.com"
  
  def contact_us(name, email, subject)
    @greeting = "Hi"
    @name = name
    @email = email
    @subject = subject
    mail to: "yourcourse.3572300@gmail.com", subject: "Email from YourCourse user."
  end
end
