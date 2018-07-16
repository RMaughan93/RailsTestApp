class SubjectsController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted

  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'default'})
    @subject_count = Subject.count + 1
  end

  def create
    pp "============="
    pp params[:subject]
    @subject = Subject.new({
      name: params[:subject][:name], 
      position: params[:subject][:position].to_i,
      visibile: params[:subject][:visibile] ? true : false
    })

    if @subject.save
      flash[:notice] = 'Subject created sucessfully'
      redirect_to(:action => 'index')
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = 'Subject updated sucessfully'
      redirect_to(:action => 'show', :id => @subject.id)
      #flash[:alert] = 'shit'
    else
      @subject_count = Subject.count
      render('edit')
      #flash[:alert] = 'shat'
    end
  end


  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject #{@subject.name} destroyed sucessfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_params 
      params.require(:subject).permit(:name, :position, :visibile, :created_at)
    end

end
