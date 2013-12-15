# coding: utf-8

require 'spec_helper'

describe Article, '#show' do
  let(:article) { FactoryGirl.create :article_published }

  before { visit slug_path article.slug }

  it 'shows the title' do
    within 'header' do
      expect(page).to have_link article.title
    end
  end

  it 'shows published date' do
    within 'header' do
      expect(page).to have_content "#{article.published_at.day} de Outubro de #{article.published_at.year}"
    end
  end

  it 'shows twitter button', :focus do
    expect(page).to have_link 'Tweet'
  end

  context 'clicking on title' do
    before { click_link article.title }

    it 'sends to the same page' do
      expect(current_path).to eq "/#{article.slug}"
    end
  end

  it 'redirects to show page' do
    expect(current_path).to eq "/#{article.slug}"
  end

  it 'does not display edit link' do
    within 'header' do
      expect(page).to_not have_link 'Editar'
    end
  end

  context 'trying to access an inexistent record' do
    before { visit slug_path 'invalid' }

    it 'redirects to root page' do
      expect(current_path).to eq root_path
    end

    it 'display not found message' do
      expect(page).to have_content 'O artigo "invalid" não foi encontrado!'
    end
  end

  context 'when logged' do
    before do
      login
      visit slug_path article.slug
    end

    it 'does not display edit link' do
      within 'header' do
        expect(page).to have_link 'Editar'
      end
    end
  end
end
