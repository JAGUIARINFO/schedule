require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validade de um Usuário" do
    it "Usuário Válido" do
      user = User.new
      user.name = "Teste"
      user.email = "teste@teste.com"
      user.password = "123456"

      expect(user.valid?).to be_truthy
    end
  end
end
