# require "spec_helper"
#
# describe 'Whenever Schedule' do
#   before do
#     load 'Rakefile'
#   end
#
#   it 'makes sure cron alive monitor is registered in minute basis' do
#     schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')
#
#     assert_equal 'curl -X POST http://localhost:3000/events', schedule.jobs[:command].first[:task]
#     assert_equal [:hour], schedule.jobs[:command].first[:hour]
#   end
# end
