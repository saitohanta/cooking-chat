class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member)
    else
      render "edit"
    end
  end

  def posts
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:profile_image, :name, :email, :is_deleted)
  end

end
