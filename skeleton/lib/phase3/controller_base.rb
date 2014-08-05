require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      controller_name = self.class.to_s
      file = File.open("views/#{controller_name.underscore}/#{template_name}.html.erb", "r")
      template = file.read
      binding

      @already_built_response = render_content(template, "text/html")
    end

    def already_built_response?
      if @already_built_response
        true
      else
        false
      end
    end
  end
end
