
describe SettingsController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all settings to @settings' do
      setting = create(:setting)
      get :index
      expect(assigns(:settings)).to eq([setting])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      setting = create(:setting)
      get :show, params: { id: setting.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested setting to @setting' do
      setting = create(:setting)
      get :show, params: { id: setting.to_param }
      expect(assigns(:setting)).to eq(setting)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new setting to @setting' do
      get :new
      expect(assigns(:setting)).to be_a_new(Setting)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Setting' do
        expect {
          post :create, params: { setting: attributes_for(:setting) }
        }.to change(Setting, :count).by(1)
      end

      it 'redirects to the created setting' do
        post :create, params: { setting: attributes_for(:setting) }
        expect(response).to redirect_to(Setting.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Setting' do
        expect {
          post :create, params: { setting: { name: '' } }
        }.to change(Setting, :count).by(0)
      end

      it 'renders the new template' do
        post :create, params: { setting: { name: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      setting = create(:setting)
      get :edit, params: { id: setting.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested setting to @setting' do
      setting = create(:setting)
      get :edit, params: { id: setting.to_param }
      expect(assigns(:setting)).to eq(setting)
    end
  end
end