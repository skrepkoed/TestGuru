class GistsController<ApplicationController
  before_action :set_test_passage
  
  def create
    gist_url=GistQuestionService.new(@test_passage.current_question).call[:url]
    @gist=Gist.new(user_id: @test_passage.user_id, question_id: @test_passage.current_question.id, gist_url: gist_url)
    if @gist.save
      flash[:notice]='Gist succefuly created'
      render '/test_passages/show'
    else
      flash[:notice]='Something wrong'
      render '/test_passages/show'
    end
  end

  private

  def set_test_passage
    @test_passage=TestPassage.find(params[:test_passage_id])
  end

end