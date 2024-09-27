class ApplicationController < ActionController::API
  def hello_world
    render json: {message: 'hello_world!'}
  end

  def shorten
    print(params)
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # def shorten
  #   origin_url = params['originUrl']

  #   code = SecureRandom.hex 2

  #   ShortUrl.create(origin_url: origin_url, code: code)
    
  #   target_url = "http://shortUrl.fap/#{code}"

  #   render json: { targetUrl: target_url }
  # end

  def get_url
    code = params['code']
    
    short_url = ShortUrl.where(code: code).first
    # OUUUUUUUUU
    short_url = ShortUrl.find_by(code: code)

    if short_url.present?
      short_url.access_count += 1
      short_url.save

      AcessLog.create(short_url_id: short_url.id, accessed_at: DateTime.current)

      render json: {origin_url: short_url.origin_url}
    else
      render json: {}
    end
  end
end


