# frozen_string_literal: true

module Lib
  module Notification
    def self.notify(message)
      %x{
        if ("Notification" in window) {
          if (Notification.permission === "granted") {
            new Notification(#{message});
          }
          else if (Notification.permission !== "denied") {
            Notification.requestPermission().then(function (permission) {
              if (permission === "granted") {
                new Notification(#{message});
              }
            });
          }
        }
      }
    end
  end
end
