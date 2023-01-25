module ResponseHelper
  def response_body
    JSON.parse(response.body)['data']
  end

  def auth_response_body
    JSON.parse(response.body)
  end
end
