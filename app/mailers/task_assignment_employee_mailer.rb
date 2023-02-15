class TaskAssignmentEmployeeMailer < ApplicationMailer

  def task_created
    @task = params[:task]
    mail(to: @task.email, subject: "You have a new Task create!")
  end
end
