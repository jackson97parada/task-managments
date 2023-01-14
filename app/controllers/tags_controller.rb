class TagsController < ApplicationController

  #GET all
  def index
    @tags = Tag.all
    render json: serializer(@tags)
  end
  
  #GET filter by id
  def show
    render json: serializer(tag)
  end

  #POST create register
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: serializer(@tag), status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity #422
    end
  end

  #PUT update register
  def update
    if tag.update(tag_params)    
      render json: serializer(tag)  
    else
      render json: tag.errors, status: :unprocessable_entity  
    end
  end

  #PUT update status
  def update_enabled    
    if tag.update(enable: !tag.enable)
      render json: serializer(tag)
    end
  end

  #DELETE delete register
  def destroy    
    tag.destroy
  end

  private

  #Function private
  def tag_params
    params.require(:tag).permit(:name, :color)
  end

  def tag
    Tag.find(params[:id])
  end

  def serializer(object)
    TagSerializer.new(object).serializable_hash.to_json
  end

end
