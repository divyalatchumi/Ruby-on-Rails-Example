class CommentsController < ApplicationController
  before_filter :find_comments
  def index
  	@comments = @post.comments
  end

  def show
  	@comment = @post.comments.find(params[:id])
  end

  def new
  	@comment = @post.comments.build
  end

  def create
  	@comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect_to post_comment_url(@post, @comment)
    else
      render :action => "new"
    end
  end

  def edit
  	@comment = @post.comments.find(params[:id])
  end

  def update
  	@comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to post_comment_url(@post, @comment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_path(@post) }
      format.xml  { head :ok }
    end
  end

  private
  	def find_comments
  		@post = Post.find(params[:post_id])
  	end
end
