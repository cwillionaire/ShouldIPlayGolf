require 'rails_helper'

feature 'Should I Play Golf?', js: true do
  let!(:fixture) { JSON.parse(File.read("spec/fixtures/test/response.json")) }

  before(:each) do
    visit root_path
  end

  context 'when navigating to the home page' do
    scenario 'you see a form to submit a zip code' do
      expect(page).to have_css('#zip-code-input')
      expect(page).to have_button('Should I Play Golf?')
    end
  end

  context 'when submitting form' do
    scenario 'you get an image of the current conditions' do
      expect(Wunderground::Resources).to receive(:method_missing).and_return(fixture)
      fill_in('zip-code-input', with: '10001')
      click_button('Should I Play Golf?')
      expect(page).to have_selector('img')
    end
  end
end
