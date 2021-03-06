require 'aws_account_utils/base'
require 'aws_account_utils/login'

module AwsAccountUtils
  class CustomizeUrl < Base
    attr_reader :logger, :browser

    def initialize(logger, browser)
      @logger = logger
      @browser = browser
    end

    def execute(account_email, account_password, url_alias)
      logger.debug "Creating URL alias: #{url_alias}"
      Login.new(logger, browser).execute url,
                                         account_email,
                                         account_password

      browser.h2(:text => /Welcome to Identity and Access Management/).wait_until_present
      browser.button(:text => /Customize/).when_present.click
      browser.input(:id => 'alias_input').when_present.to_subtype.set url_alias
      screenshot(browser, "1")
      browser.button(:text => /Yes, Create/).when_present.click
      screenshot(browser, "2")
      browser.strong(:text => "https://#{url_alias}.signin.aws.amazon.com/console").wait_until_present
      "https://#{url_alias}.signin.aws.amazon.com/console"
    rescue Watir::Wait::TimeoutError, Net::ReadTimeout => e
      screenshot(browser, "error")
      raise StandardError, "#{self.class.name} - #{e}"
    end

    private
    def url
      'https://console.aws.amazon.com/iam/home?#home'
    end
  end
end
