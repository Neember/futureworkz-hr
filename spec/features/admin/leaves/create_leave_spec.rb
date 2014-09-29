require 'rails_helper'

describe 'Display New Leave form' do

  context 'Admin logged in' do
    let(:admin) { create(:admin) }
    let!(:staff) { create(:staff) }
    let!(:EMAIL_NOTIFIER) { create :setting, key: 'EMAIL_NOTIFIER', value: 'jack@futureworkz.com' }

    it 'Create new leave' do
      feature_login(admin)

      visit admin_leaves_path

      click_on 'Add New Leave'

      select 'Annual', from: 'Category'
      fill_in 'Reason', with: 'Lorem lorem'
      fill_in 'Note', with: 'Lorem lorem'
      get_element('fill-in-start-day-leave').set('10/09/2014')
      get_element('select-start-time').set('8:30')
      get_element('fill-in-end-day-leave').set('10/09/2014')
      get_element('select-end-time').set('17:30')
      fill_in 'Total', with: 1.0
      select staff.english_name, from: 'Staff'
      click_on 'Create Leave'

      expect(page).to have_content 'Leaves List'
      expect(page).to have_content 'Leave is successfully created.'
      expect(page).to have_content 'Lorem lorem'
    end
  end
end
