class StaticController < ApplicationController
  before_action :require_user, only: [:tracking]
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

  def tos
  end

  def pp
  end 
end
