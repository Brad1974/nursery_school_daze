class ReportMailer < ActionMailer::Base
  default from: "from@example.com"
  add_template_helper(ApplicationHelper)

  def report_email(report)
    @daily_report = report
    @child = report.child
    mail(to: @child.user.email, subject: 'Montessori House Daily Report')
  end

end
