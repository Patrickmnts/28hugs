# Use this file to easily define all of your cron jobs.
set :output, 'log/cron_log.log'
job_type :runner, "cd :path && bin/rails runner -e :environment ':task' :output"


every 2.minutes do
  runner "Charge.daily_bulk_charge_runner", :environment => :development
  # command "echo 'hi' >> /Users/nonojojo/Dropbox/rails_projects/28hugs_/cron_log.log"
end







#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
