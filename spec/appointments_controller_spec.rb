require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let(:appointment) { create(:appointment) }

  describe "GET #index" do
    it "assigns all appointments as @appointments" do
      appointment
      get :index
      expect(assigns(:appointments)).to eq([appointment])
    end
  end

  describe "GET #show" do
    it "assigns the requested appointment as @appointment" do
      get :show, params: {id: appointment.to_param}
      expect(assigns(:appointment)).to eq(appointment)
    end
  end

  describe "GET #new" do
    it "assigns a new appointment as @appointment" do
      get :new
      expect(assigns(:appointment)).to be_a_new(Appointment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested appointment as @appointment" do
      get :edit, params: {id: appointment.to_param}
      expect(assigns(:appointment)).to eq(appointment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appointment" do
        expect {
          post :create, params: {appointment: attributes_for(:appointment)}
        }.to change(Appointment, :count).by(1)
      end

      it "assigns a newly created appointment as @appointment" do
        post :create, params: {appointment: attributes_for(:appointment)}
        expect(assigns(:appointment)).to be_a(Appointment)
        expect(assigns(:appointment)).to be_persisted
      end

      it "redirects to the created appointment" do
        post :create, params: {appointment: attributes_for(:appointment)}
        expect(response).to redirect_to(Appointment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appointment as @appointment" do
        post :create, params: {appointment: attributes_for(:appointment, title: nil)}
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {appointment: attributes_for(:appointment, title: nil)}
        expect(response).to render_template("new")
      end
    end
  end
end
