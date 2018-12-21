class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  impressionist :unique => [:impressionable_type, :impressionable_id, :session_hash],:actions=>[:show]
  # GET /posts
  # GET /posts.json
  def index
    @search = Post.search do
      fulltext params[:search] do
        highlight :body
      end
      with(:published_at).less_than(Time.zone.now)
      facet(:publish_month)
      with(:publish_month, params[:month]) if params[:month].present?
      paginate page: params[:page], per_page: 4
      order_by(:created_at, :desc)

    end
    @search.hits.each do |hit|
      puts "Post ##{hit.primary_key}"

      hit.highlights(:body).each do |highlight|
        puts "  " + highlight.format { |word| "*#{word}*" }
      end
    end
    @posts = @search.results
    @impressions = Post.impressions.max(4)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # impressionist(@post, @post.title) # 2nd argument is optional
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.published_at = Time.now
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :published,:image)
    end
end
