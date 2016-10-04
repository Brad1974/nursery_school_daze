class ReportMailer < ActionMailer::Base
  default from: "from@example.com"
  add_template_helper(ApplicationHelper)

  def report_email(report)
    attachments.inline['m_logo.gif'] =
    File.read('app/assets/images/m_logo.gif')
    @daily_report = report
    @child = report.child
    emails = [@child.user.email, @child.user.secondary_email]
    emails
    mail(to: emails, subject: 'Montessori House Daily Report')
  end

end
