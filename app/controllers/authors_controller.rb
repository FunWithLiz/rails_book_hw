class AuthorsController < ApplicationController

    def index
        render json: { authors: Author.all}
    end

    def show
        id = params[:id]
        render json: {author: Author.find(id)}
    end

    def create
        author = Author.create! author_params
        render json: {author: author}
    end

    def update
        id = params[:id]
        author = Author.find(id).update! author_params
        render json: { author: author }
    end

    def destroy
        id = params[:id]
        author = Author.find(id).destroy
        render json: { message: "It's been deleted!"}
    end


    private

    def author_params
        params.require(:author_data).permit(:first_name, :last_name)
    end

end
