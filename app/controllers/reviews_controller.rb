class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(reviews_params)
    @review.save
    redirect_to book_path(@book)
  end 
  
  private
  
  def reviews_params
    params.require(:review).permit(:impression)
  end
end
