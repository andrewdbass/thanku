class CommentsController < ApplicationController
  skip_before_filter :require_login, except:[:approve]
  def index
    @comments = Comment.all

  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to person_path(@comment.person_id)
    else 
      render new_person_comment_path
    end
  end

  def edit

    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to comment_path
    else 
      render edit_comment_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete

    redirect_to :back
  end
  def approve
    @comment = Comment.find(params[:comment_id])
    @comment.approved = true
    @comment.save

    redirect_to(:back)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body,:approved, :person_id)
  end
end
