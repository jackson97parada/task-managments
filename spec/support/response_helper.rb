module ResponseHelper
  def response_body
    JSON.parse(response.body)['data']
  end
end