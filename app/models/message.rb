class Message < ActiveRecord::Base
  has_many :translated_messages

  belongs_to :room

  attr_accessor :content

  before_save do
    @translator = MicrosoftTranslator::Client.new(ENV['MICROSOFT_CLIENT_ID'], ENV['MICROSOFT_CLIENT_SECRET'])

    translated_messages.new posted_message
    translated_messages.new translated_message
  end

  private

  def posted_message
    {
      language: posted_language,
      content:  content
    }
  end

  def posted_language
    @translator.detect(content)
  end

  def translated_message
    {
      language: translated_language,
      content:  @translator.translate(content, posted_language, translated_language, 'text/plain')
    }
  end

  def translated_language
    posted_language == 'ja' ? 'en' : 'ja'
  end
end
