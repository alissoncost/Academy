# frozen_string_literal: true
# Module to build and configure Report
module ReportConfig
  def report_generate(report_title)
    run_driver = Capybara.default_driver.to_s.capitalize
    url = DATA['URL']
    date = Time.now.getlocal("-03:00").strftime("%d/%m/%Y")
    time = Time.now.getlocal("-03:00").strftime("%H:%M:%S")
    report_title, report_list = generate_title_and_list(report_title)
    input_list = report_list.map { |_thread| Dir.pwd + "/data/report/report.json" }
    options = {
      input_path: input_list,
      report_path: "data/report/#{report_title}",
      report_types: %w(html),
      report_title: report_title,
      color: 'blue',
      additional_info: {
        'Browser'      => run_driver,
        'URL'          => url,
        'Date of test' => date,
        'Time of test' => time
      },
    }
    ReportBuilder.build_report options
    puts "Report build with success on #{Dir.pwd}/data/report/#{report_title}.html"
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