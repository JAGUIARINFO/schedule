require 'rails_helper'

RSpec.describe Booking, type: :model do
  context "Validade de um Agendamento (Booking)" do
    it "Agendamendo inVálido" do
      booking = Booking.new
      booking.user_id = 1
      booking.datareserva = Date.today
      booking.horareserva = 0
      booking.descricao = ''

      expect(booking.valid?).to be_falsey
    end
  end
end
