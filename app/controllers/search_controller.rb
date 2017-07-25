class SearchController < ApplicationController
  def search
    query = params[:q] || '*'
    @result = Searchkick.search query, index_name: [Budget, Expense]
  end
end
