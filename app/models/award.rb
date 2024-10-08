# == Schema Information
#
# Table name: awards
#
#  id            :integer          not null, primary key
#  award_amount  :integer          not null
#  filer_ein     :integer          not null
#  purpose       :text
#  recipient_ein :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  filing_id     :integer          not null
#
# Indexes
#
#  index_awards_on_filer_ein                    (filer_ein)
#  index_awards_on_filing_id                    (filing_id)
#  index_awards_on_recipient_ein                (recipient_ein)
#  index_awards_on_recipient_ein_and_filer_ein  (recipient_ein,filer_ein)
#

class Award < ApplicationRecord
  validates :award_amount, :filer_ein, :recipient_ein, :filing_id, presence: true

  belongs_to :recipient,
    class_name: :Recipient,
    foreign_key: :recipient_ein,
    primary_key: :ein

  belongs_to :filing, 
    class_name: :Filing,
    foreign_key: :filing_id,
    primary_key: :id

  belongs_to :filer,
    class_name: :Filer,
    foreign_key: :filer_ein,
    primary_key: :ein
end
