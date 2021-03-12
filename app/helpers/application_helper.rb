module ApplicationHelper
  def current_year
    "Year:#{Time.zone.today}"
  end

  def github_url(author, repo)
    link_to(author.to_s, "https:/github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener')
  end

  def flash_message(flag)
    if flash[flag]
      content_tag :p, flash[flag], class: "flash #{flag}"
    end
  end
end
