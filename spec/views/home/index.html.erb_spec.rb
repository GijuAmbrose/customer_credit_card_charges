require "spec_helper"
require "rails_helper"
require 'pry'

RSpec.describe 'index', type: :system do

  describe 'index page' do

    it 'success charges table exists' do
      visit root_path
      expect(page).to have_css('table.success')
    end

    it 'failed charges table exists' do
      visit root_path
      expect(page).to have_css ('table.failed')
    end

    it 'disputed charges table exists' do
      visit root_path
      expect(page).to have_css ('table.disputed')
    end

    it 'should have 10 success records' do
      visit root_path
      table = page.find(:css, 'table.success')
      row_count = table.all(:css, 'tr').size
      expect(row_count).to eq 10
    end

    it 'should have 5 failed records' do 
      visit root_path
      table = page.find(:css, 'table.failed')
      row_count = table.all(:css, 'tr').size
      expect(row_count).to eq 5
    end

    it 'should have 5 disputed records' do 
      visit root_path
      table = page.find(:css, 'table.disputed')
      row_count = table.all(:css, 'tr').size
      expect(row_count).to eq 5
    end
  end
end
