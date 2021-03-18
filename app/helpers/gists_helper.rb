module GistsHelper
  GIST_API_ENDPOINT = 'https://gist.github.com/'

  def preview_with_length(attribute, length)
    attribute.first(length)
  end

  def link_to_gist(gist)
    gist_url = GIST_API_ENDPOINT + gist.gist_url + '.git'
    link_to(gist.gist_url, gist_url, target: '_blank', rel: 'noopener')
  end
end
