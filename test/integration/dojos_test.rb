require 'test_helper'

class DojosTest < ActionDispatch::IntegrationTest
  test 'should insert dojo' do
    visit root_url
    click_link('Novo dojo')
    fill_in('Local', with: 'Faculdade XPTO')
    click_button('Salvar')
    within('h2') do
      assert has_content? 'Dojo Faculdade XPTO'
    end
  end

  test 'should back to homepage' do
    visit root_url
    click_link('Novo dojo')
    click_link('Cancelar')
    within('h1') do
      assert has_content? 'Dojo, aonde?'
    end
  end

  test 'should go to list page after insert' do
    visit root_url
    click_link('Novo dojo')
    fill_in('Local', with: 'Faculdade XPTO')
    click_button('Salvar')
    click_link('Voltar')
    within('h2') do
      assert has_content? 'Dojos cadastrados'
    end
  end

  test 'should list dojos' do
    visit root_url
    click_link('Novo dojo')
    fill_in('Local', with: 'Faculdade XPTO')
    click_button('Salvar')
    click_link('Voltar')
    within('table tr td') do
      assert has_content? 'Faculdade XPTO'
    end
  end
end