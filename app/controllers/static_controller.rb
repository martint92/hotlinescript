class StaticController < ApplicationController
  def maintenance
  end

  def permission_error
    respond_to do |format|
      format.js
      format.html   
    end 
  end

  def tracking
  end 
end
