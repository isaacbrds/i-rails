class Event < ApplicationRecord
    validates :name, presence: true
    validates :started_at, presence: true
    validates :finished_at, presence: true
    validate :if_started_is_in_future
    validate :if_finished_at_is_greater_than_start_at

    private 

    def if_finished_at_is_greater_than_start_at
        return unless finished_at
        return if finished_at > started_at

        errors.add(:finished_at, :invalid)
    end

    def if_started_is_in_future
        return unless started_at
        return unless started_at < Time.now

        errors.add(:started_at, :invalid)
    end

end
