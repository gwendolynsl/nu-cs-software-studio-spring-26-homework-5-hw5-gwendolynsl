require "rails_helper"

RSpec.describe "Todos index filtering", type: :request do
  it "filters todos by category param" do
    host! "www.example.com"

    Todo.create!(description: "Write report", category: "work")
    Todo.create!(description: "Buy milk", category: "personal")

    get todos_path, params: { category: "work" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report")
    expect(response.body).not_to include("Buy milk")
  end
end
