
Before do |scn|
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    page.driver.browser.manage.window.resize_to(1440, 900)
end

After do |scn|

  if ENV['screenshot']
    screenshot = HooksConfig.take_screenshot(scn)
    embed(screenshot, 'image/png;base64')
  end

end

at_exit do
    HooksConfig.report_generate("Academia") if ENV['report']
  end

