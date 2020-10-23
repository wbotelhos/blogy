# frozen_string_literal: true

user = User.create!(
  email:                 'wbotelhos@example.com',
  name:                  'Washington Botelho',
  password:              'password',
  password_confirmation: 'password'
)

Lab.create!(
  analytics:    'UA-123-4',
  body:         "Usage: `$('div').raty();`",
  description:  'jQuery Raty - A Star Rating Plugin',
  keywords:     'jquery,raty',
  published_at: Time.current,
  slug:         'raty',
  title:        'jQuery Raty',
  version:      '1.0.0'
)

Lab.create!(
  analytics:    'UA-123-5',
  body:         "Usage: `$('textarea').taby();`",
  description:  'jQuery Taby - A Textarea Tabulator',
  keywords:     'jquery,taby',
  published_at: Time.current,
  slug:         'taby',
  title:        'jQuery Taby',
  version:      '1.0.0'
)

body = <<~HEREDOC
  Hi! My name is **Washington Botelho** and this article is an example to introduce how it works.

  ### Article

  We are using the [Markdown](http://daringfireball.net/projects/markdown/ "Markdown") syntaxe with help of the [Redcarpet](https://github.com/tanoku/redcarpet "Redcarpet") and [Pygments.rb](https://github.com/tmm1/pygments.rb "Pygments.rb") to make it colorized.

  You can apply a Ruby *Syntax Highlighting* in an block like the following:

  ```ruby
  def hello
    puts 'Hello Markdown!'
  end
  ```

  But if you want to write other language linke Java, feel free:

  ```java
  class Hello {

    public static void main(String args[]) {
      System.out.println("Hello Markdown!");
    }

  }
  ```

  ### Credentials

  By default my credentials is written here, but you can change it editing the file config/config.yml.

  ### License

  This blog is free under the MIT License, be nice and keep the author's credits. (:

  See you and your blog soon!
HEREDOC

user.articles.create!(body: body, published_at: Time.current, title: 'First Steps')
