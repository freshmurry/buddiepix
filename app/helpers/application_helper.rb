module ApplicationHelper
  def image(user)
    if user.image
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    else  
      return user.image
    end
  end

  def image_url(user)
    if gravatar?(user)
      gravatar = Digest::MD5::hexdigest(user.email).downcase
      # "http://gravatar.com/avatar/#{gravatar}.png?s=200"
      "https://www.gravatar.com/avatar/#{gravatar}.jpg?d=identical&s=150"
    else
      'default_avatar.png'
    end
  end
  
  private
  
  def add_default_avatar
    unless image.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.png'
          )
        ), filename: 'default_avatar.png',
        content_type: 'image/png'
      )
    end
  end
  
  # def gravatar?(user)
  #   gravatar = Digest::MD5::hexdigest(user.email).downcase
  #   gravatar_check = "http://gravatar.com/avatar/#{gravatar}.png?d=404"
  #   uri = URI.parse(gravatar_check)
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   request = Net::HTTP::Get.new(uri.request_uri)
  #   response = http.request(request)
  #   response.code.to_i != 404
  # end
  
  def @user.website
    link_to @user.website, "#{url_with_protocol(website)}", class: "website", target: :_blank
  end
  #=> url helper
  def url_with_protocol(url)
      /^http/.match(url) ? url : "http://#{url}"
  end
end