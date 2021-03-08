module ApplicationHelper
  def current_year
    "Year:#{Date.today.year}"
  end

  def github_url(author, repo)
    link_to(author.to_s, "https:/github.com/#{author}/#{repo}", target: '_blank')
  end
end
