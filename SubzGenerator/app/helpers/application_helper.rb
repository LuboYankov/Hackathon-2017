module ApplicationHelper
  def javascript(*files)
    content_for(:head) { javascript_include_tag('/assets/jquery.js') }
    content_for(:head) { javascript_include_tag('/assets/cable.js') }
    content_for(:head) { javascript_include_tag('/assets/custom-min.js') }
    content_for(:head) { javascript_include_tag('/assets/init.js') }
    content_for(:head) { javascript_include_tag('/assets/materialize.js') }
    content_for(:head) { javascript_include_tag('/assets/materialize.min.js') }
    content_for(:head) { javascript_include_tag('/assets/modernizr.js') }
    content_for(:head) { javascript_include_tag('/assets/plugin-min.js') }
  end
end
