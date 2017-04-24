class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    authorize! :create, @document
    @document = Document.new
  end

  def create
    authorize! :create, @document
    @document = current_user.documents.create(document_params)
    if @document.save
      redirect_to documents_path
    else
      flash[:danger] = 'something wrong'
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    redirect_to documents_path
  end

  def show
    @document = Document.find(params[:id])
  end

  def index
    @documents = current_user.documents
  end

  private
  def document_params
    params.require(:document).permit(:title, :image)
  end
end
