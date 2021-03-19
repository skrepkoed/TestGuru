module ApplicationHelper
  COLORS = { alert: 'danger', notice: 'warning', greeting: 'success', goodbye: 'primary' }

  def current_year
    "Year:#{Time.zone.today}"
  end

  def github_url(author, repo)
    link_to(author.to_s, "https:/github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener')
  end

  def flash_message(flag)
    tag.span(flash[flag]) if flash[flag]
  end

  def bootstrap_color(flag)
    "alert-#{COLORS[flag.to_sym]}"
  end
end
