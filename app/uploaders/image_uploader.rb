class ImageUploader < Shrine
 Attacher.validate do
   validate_mime_type %w[image/jpeg image/png]
   validate_max_size  110241024
 end
end