class PostAttachmentsController < ApplicationController
  before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]

  # GET /post_attachments
  def index
    @post_attachments = PostAttachment.all
  end

  # GET /post_attachments/1
  def show
  end

  # GET /post_attachments/new
  def new
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1/edit
  def edit
  end

  # POST /post_attachments
  def create
    @post_attachment = PostAttachment.new(post_attachment_params)

    if @post_attachment.save
      redirect_to @post_attachment, notice: 'Post attachment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /post_attachments/1
  def update
    respond_to do |format|
      if @post_attachment.update(post_attachment_params)
        format.html { redirect_to @post_attachment.post, notice: 'Post attachment was successfully updated.' }
      end 
    end
  end

  # DELETE /post_attachments/1
  def destroy
    @post_attachment.destroy
    redirect_to post_attachments_url, notice: 'Post attachment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attachment
      @post_attachment = PostAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_attachment_params
      params.require(:post_attachment).permit(:post_id, :avatar)
    end
end
