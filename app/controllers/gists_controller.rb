class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    gist = GistQuestionService.new(@test_passage.current_question)
    gist.call
    gist_url = gist.url_hash
    @gist = Gist.new(user_id: @test_passage.user_id, question_id: @test_passage.current_question.id, gist_url: gist_url)
    if @gist.save
      flash.now[:notice] = t('.gist_success_html', gist: helpers.link_to_gist(@gist)).html_safe
      render '/test_passages/show'
    else
      flash.now[:notice] = t('.gist_fail')
      render '/test_passages/show'
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
