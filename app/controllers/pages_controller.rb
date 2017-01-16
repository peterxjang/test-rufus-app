class PagesController < ApplicationController
  def home
    render 'home.html.erb'
  end

  def stop
    puts 'Stopping rufus'
    Rufus::Scheduler.singleton.jobs(:tag => 'main_process').each do |job|
      Rufus::Scheduler.singleton.unschedule(job)
    end
    puts 'Starting rufus'
    load "#{Rails.root}/config/initializers/task_scheduler.rb"
    redirect_to "/"
  end
end
