require 'spec_helper'

class Account < ActiveRecord::Base
  include UpdateCardinalsBy

  def update_by!(attributes)
    update_cardinals_by!(attributes) do |res|
      if res[:credits] && res[:credits] < 0
        fail 'Credits dropped below 0'
      end
    end
  rescue => e
    e
  end
end

describe UpdateCardinalsBy do
  let(:account) { Account.create credits: 100, money: 12.34 }

  describe 'update_cardinals_by!' do
    it 'accepts positive change' do
      account.update_by!(credits: 20, money: 3.16)
      expect(account.credits).to eq 120
      expect(account.money).to eq 15.50
    end

    it 'accepts negative change' do
      account.update_by!(credits: -20, money: -1.24)
      expect(account.credits).to eq 80
      expect(account.money).to eq 11.10
    end

    it 'leaves leaves the instance in a saved state' do
      account.update_by!(credits: 20, money: 3.16)
      expect(account.changed?).to be_falsy
    end

    it 'reverts the value when the block throws an error' do
      account.update_by!(credits: -200)
      expect(account.credits).to eq 100
      expect(account.reload.credits).to eq 100
    end
  end
end