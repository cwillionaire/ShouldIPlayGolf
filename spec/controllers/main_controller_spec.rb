require 'rails_helper'

describe MainController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let!(:fixture) { JSON.parse(File.read("spec/fixtures/test/response.json")) }

    it "responds successfully with an HTTP 200 status code" do
      expect(Wunderground::Resources).to receive(:method_missing).and_return(fixture)
      xhr :get, :show, zip_code: '10001', format: :js
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      expect(Wunderground::Resources).to receive(:method_missing).and_return(fixture)
      xhr :get, :show, zip_code: '10001', format: :js
      expect(response).to render_template('show')
    end

    it "assigns the forecast object" do
      expect(Wunderground::Resources).to receive(:method_missing).and_return(fixture)
      xhr :get, :show, zip_code: '10001', format: :js
      expect(assigns(:forecast)).to eq fixture
    end
  end
end
