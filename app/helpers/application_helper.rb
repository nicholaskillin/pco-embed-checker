module ApplicationHelper
  def embedded_svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  def current_route?(route)
    request.path == route ? 'active_route' : ''
  end
end
