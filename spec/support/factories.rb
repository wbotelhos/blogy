FactoryGirl.define do
  factory :article, aliases: [:commentable] do
    association      :user
    body             'The Article'
    sequence(:title) { |i| "Title #{i}" }

    factory :article_published do
      published_at Time.local(1984, 10, 23)
    end
  end

  factory :comment do
    association      :commentable
    body             'body'
    sequence(:email) { |i| "john#{i}@example.org" }
    sequence(:name)  { |i| "John #{i}" }
    url              'http://example.org'

    factory :comment_answered do
      pending false
    end

    factory :comment_with_author do
      author true
      email  'author@example.org'
    end
  end

  factory :lab do
    body                 'body'
    description          'description'
    keywords             'key,words'
    sequence(:analytics) { |i| "UA-123-#{i}" }
    sequence(:slug)      { |i| "lab-#{i}" }
    sequence(:title)     { |i| "Lab #{i}" }
    version              '1.0.0'

    factory :lab_published do
      published_at Time.local(1984, 10, 23)
    end
  end

  factory :user do
    password              'password'
    password_confirmation 'password'
    sequence(:email)      { |i| "wbotelhos#{i}@gmail.com" }
  end
end
