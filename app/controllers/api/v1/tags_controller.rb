module Api
  module V1
    class TagsController < ApplicationController
      before_action :tag, only: %i[show update destroy]
      before_action :authorize_tag, only: %i[show update destroy]

      #GET all
      def index
        @tags =
        FindTags.new.call(params).page(params[:page]).per(params[:per_page])
        authorize @tags
        render json: serializer(@tags)
      end

      #GET filter by id
      def show
        render json: serializer(@tag)
      end

      #POST create register
      def create
        @tag = Tag.new(tag_params)
        if @tag.save
          authorize @tag
          render json: serializer(@tag), status: :created
        else
          render json: @tag.errors, status: :unprocessable_entity #422
        end
      end

      #PUT update register
      def update
        if @tag.update(tag_params)
          render json: serializer(@tag)
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      #DELETE delete register
      def destroy
        @tag.destroy
      end

      private

      def tag
        @tag = Tag.find(params[:id])
      end

      #Function private
      def tag_params
        params.require(:tag).permit(:name, :color)
      end

      def serializer(object)
        TagSerializer.new(object).serializable_hash.to_json
      end

      def authorize_tag
        authorize @tag
      end
    end
  end
end
