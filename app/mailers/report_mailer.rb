class ReportMailer < ActionMailer::Base
  default from: "from@example.com"
  add_template_helper(ApplicationHelper)

  def report_email(report)
    attachments.inline['m_logo.gif'] =
    File.read('app/assets/images/m_logo.gif')
    @daily_report = report
    @child = report.child
    mail(to: @child.user.email, subject: 'Montessori House Daily Report')
  end

end
