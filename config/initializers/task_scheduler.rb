unless defined?(Rails::Console) || File.split($0).last == 'rake'
  s = Rufus::Scheduler.singleton
  s.every '3s' do
    Rails.logger.info "hello, it's #{Time.now}"
    Rails.logger.flush
    Task.create(name: "yo", priority: (1..10).to_a.sample)
  end
end
