require "capybara/rspec"
require "capybara-playwright-driver"

Capybara.register_driver(:playwright) do |app|
  Capybara::Playwright::Driver.new(app, browser_type: :chromium, headless: false)
end
Capybara.default_max_wait_time = 15
Capybara.default_driver = :playwright
Capybara.app_host = "http://localhost:2137"

describe "issue 51", type: :feature do
  it "should not raise an error" do
    visit '/'
    click_on 'go'
    expect(page).to have_content('finish')
  end
end