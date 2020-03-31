module Api
  module V1
    class PeopleController < ApiController
      before_action :set_person, only: [:show, :update, :destroy]

      # GET /api/v1/people
      def index
        @people = Person.paginate(page: params[:page])
        json_response({ status: :success, current_page: @people.current_page,
                       per_page: @people.per_page, total_entries: @people.total_entries,
                       data: @people })
      end

      def all
        @people = Person.all
        json_response({ status: :success, data: @people })
      end

      # GET /api/v1/people/1
      def show
        json_response({ status: :success, data: @person })
      end

      # POST /api/v1/people
      def create
        @person = Person.new(person_params)

        if @person.save
          json_response({ status: :success, data: @person }, :created)
        else
          json_response({ status: :unprocessable_entity, message: @person.errors,
                          data: {} }, :unprocessable_entity)
        end
      end

      # PATCH/PUT /api/v1/people/1
      def update
        if @person.update(person_params)
          json_response({ status: :success, data: @person }, :ok)
        else
          json_response({ status: :unprocessable_entity, message: @person.errors,
                          data: {} }, :unprocessable_entity)
        end
      end

      # DELETE /api/v1/people/1
      def destroy
        @person.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def person_params
        params.require(:person).permit(:rut, :name, :last_name, :age, :course)
      end
    end
  end
end
