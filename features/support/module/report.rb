module ReportConfig
    def report_generate(report_title = 'Report Title')
      # setting envorviment and broswer
      run_driver = Capybara.default_driver.to_s.capitalize
      env_url    = DATA['URL']
      date       = Time.now.strftime('%A: %d/%^b/%Y')
      time       = Time.now.strftime('%HH:%MM')
  
      report_title, report_list = generate_title_and_list(report_title)
  
      input_list = report_list.map { |thread| Dir.pwd + "/data/report_default/report#{thread}.json" }
      options = {
        input_path: input_list,
        report_path: "data/report_default/#{report_title}",
        report_types: %w[html],
        report_title: report_title,
        color: 'cyan',
        additional_info: {
          'Browser' => run_driver,
          'URL' => env_url,
          'Date' => date,
          'Time' => time
        }
      }
  
      ReportBuilder.build_report options
      puts "Report build with success on #{Dir.pwd}/report_default/#{report_title}.html"
    end
  
    def generate_title_and_list(report_title)
      report_title = (report_title + '_' + ENV['custom_report_name']) unless ENV['custom_report_name'].nil?
      report_title.gsub!(%r{([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-\ ]+)}, '_')
  
      report_list = []
      if ENV['PARALLEL_TEST_GROUPS'].nil?
        report_list << ''
      else
        quantity = ENV['PARALLEL_TEST_GROUPS'].to_i
        list     = (0..quantity).to_a.map(&:to_s)
        list[list.index('0')] = ''
        list.delete('1')
        report_list = [*list]
      end
  
      [report_title, report_list]
    end
  end