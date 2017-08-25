require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:wiki) { create(:wiki) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
      
      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
 
      describe "Entry create" do
      it "increases the number of entries by 1" do
        expect{ post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph} }.to change(Wiki,:count).by(1)
      end

      it "assigns the new entry to @wiki" do
        post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new entry" do
        post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to [Wiki.last]
      end
    end
    
  describe "GET show" do
    it "returns http success" do
      get :show, {id: wiki.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: wiki.id}
      expect(response).to render_template :show
    end
 
    it "assigns wiki to @wiki" do
      get :show, {id: wiki.id}
      expect(assigns(:wiki)).to eq(wiki)
    end
  end
   
   
  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: wiki.id}
      expect(response).to have_http_status(:success)
    end
 
    it "renders the #edit view" do
      get :edit, {id: wiki.id}
      expect(response).to render_template :edit
    end
 
    it "assigns wiki to be updated to @wiki" do
      get :edit, {id: wiki.id}
 
      wiki_instance = assigns(:wiki)
      expect(wiki_instance.id).to eq wiki.id
      expect(wiki_instance.title).to eq wiki.title
      expect(wiki_instance.body).to eq wiki.body
    end
  end
  
  describe "PUT update" do
    it "updates wiki with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
 
      put :update, id: wiki.id, wiki: {title: new_title, body: new_body}
 
      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end
 
    it "redirects to the updated wiki" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
 
      put :update, id: wiki.id, wiki: {title: new_title, body: new_body}
      expect(response).to redirect_to wiki
    end
  end
  
   describe "DELETE destroy" do
    it "deletes the entry" do
      delete :destroy, {id: wiki.id}
      count = Wiki.where({id: wiki.id}).size
      expect(count).to eq 0
    end
 
    it "redirects to posts index" do
      delete :destroy, {id: wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end
end
