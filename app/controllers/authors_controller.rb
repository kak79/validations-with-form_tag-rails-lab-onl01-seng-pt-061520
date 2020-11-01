class AuthorsController < ApplicationController

  before_action :find_author, only: [:show, :edit, :update]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else  
      render :new
    end
  end

  def update
    @author = Author.update(author_params)
    if @author.save
      redirect_to author_path(@author)
    else  
      render :edit
    end    
  end

  private

  def find_author
    @author = Author.find_by_id(params[:id])
    redirect_to author_path if !@author
  end

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
