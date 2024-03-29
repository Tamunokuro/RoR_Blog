require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'get index action' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success message' do
      expect(response.body).to match(/Posts/)
    end

    it 'returns a index template' do
      expect(response).to render_template('index')
    end
  end

  context 'get show action' do
    before(:each) do
      get '/users/1/posts/1'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success message' do
      expect(response.body).to match(/Post/)
    end

    it 'returns a show template' do
      expect(response).to render_template('show')
    end
  end
end
