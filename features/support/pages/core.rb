def assert_no_loader(time)
    loader       = "//div[@alt='Loading...']"

    begin
      assert_no_selector("*[@alt='Loading...']", wait: time)
      assert_no_selector(:xpath, loader_adm, wait: time)
    rescue StandardError => e
      raise 'Foi possivel encontrar o loader' if e.to_s.include?('expected not to find')
    end
  end