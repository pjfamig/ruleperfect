class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @rule = Rule.find_by(id: @post.rule_id)
    @statement = @rule.statement
    @keywords = @rule.keywords.split(', ')
  end

  # GET /posts/new
  def new
    @post = Post.new
    
    if params[:topic]
      @rule = Rule.where(:topic => params[:topic]).order("Random()").first
      @rule_id = @rule.id
    else
      @rule_id = rand(1...191)  
    end
    
    @rule = Rule.find_by(id: @rule_id)
    @rules = Rule.order(:name)
  end

  # GET /posts/1/edit
  def edit
  end

  def perfect(z) 
    if z.empty?
      @pefect = true
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
          

    respond_to do |format|
      if @post.save
        @rule = Rule.find_by(id: @post.rule_id)
        @topic = @rule.topic
        @statement = @rule.statement
        @keywords = @rule.keywords.gsub(",", "").split(' ')
        
        a = @rule.keywords.gsub(",", "").split(' ')
        b = @post.content.downcase.gsub(",", "")
        c = b.split(" ")
        z = a - c
                
        if z.empty?
          format.html { redirect_to new_post_path(:topic => @topic), notice: 'CORRECT! ' + @keywords.to_s }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { redirect_to @post, notice: 'INCORRECT! Keywords required:' }
          format.json { render action: 'show', status: :created, location: @post }
        end
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      #@topic = Post.find(params[:topic])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :rule_id)
    end
end
