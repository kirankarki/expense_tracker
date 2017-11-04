class ImageUploader < Shrine
    include ImageProcessing::MiniMagick

    plugin :determine_mime_type
    plugin :logging, logger: Rails.logger
    plugin :remove_attachment
    plugin :store_dimensions
    plugin :validation_helpers
    plugin :versions, names: %i[original large_thumb small_thumb]

    Attacher.validate do
        validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
        validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    end

    def process(io, context)
        case context[:phase]
        when :store
            large_thumb = resize_to_limit!(io.download, 200, 200)
            small_thumb = resize_to_limit!(io.download, 25, 25)
            { original: io, large_thumb: large_thumb, small_thumb: small_thumb }
        end
    end
end