class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end
end
