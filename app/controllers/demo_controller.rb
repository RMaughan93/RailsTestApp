class DemoController < ApplicationController
  
  layout 'application'

  def index
  end

  def hello
    #render('index')
    @array = [1,2,3,4,5]
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:action => 'index')
  end
#if user goes to 'localhost:3000/demo/lynda', this will redirect them to Lynda.com
  def lynda
    redirect_to("http://lynda.com")
  end

end

