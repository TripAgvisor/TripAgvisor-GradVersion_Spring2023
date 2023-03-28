class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post_attachments = @post.post_attachments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
     @post = Post.new(post_params)
     respond_to do |format|
       if @post.save
         params[:post_attachments]['avatar'].each do |a|
            @post_attachment = @post.post_attachments.create!(:avatar => a,     :post_id => @post.id)
         end
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
       else
         format.html { render action: 'new' }
       end
     end
   end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, post_attachments_attributes: [:id, :post_id, :avatar])
    end
end
