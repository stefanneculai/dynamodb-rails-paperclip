# encoding: utf-8

require "dynamo/paperclip/version"

begin
  require 'paperclip'
rescue LoadError
  puts "Dynamo::Paperclip requires that you install the Paperclip gem."
  exit
end

begin
  require 'dynamodb-rails'
rescue LoadError
  puts "Dynamo::Paperclip requires that you install the dynamodb-rails gem."
  exit
end

module Dynamo
  module Paperclip

    ##
    # Extends the model with the defined Class methods
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      ##
      # Adds Dynamo::Paperclip's "#has_dynamo_attached_file" class method to the model
      # which includes Paperclip and Paperclip::Glue in to the model. Additionally
      # it'll also add the required fields for Paperclip since DynamoDB is schema-less and doesn't
      # have migrations.
      def has_dynamo_attached_file(field, options = {})

        ##
        # Include Paperclip and Paperclip::Glue for compatibility
        unless self.ancestors.include?(::Paperclip)
          include ::Paperclip
          include ::Paperclip::Glue
        end

        ##
        # Invoke Paperclip's #has_attached_file method and passes in the
        # arguments specified by the user that invoked Dynamoid::Paperclip#has_dynamoid_attached_file
        has_attached_file(field, options)

        ##
        # Define the necessary collection fields in Dynamoid for Paperclip
        field(:"#{field}_file_name")
        field(:"#{field}_content_type")
        field(:"#{field}_file_size", :N)
        field(:"#{field}_updated_at", :D)
      end
    end

  end
end

