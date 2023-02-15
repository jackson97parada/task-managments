module Api
  module V1
    class EnterprisesController < ApplicationController
      before_action :enterprise, only: %i[show update destroy]
      before_action :authorize_enterprise, only: %i[show update destroy]
      # GET all
      def index
        @enterprises =
        FindEnterprises.new.call(params).page(params[:page]).per(params[:per_page])
        authorize @enterprises
        render json: serializer(@enterprises)
      end

      #GET filter by id
      def show
        render json: serializer(@enterprise)
      end

      #POST create register
      def create
        @enterprise = Enterprise.new(enterprise_params)
        if @enterprise.save
          authorize @enterprise
          render json: serializer(@enterprise), status: :created
        else
          render json: @enterprise.errors, status: :unprocessable_entity #422
        end
      end

      #PUT update register
      def update
        if @enterprise.update(enterprise_params)
          render json: serializer(@enterprise)
        else
          render json: @enterprise.errors, status: :unprocessable_entity
        end
      end

      #DELETE delete register
      def destroy
        @enterprise.destroy
      end

      private

      #function private
      def enterprise
        @enterprise = Enterprise.find(params[:id])
      end

      #function private
      def enterprise_params
        params.require(:enterprise).permit(:nit, :address, :mobile, :user_id)
      end

      def serializer(object)
        EnterpriseSerializer.new(object).serializable_hash.to_json
      end

      def authorize_enterprise
        authorize @enterprise
      end
    end
  end
end
