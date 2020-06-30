
Before do
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    page.driver.browser.manage.window.resize_to(1440, 900)
end

