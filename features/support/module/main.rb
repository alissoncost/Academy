# frozen_string_literal: true

%w[
    ./screenshot
    ./report
  ].each { |dependency| require_relative dependency }
  
  # Hooksconfig
  class HooksConfig
    class << self
      include ScreenshotSetup
      include ReportConfig
  
      def take_screenshot(scn)
        super
      end
  
      def report_generate(report_title)
        super
      end
    end
  end