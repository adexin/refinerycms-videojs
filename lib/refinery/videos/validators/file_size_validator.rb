module Refinery
  module Videos
    module Validators
      class ImageSizeValidator < ActiveModel::Validator

        def validate(record)
          file = record.file

          if file.respond_to?(:length) && file.length > Refinery::Videos.max_image_size
            record.errors[:file] << ::I18n.t('too_big',
                                             :scope => 'activerecord.errors.models.refinery/image',
                                             :size => Refinery::Videos.max_image_size)
          end
        end

      end
    end
  end
end
