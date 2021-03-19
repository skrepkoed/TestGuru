class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.gists_with_author_and_question.order(created_at: :desc)
  end
end
