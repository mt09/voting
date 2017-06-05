class CandidatesController < ApplicationController
  before_action :set_candidate, only:[:edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增候選人成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "資料更新成功"
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "刪除完成"
  end

  def vote
    @candidate.increment(:votes)
    @candidate.save
    redirect_to candidates_path, notice: "完成投票"
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def set_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
