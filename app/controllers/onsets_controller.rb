class OnsetsController < ApplicationController
  before_action :authenticate_user!
   
  def index
    @onsets = current_user.onsets
  end

  def create
    onset = current_user.onsets.create(disease_id: params[:disease_id])
    redirect_to disease_url(onset.disease_id), notice: "#{onset.disease.name}を登録しました"
  end

  def destroy
    onset = current_user.onsets.find_by(id: params[:id]).destroy
    redirect_to disease_url(onset.disease_id), notice: "#{onset.disease.name}を登録解除しました"
  end
end
