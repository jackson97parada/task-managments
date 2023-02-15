require 'rails_helper'

RSpec.describe "Tasks request", type: :request do
  let(:role) { create(:role) }
  let(:permissions) { %w[ view_task create_task update_task update_enabled_task destroy_task ] }
  let(:user) { create(:user, :with_role, role_name: role.name) }
  let(:headers) { valid_headers }
  let!(:tag) { create(:tag) }
  let!(:tasks) { create_list(:task, 3, tag_id: tag.id) }
  let(:task_id) { tasks.first.id }

  before do
    permissions.each do |permission|
      create(:permission_role, role_id: role.id, permission: permission)
    end
  end

  describe "GET /tasks" do
    before { get "/api/v1/tasks", headers: headers }

    it "return all tasks" do
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /tasks/:params" do
    let(:params) { tasks.first.title }
    before { get "/api/v1/tasks", params: { title: params }, headers: headers }

    it "return title" do
      expect(response_body[0]['attributes']['title']).to eq(params)
    end
  end

  describe "GET /tasks/:id" do
    before { get "/api/v1/tasks/#{task_id}", headers: headers }

    context "When the task exist" do

      it "return id" do
        expect(response_body['attributes']['id']).to eq(task_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the task does not exist" do
      let(:task_id) { -1 }

      it "return status code 404" do
        expect(response.status).to eq(404)
      end
    end
  end

  describe "POST /tasks" do
    let(:valid_attributes) { { title: "new task", start_date: Date.today, end_date: Date.today + 10.day, tag_id: tag.id }.to_json }
    before { post "/api/v1/tasks", params: valid_attributes, headers: headers }

    context "When the request is valid" do

      it "return title" do
        expect(response_body['attributes']["title"]).to eq("new task")
      end
    end
  end

  describe "PUT /tasks/:id" do
    let(:valid_attributes) { { title: "update task" }.to_json }
    before { put "/api/v1/tasks/#{task_id}", params: valid_attributes, headers: headers }

    context "When the request is valid" do

      it "return title" do
        expect(response_body['attributes']["title"]).to eq("update task")
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { title: "" }.to_json }
      before { put "/api/v1/tasks/#{task_id}", params: valid_attributes, headers: headers }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /tasks/:id/update_enabled" do
    before { put "/api/v1/tasks/#{task_id}/update_enabled", headers: headers }

    context "When the task exist" do

      it "return id" do
        expect(response_body['attributes']['id']).to eq(task_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the task does not exist" do
      let(:task_id) { -1 }

      it "return status code 404" do
        expect(response.status).to eq(404)
      end
    end
  end

  describe "DELETE /tasks/:id" do
    before { delete "/api/v1/tasks/#{task_id}", headers: headers }

    it "return status code 204" do
      expect(response.status).to eq(204)
    end
  end

end
