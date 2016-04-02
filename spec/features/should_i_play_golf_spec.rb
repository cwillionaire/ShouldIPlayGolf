require 'rails_helper'

feature 'Should I Play Golf?', js: true do
  let!(:fixture) { JSON.parse(File.read("spec/fixtures/test/response.json")) }

  before(:each) do
    visit root_path
  end

  context 'when navigating to the home page' do
    scenario 'you see a form to submit a zip code and tee time' do
      expect(page).to have_content('Should I Play Golf?')
      expect(page).to have_css('#location-input')
      expect(page).to have_css('#tee-time-input')
      expect(page).to have_button('Should I Play Golf?')
    end

    scenario 'google maps javascript api autocomplete available' do
      expect(page).to have_css('.pac-container', visible: false)
    end

    scenario 'you click the datetime picker image' do
      find('#calendar-addon').click
      expect(page).to have_css('.bootstrap-datetimepicker-widget')
    end
  end

  context 'when submitting form' do
    scenario 'you get an image of the current conditions' do
      expect(Wunderground::Resources).to receive(:method_missing).and_return(fixture)
      fill_in('location-input', with: 'a')
      fill_in('tee-time-input', with: 'Thursday, March 31, 2016 8:00 PM')
      click_button('Should I Play Golf?')
      expect(page).to have_selector('img')
    end
  end
end
