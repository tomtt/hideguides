require 'oauth/signature/base'

module OAuth::Signature
  class PLAINTEXT < Base
    implements 'plaintext'

    def signature
      signature_base_string
    end

    def ==(cmp_signature)
      signature == cmp_signature
    end

    def signature_base_string
      secret
    end
  end
end
