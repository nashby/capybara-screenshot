require 'capybara-screenshot/saver'

if defined?(ActionDispatch::IntegrationTest)
  ActionDispatch::IntegrationTest.add_teardown_hook do |context|
    # by adding the argument context, MiniTest passes the context of the test
    # which has an instance variable @passed indicating success / failure
    context.instance_eval do
      if @passed.blank?
        Capybara::Screenshot::Saver.screen_shot_and_save_page Capybara, Capybara.body
      end
    end
  end
end