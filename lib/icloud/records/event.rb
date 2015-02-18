#!/usr/bin/env ruby
# vim: et ts=2 sw=2

module ICloud
  module Records
    class Event
      include Record
      has_fields(
        :title,
        :start_date,
        :local_start_date,
        :local_end_date,
        :end_date,
        :duration,
        :icon,
        :event_status,
        :etag,
        :guid,
        :p_guid,
        :all_day,
        :location,
        :tz
      )
      def initialize
        @alarms = []
      end

      #
      # Public: Returns true if this event is an all day.
      #
      def all_day?
        !! all_day
      end

      # When alarms are added to this event, wrap them in Alarm objects.
      # TODO: Replace this with a cast method.
      def alarms=(alarms)
        @alarms = alarms.map do |alarm|
          if alarm.is_a?(Hash)
            Alarm.from_icloud(alarm)
          else
            alarm
          end
        end
      end

      # If this event doesn't already have a guid (i.e. it hasn't been
      # persisted) yet, generate one the first time it's read.
      def guid
        @guid ||= ICloud.guid
      end

      # If this event doesn't have a parent GUID, assign it to the default
      # list the first time it's read.
      def p_guid
        @p_guid ||= "tasks"
      end
    end
  end
end
